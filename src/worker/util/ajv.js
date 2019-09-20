import Ajv from 'ajv';

import common from '../../schemas/common.schema.json';
import config from '../../schemas/config.schema.json';
import model from '../../schemas/model.schema.json';
import rule from '../../schemas/rule.schema.json';

const ajv = new Ajv({
  allErrors: true,
});

ajv.addSchema(common, 'common');
ajv.addSchema(config, 'config');
ajv.addSchema(model, 'model');
ajv.addSchema(rule, 'rule');

export default ajv;
