import path from 'path';
import { readdir, stat, readJson } from 'fs-extra';
import { filter, forEach } from '../util/async';
import serializableError from '../util/serializable-error';
import ajv from '../util/ajv';

export default async function loadRules(base) {
  const files = await readdir(base);
  const folders = await filter(files, async file =>
    (await stat(path.resolve(base, file))).isDirectory());

  const rules = [];
  const errors = [];

  await forEach(folders, async (folder) => {
    try {
      const jsonPath = path.resolve(base, folder, `${folder}.json`);

      const rule = await readJson(jsonPath);

      if (!ajv.validate('rule', rule)) {
        throw new Error(`${folder}.json exists but doesn't validate against rule schema: ${ajv.errorsText()}`);
      }

      rules.push(rule);
    } catch (e) {
      errors.push({
        rule: folder,
        ...serializableError(e),
      });
    }
  });

  return {
    rules,
    errors,
  };
}
