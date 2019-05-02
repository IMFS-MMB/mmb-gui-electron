/* global describe, it, before */

import { assert } from 'chai';

import { ajv, rules, validate } from './utils/rules';

function ruleTests(model) {
  describe(`${model.internal_name}`, () => {
    it('.json passes validation', () => {
      assert.equal(validate(model), true, ajv.errorsText(validate.errors));
    });
  });
}

describe('Common Rules', () => {
  rules.forEach(rule => ruleTests(rule));
});
