import fs from 'fs';
import { promisify } from 'util';
import path from 'path';

const readFile = promisify(fs.readFile);
const readDir = promisify(fs.readdir);

function parseOutput(json) {
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

  const outputs = await Promise.all(files
    .filter(file => file.endsWith('.json'))
    .map(file => readFile(path.join(folder, file), { encoding: 'utf8' })));

  return outputs.map(json => parseOutput(json));
}
