// eslint-disable-next-line no-unused-vars
/* global describe, it, before, beforeEach, after, chai */

import { assert } from 'chai';

import getBackend from './utils/backend';

function commonTests(backend) {
  it('can launch and detect version', async () => {
    const pattern = /\d+\.\d+\.\d+/;
    const version = await backend.getVersion();

    assert.match(version, pattern);
  });
}

describe('Matlab/Octave', () => {
  const octave = getBackend('octave');
  const matlab = getBackend('matlab');

  if (octave) {
    describe('Octave', () => {
      commonTests(octave);
    });
  }

  if (matlab) {
    describe('Matlab', () => {
      commonTests(matlab);
    });
  }
});
