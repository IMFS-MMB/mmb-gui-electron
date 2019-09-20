/* eslint-disable import/no-dynamic-require */

import { join } from 'path';
import glob from 'glob';
import { rulesFolder } from '../../src/config/paths';

const files = glob.sync('*/*.json', {
  cwd: rulesFolder,
});

const rules = files
  .filter(file => /^([^/]*)\/\1\.json$/.test(file))
  .map(file => require(join(rulesFolder, file)));

export default rules;
