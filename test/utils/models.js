/* eslint-disable import/no-dynamic-require */

import { join } from 'path';
import glob from 'glob';
import { staticModelsFolder as modelsFolder } from '../../src/config/paths';
import fs from 'fs-extra';
import path from 'path';

const files = glob.sync('*/*.json', {
  cwd: modelsFolder,
});

export const models = files
  .filter(file => /^([^/]*)\/\1\.json$/.test(file))
  .map(file => require(join(modelsFolder, file)));

export function getModFile(modelname) {
  return fs.readFileSync(path.join(modelsFolder, modelname, `${modelname}.mod`), { encoding: 'utf8' });
}
