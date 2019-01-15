import commandExists from 'command-exists';
import { promisify } from 'util';
import _glob from 'glob';
import commonExecutables from '@/data/common-executables';
import { isExecutable } from './is-executable';
import logger from '../logger';
import { create } from './interface';

const glob = promisify(_glob);

async function isExecutableOrCommand(path) {
  try {
    if (await commandExists(path)) {
      return true;
    }
  } catch (e) {
    logger.info(e);
  }

  return isExecutable(path);
}

export async function getExecutableInfo(exe) {
  logger.info(`testing path '${exe.path}'`);

  const result = {
    ...exe,
    isExecutable: false,
    ver: 'unknown version',
  };

  result.isExecutable = await isExecutableOrCommand(exe.path);

  if (result.isExecutable) {
    logger.info(`'${exe.path}' is executable`);

    try {
      const backend = create({
        ...exe,
        cwd: '/',
      });

      result.ver = await backend.getVersion();
    } catch (e) {
      logger.info(e);
      result.ver = 'unknown version';
    }
  } else {
    logger.info(`'${exe.path}' is NOT executable`);
  }

  return result;
}

export async function findExecutables() {
  const result = [];

  /* eslint-disable */

  for (const exe of commonExecutables) {
    if (glob.hasMagic(exe.path)) {
      const paths = await glob(exe.path, {
        absolute: true,
        cwd: '/',
        silent: true,
        strict: false
      });

      for (const path of paths) {
        result.push(await getExecutableInfo({
          ...exe,
          path
        }));
      }
    } else {
      result.push(await getExecutableInfo(exe));
    }
  }

  return result.filter(exe => exe.isExecutable);
}
