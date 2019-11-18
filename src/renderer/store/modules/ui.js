const namespaced = true;

const state = {
  canTouch: false,
  canHover: false,
};

const getters = {
  canTouch(state) {
    return state.canTouch;
  },
  canHover(state) {
    return state.canHover;
  },
  popoverTriggers(state) {
    if (state.canHover) {
      return 'hover';
    }

    return 'focus';
  },
  tooltipTriggers(state) {
    if (state.canHover) {
      return 'hover';
    }

    return 'focus';
  },
};

const mutations = {
  setCanTouch(state) {
    state.canTouch = true;
  },
  setCanHover(state) {
    state.canHover = true;
  },
};

const actions = {
  userHasTouched({ commit }) {
    commit('setCanTouch');
    console.log('user has touched');
  },
  userHasMovedMouse({ commit }) {
    commit('setCanHover');
    console.log('user has moved mouse');
  },
};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
