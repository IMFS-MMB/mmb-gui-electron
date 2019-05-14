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
      default:
        return value;
    }
  });
}

export default async function readOutput(folder) {
  const files = await readDir(folder);

  const outputs = await Promise.all(files.map(file => readFile(path.join(folder, file), { encoding: 'utf8' })));

  return outputs.reduce((acc, json) => [...acc, ...parseOutput(json)], []);
}
