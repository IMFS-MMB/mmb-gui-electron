import path from 'path';
import { readdir, stat, exists, readJson } from 'fs-extra';
import { filter, forEach } from '../util/async';
import serializableError from '../util/serializable-error';
import ajv from '../util/ajv';

export default async function loadModels(base) {
  const files = await readdir(base);
  const folders = await filter(files, async file =>
    (await stat(path.resolve(base, file))).isDirectory());

  const models = [];
  const errors = [];

  await forEach(folders, async (folder) => {
    try {
      const jsonPath = path.resolve(base, folder, `${folder}.json`);
      const modPath = path.resolve(base, folder, `${folder}.mod`);

      const modExists = await exists(modPath, { encoding: 'utf8' });
      const jsonExists = await exists(jsonPath, { encoding: 'utf8' });

      if (!jsonExists) {
        throw new Error(`${folder} found, but ${folder}.json doesn't exist`);
      }

      if (!modExists) {
        throw new Error(`${folder} found, but ${folder}.mod doesn't exist`);
      }

      const model = await readJson(jsonPath);

      if (!ajv.validate('model', model)) {
        throw new Error(`${folder}.json exists but doesn't validate against model schema: ${ajv.errorsText()}`);
      }

      models.push(model);
    } catch (e) {
      errors.push({
        model: folder,
        ...serializableError(e),
      });
    }
  });

  return {
    models,
    errors,
  };
}
