import Vue from 'vue';

const namespaced = true;

const state = {
  params: [],
};

const getters = {
  params(state) {
    return state.params;
  },
};

const mutations = {
  setParams(state, data) {
    const items = data.map(d => +d); // convert to number
    Vue.set(state, 'params', items);
  },
};

const actions = {

};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
