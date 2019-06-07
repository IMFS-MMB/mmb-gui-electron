import fs from 'fs';
import { promisify } from 'util';
import path from 'path';

const readFile = promisify(fs.readFile);
const readDir = promisify(fs.readdir);
const fileExists = promisify(fs.exists);

async function readJsonFile(folder, file) {
  const filepath = path.join(folder, file);

  if (!(await fileExists(filepath))) {
    return null;
  }

  const json = await readFile(filepath, { encoding: 'utf8' });

  return JSON.parse(json, (key, value) => {
    switch (value) {
      case '_Inf_':
        return Infinity;
      case '-_Inf_':
        return -Infinity;
      case '_NaN_':
        return NaN;
      default:
        return value;
    }
  });
}

export default async function readOutput(folder) {
  const files = await readDir(folder);
  const dataFiles = files.filter(file => file.endsWith('.output.json'));

  const data = await Promise.all(dataFiles.map(file => readJsonFile(folder, file)));

  const error = await readJsonFile(folder, 'error.json');

  return {
    data,
    error,
  };
}
