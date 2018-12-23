const namespaced = true;

const state = {
  params: require('@/data/params'),
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
