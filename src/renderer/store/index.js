import Vue from 'vue';
import Vuex from 'vuex';

import models from './modules/models';
import search from './modules/search';
import settings from './modules/settings';
import comparison from './modules/comparison';
import rules from './modules/rules';
import params from './modules/params';

import { modules, plugins } from './store.PLATFORM';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    search,
    settings,
    comparison,
    models,
    rules,
    params,

    ...modules,
  },
  plugins: [
    ...plugins,
  ],
});

export default store;
