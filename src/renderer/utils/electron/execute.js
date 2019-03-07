import { spawn } from 'cross-spawn';
import { addBreadcrumb } from '@sentry/electron';

/**
 * Runs an executable
 */
export default async function execute(path, cwd, args, onData, onError) {
  return new Promise((resolve, reject) => {
    try {
      // todo sanitize paths instead of omitting them completely
      addBreadcrumb({
        type: 'spawn',
        data: {
          // path,
          args,
          // cwd,
        },
      });

      const child = spawn(path, args, {
        cwd,
      });

      child.stdout.on('data', (data) => {
        if (onData) {
          onData(data);
        }
      });

      child.stderr.on('error', (err) => {
        if (onError) {
          onError(err);
        }
      });

      child.on('close', async (code /* signal */) => {
        if (code === 0) {
          resolve(code);
        } else {
          reject(code);
        }
      });
    } catch (err) {
      reject(err);
    }
  });
}
