import params from '@/data/params';

const namespaced = true;

const state = {
  params,
};

const getters = {
  params(state) {
    return state.params;
  },
};

const mutations = {};

const actions = {};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
