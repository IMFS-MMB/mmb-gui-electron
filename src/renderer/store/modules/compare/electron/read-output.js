import path from 'path';
import { exists, readdir, readFile } from 'fs-extra';

async function readJsonFile(folder, file) {
  const filepath = path.join(folder, file);

  if (!(await exists(filepath))) {
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
  const files = await readdir(folder);
  const dataFiles = files.filter(file => file.endsWith('.output.json'));

  const data = await Promise.all(dataFiles.map(file => readJsonFile(folder, file)));

  const error = await readJsonFile(folder, 'error.json');

  return {
    data,
    error,
  };
}
