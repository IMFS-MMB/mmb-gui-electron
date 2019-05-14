import rules from '@/data/common_rules';

const namespaced = true;

const state = {
  rules,
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
