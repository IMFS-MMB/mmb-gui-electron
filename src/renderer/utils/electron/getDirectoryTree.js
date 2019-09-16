import fs from 'fs';
import path from 'path';

function foldersFirst(items) {
  const files = [];
  const folders = [];

  items.forEach(item => (item.type === 'file' ? files : folders).push(item));

  return folders.concat(files);
}

// adoption from https://gist.github.com/sdras/f5665c5bcd98b48b4a3a9aed1312fd37
export default function getDirectoryTree(base) {
  function recurse(filename) {
    const stats = fs.lstatSync(filename);
    const info = {
      path: filename,
      name: path.basename(filename),
    };

    if (stats.isDirectory()) {
      info.type = 'folder';

      const children = fs.readdirSync(filename).map(child => recurse(`${filename}/${child}`));

      info.children = foldersFirst(children);
    } else {
      info.type = 'file';
    }

    return info;
  }

  return recurse(base);
}
