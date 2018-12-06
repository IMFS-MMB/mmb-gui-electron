const namespaced = true;

const state = {
  rules: [
    // {
    //   id: 1,
    //   text: 'User specified Rule',
    // },
    // {
    //   id: 2,
    //   text: 'Model specific Rule',
    // },
    ...require('../../data/_data').commonRules,
  ],
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
