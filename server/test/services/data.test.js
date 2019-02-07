const assert = require('assert');
const app = require('../../src/app');

describe('\'data\' service', () => {
  it('registered the service', () => {
    const service = app.service('data');

    assert.ok(service, 'Registered the service');
  });
});
