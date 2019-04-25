/* global describe, it */

import { ajv, models, validate } from './utils/models';

const assert = require('assert');

describe('Models', () => {
  models.forEach((model) => {
    describe(model.internal_name, () => {
      it(`${model.internal_name}.json passes validation`, () => {
        const pass = validate(model);

        assert.ok(pass, ajv.errorsText(validate.errors));
      });
    });
  });
});

