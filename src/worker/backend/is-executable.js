import { stat } from 'fs-extra';

function hasExecPermissions(mode, gid, uid) {
  if (process.platform === 'win32') {
    return true;
  }

  try {
    const isGroup = gid ? process.getgid && gid === process.getgid() : true;
    const isUser = uid ? process.getuid && uid === process.getuid() : true;

    // eslint-disable-next-line no-bitwise
    return Boolean((mode & 0o0001) || ((mode & 0o0010) && isGroup) || ((mode & 0o0100) && isUser));
  } catch (e) {
    return false;
  }
}

export default async function isExecutable(path) {
  try {
    const stats = await stat(path);

    return stats && stats.isFile() && hasExecPermissions(stats.mode, stats.gid, stats.uid);
  } catch (e) {
    return false;
  }
}
