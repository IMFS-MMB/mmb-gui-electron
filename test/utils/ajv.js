import Ajv from 'ajv';
import fs from 'fs';
import { join } from 'path';
import { schemasFolder } from '../../config/paths';

const ajv = new Ajv({
  allErrors: true,
});

const schemaPaths = fs.readdirSync(schemasFolder);

schemaPaths
  .filter(path => path.endsWith('.schema.json'))
  // eslint-disable-next-line import/no-dynamic-require
  .forEach(path => ajv.addSchema(require(join(schemasFolder, path))));

export default ajv;
