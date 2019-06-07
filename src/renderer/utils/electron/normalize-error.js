

export default function normalizeError(orig) {
  const {
    message, identifier: name, stack: origStack, backend, backendVersion, dynareVersion,
  } = orig;

  const stack = (Array.isArray(origStack) ? origStack[0] : [origStack]);

  return {
    name,
    message,
    backend,
    backendVersion,
    dynareVersion,
    stack,
  };
}
