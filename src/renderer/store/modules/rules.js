import worker from '../../../worker';

const namespaced = true;

const state = {
  rules: [],
  errors: [],
};

const getters = {
  ruleErrors(state) {
    return state.errors;
  },
  rules(state) {
    return state.rules;
  },
};

const mutations = {
  setRules(state, rules) {
    state.rules = [...rules];
  },
  setErrors(state, errors) {
    state.errors = [...errors];
  },
};

const actions = {
  async loadRules({ commit, rootGetters }) {
    const rulesFolder = rootGetters['settings/rulesFolder'];

    commit('setRules', []);
    commit('setErrors', []);

    try {
      const { rules, errors } = await worker.loadRules(rulesFolder);

      commit('setRules', rules);
      commit('setErrors', errors);
    } catch (e) {
      commit('setErrors', [e]);
    }
  },
};
export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
