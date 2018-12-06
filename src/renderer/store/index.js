import Vue from 'vue';
import Vuex from 'vuex';
import pick from 'lodash.pick';

import createPersistedState from './persisted-state';

import backends from './modules/backends';
import models from './modules/models';
import search from './modules/search';
import selections from './modules/selections';
import comparison from './modules/comparison';
import userrule from './modules/userrule';
import rules from './modules/rules';
import params from './modules/params';

Vue.use(Vuex);

function whitelistNamespaces(namespaces) {
  namespaces = Array.isArray(namespaces) ? namespaces : [namespaces];

  return mutation => namespaces.some(namespace => mutation.type.startsWith(namespace));
}

const store = new Vuex.Store({
  modules: {
    backends,
    search,
    selections,
    comparison,
    userrule,
    models,
    rules,
    params,
  },
  plugins: [
    createPersistedState({
      selectState: state => pick(state, ['backends', 'userrule', 'selections']),
      whitelist: whitelistNamespaces(['backends', 'userrule', 'selections']),
      storageName: 'mmb-electron-vuex',
      mergeOptions: {
        arrayMerge: (dest, src) => src,
      },
    }),
  ],
});

export default store;
