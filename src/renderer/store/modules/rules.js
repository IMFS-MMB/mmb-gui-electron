import worker from '../../../worker';

const namespaced = true;

const state = {
  rules: [],
  errors: [],
};

const getters = {
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
    commit('setRules', []);
    commit('setErrors', []);

    const rulesFolder = rootGetters['settings/rulesFolder'];

    let errors = [];
    let rules = [];

    if (process.env.IS_WEB) {
      const ctx = require.context('../../../../static/mmci-cli/rules', true, /^\.\/.*\/.*\.json$/);

      rules = ctx.keys().reduce((arr, key) => arr.concat(ctx(key)), []);
    } else {
      try {
        ({ errors, rules } = await worker.loadRules(rulesFolder));
      } catch (e) {
        errors = [e];
      }
    }

    commit('setRules', rules);
    commit('setErrors', errors);

    errors.forEach((err) => {
      window.vue.$bvToast.toast(`There was an error loading rule ${err.rule}:\n${err.message}`, {
        title: 'Rule Error',
        variant: 'danger',
      });
    });
  },
};
export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
