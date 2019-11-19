import Vue from 'vue';
import Vuex from 'vuex';

import models from './modules/models';
import search from './modules/search';
import options from './modules/options';
import comparison from './modules/comparison';
import rules from './modules/rules';
import params from './modules/params';
import ui from './modules/ui';

import { modules, plugins } from './store.PLATFORM';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    search,
    options,
    comparison,
    models,
    rules,
    params,
    ui,

    ...modules,
  },
  plugins: [
    ...plugins,
  ],
});

export default store;
