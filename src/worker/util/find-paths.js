import { promisify } from 'util';
import _glob from 'glob';
const glob = promisify(_glob);

export default async function findPaths(pattern) {
  return glob(pattern, {
    absolute: true,
    cwd: '/',
    silent: true,
    strict: false,
  });
}
