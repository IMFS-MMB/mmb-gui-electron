import { readdir, stat } from 'fs-extra';

export default async function isEmptyFolder(path) {
  const stats = await stat(path);

  if (!stats.isDirectory()) {
    return false;
  }

  const contents = await readdir(path);

  return !contents.length;
}
