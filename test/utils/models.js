/* eslint-disable import/no-dynamic-require */

import { join } from 'path';
import glob from 'glob';
import { staticModelsFolder as modelsFolder } from '../../src/config/paths';

const files = glob.sync('*/*.json', {
  cwd: modelsFolder,
});

const models = files
  .filter(file => /^([^/]*)\/\1\.json$/.test(file))
  .map(file => require(join(modelsFolder, file)));

export default models;
