import { readFile } from '@/utils/promisified';

export default async function readJsonFile(path, dirty = false) {
  const contents = await readFile(path, { encoding: 'utf8' });

  // todo: remove eval when output JSON is standard compliant.
  // eslint-disable-next-line no-eval
  return dirty ? eval(contents) : JSON.parse(contents);
}
