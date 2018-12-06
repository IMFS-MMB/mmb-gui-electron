const namespaced = true;

const state = {
  text: '',
};

const getters = {
  text(state) {
    return state.text;
  },
};

const mutations = {
  set(state, text) {
    state.text = text;
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
