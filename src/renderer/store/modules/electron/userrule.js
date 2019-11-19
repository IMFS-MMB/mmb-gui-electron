const namespaced = true;

const state = {
  params: [
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
  ],
};

const getters = {
  params(state) {
    return [...state.params];
  },
};

const mutations = {
  setParams(state, data) {
    state.params = [...data];
  },
};

const actions = {};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
