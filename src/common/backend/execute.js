import { spawn } from 'cross-spawn';
import logger from '../../renderer/utils/logger';

/**
 * Runs an executable
 */
export default async function execute(path, cwd, args, onData, onError) {
  return new Promise((resolve, reject) => {
    try {
      // // todo sanitize paths instead of omitting them completely
      // addBreadcrumb({
      //   type: 'spawn',
      //   data: {
      //     // path,
      //     args,
      //     // cwd,
      //   },
      // });

      logger.debug(JSON.stringify({ path, args, cwd }, null, 2));

      const child = spawn(path, args, {
        cwd,
      });

      child.stdout.on('data', (data) => {
        if (onData) {
          onData(data);
        }
      });

      child.stderr.on('error', (data) => {
        if (onError) {
          onError(data);
        }
      });

      child.on('close', async (code /* signal */) => {
        if (code === 0) {
          resolve(code);
        } else {
          reject(new Error(`Process quit with exit code ${code}.`));
        }
      });
    } catch (err) {
      reject(err);
    }
  });
}
