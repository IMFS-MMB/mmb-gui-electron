import commandExists from 'command-exists';
import { isExecutable } from './is-executable';
import commonExecutables from '../data/common-executables';
import logger from './logger';
import { create } from './interface';

async function isExecutableOrCommand(path) {
  try {
    if (await commandExists(path) || await isExecutable(path)) {
      return true;
    }
  } catch (e) {
    return false;
  }

  return false;
}

export async function getExecutableInfo(exe) {
  logger.info(`testing path '${exe.path}'`);

  const result = {
    ...exe,
    isExecutable: false,
    ver: 'unknown version',
  };

  result.isExecutable = await isExecutableOrCommand(exe.path);

  logger.info(`'${exe.path}' is ${result.isExecutable ? '' : 'NOT '}executable`);

  try {
    const backend = create({
      ...exe,
      cwd: '/',
    });

    result.ver = await backend.getVersion();
  } catch (e) {
    logger.warn(e);
    result.ver = 'unknown version';
  }

  return result;
}

export async function findExecutables() {
  const result = [];

  /* eslint-disable */

  for (const exe of commonExecutables) {
    const info = await getExecutableInfo(exe);

    if (info.isExecutable) {
      result.push(info);
    }
  }

  return result;
}
