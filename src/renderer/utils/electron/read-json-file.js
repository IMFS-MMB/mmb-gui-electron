import fs from 'fs';
import { promisify } from 'util';

const readFile = promisify(fs.readFile);

export default async function readJsonFile(path) {
  const contents = await readFile(path, { encoding: 'utf8' });

  return JSON.parse(contents);
}
