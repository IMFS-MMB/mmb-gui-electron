import { captureException, withScope } from '@sentry/electron';
import path from 'path';

function sanitizePath(file) {
  file = path.normalize(file);

  return `/_redacted_/${path.parse(file).base}`;
}

class BackendException extends Error {
  constructor(message, name, stack) {
    super(message);

    this.name = name;
    this.stack = [
      `BackendException ${name}: ${message}`,
      ...stack.map(call => `  at ${call.name}(${sanitizePath(call.file)}:${call.line}:${call.column || 0})`),
    ].join('\n');
  }
}

function getFingerprint(identifier, call) {
  const file = path.parse(call.file).base;
  return [`${file}:${identifier}`];
}

export default function captureBackendException(error) {
  const {
    message, name, stack, backend, backendVersion, dynareVersion,
  } = error;

  const ex = new BackendException(message, name, stack);

  withScope((scope) => {
    scope
      .setFingerprint(getFingerprint(name, stack[0]))
      .setTag(backend, backendVersion)
      .setTag('dynare', dynareVersion);

    captureException(ex);
  });
}
