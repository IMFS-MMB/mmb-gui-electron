/* eslint-disable import/no-dynamic-require */

import { join } from 'path';
import glob from 'glob';
import Ajv from 'ajv';
import { modelsSchemaPath, modelsFolder } from '../../config/paths';

export const ajv = new Ajv({
  allErrors: true,
});

const schema = require(modelsSchemaPath);
export const validate = ajv.compile(schema);

const files = glob.sync('*/*.json', {
  cwd: modelsFolder,
});

export const models = files
  .filter(file => /^([^/]*)\/\1\.json$/.test(file))
  .map(file => require(join(modelsFolder, file)));
