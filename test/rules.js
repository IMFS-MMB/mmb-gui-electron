/* global describe, it, before */

import { assert } from 'chai';

import { ajv, rules, validate } from './utils/rules';

function ruleTests(rule) {
  describe(`${rule.name}`, () => {
    it('.json passes validation', () => {
      assert.equal(validate(rule), true, ajv.errorsText(validate.errors));
    });
  });
}

describe('Common Rules', () => {
  rules.forEach(rule => ruleTests(rule));
});
