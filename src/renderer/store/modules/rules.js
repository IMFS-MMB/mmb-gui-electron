const namespaced = true;

const state = {
  rules: require('../../data/_commonRules'),
};

const getters = {
  rules(state) {
    return state.rules;
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
