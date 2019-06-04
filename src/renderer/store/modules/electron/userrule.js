import deepClone from 'lodash.clonedeep';

const namespaced = true;

const state = {
  params: [
    [NaN, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [NaN, 0, 0, 0],
    [NaN, 0, 0, 0],
    [NaN, 0, 0, 0],
    [NaN, 0, 0, 0],
  ],
};

const getters = {
  params(state) {
    return deepClone(state.params);
  },
};

const mutations = {
  setParams(state, data) {
    state.params = deepClone(data);
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
