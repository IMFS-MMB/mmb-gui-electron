/* eslint-disable import/no-dynamic-require */

import { join } from 'path';
import glob from 'glob';
import Ajv from 'ajv';
import { rulesSchemaPath, rulesFolder } from '../../config/paths';

export const ajv = new Ajv({
  allErrors: true,
});

const schema = require(rulesSchemaPath);
export const validate = ajv.compile(schema);

const files = glob.sync('*/*.json', {
  cwd: rulesFolder,
});

export const rules = files
  .filter(file => /^([^/]*)\/\1\.json$/.test(file))
  .map(file => require(join(rulesFolder, file)));
