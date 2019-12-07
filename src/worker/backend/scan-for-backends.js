import glob from 'glob';

import isExecutable from './is-executable';
import { create } from '../../common/backend/interface';
import { backends } from '../../config/paths';
import findPaths from '../util/find-paths';

export async function getExecutableInfo(exe) {
  const result = {
    ...exe,
    isExecutable: false,
    ver: 'unknown version',
  };

  if (await isExecutable(exe.path)) {
    try {
      const backend = create({
        ...exe,
        cwd: '/',
      });

      result.ver = await backend.getVersion();
      result.isExecutable = !!result.ver;
    } catch (e) {
      result.isExecutable = false;
    }
  }

  return result;
}

export async function scanForBackends() {
  const result = [];
  // eslint-disable-next-line no-restricted-syntax
  for (const exe of backends) {
    if (glob.hasMagic(exe.path)) {
      // eslint-disable-next-line no-await-in-loop
      const paths = await findPaths(exe.path);
      // eslint-disable-next-line no-restricted-syntax
      for (const path of paths) {
        // eslint-disable-next-line no-await-in-loop
        result.push(await getExecutableInfo({
          ...exe,
          path,
        }));
      }
    } else {
      // eslint-disable-next-line no-await-in-loop
      result.push(await getExecutableInfo(exe));
    }
  }

  return result.filter(exe => exe.isExecutable);
}
