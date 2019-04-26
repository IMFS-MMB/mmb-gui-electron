/* global describe, it */

import { assert } from 'chai';

import { ajv, models, validate } from './utils/models';

describe('Models', () => {
  models.forEach((model) => {
    describe(model.internal_name, () => {
      it(`${model.internal_name}.json passes validation`, () => {
        assert.equal(validate(model), true, ajv.errorsText(validate.errors));
      });
    });
  });
});

