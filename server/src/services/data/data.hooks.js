
// Hooks for service `data`. (Can be re-generated.)
const commonHooks = require('feathers-hooks-common');
// eslint-disable-next-line no-unused-vars
const dehydrate = require('./hooks/dehydrate');
// eslint-disable-next-line no-unused-vars
const hydrate = require('./hooks/hydrate');
// !code: imports // !end

// !<DEFAULT> code: used
// eslint-disable-next-line no-unused-vars
const { iff } = commonHooks;
// eslint-disable-next-line no-unused-vars
const { create, update, patch, validateCreate, validateUpdate, validatePatch } = require('./data.validate');
// !end

// !code: init // !end

let moduleExports = {
  before: {
    // !<> code: before
    all: [],
    find: [],
    get: [],
    create: [dehydrate()],
    update: [dehydrate()],
    patch: [dehydrate()],
    remove: []
    // !end
  },

  after: {
    // !<> code: after
    all: [
      hydrate()
    ],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
    // !end
  },

  error: {
    // !<DEFAULT> code: error
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
    // !end
  },
  // !code: moduleExports // !end
};

// !code: exports // !end
module.exports = moduleExports;

// !code: funcs // !end
// !code: end // !end
