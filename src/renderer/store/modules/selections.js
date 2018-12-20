const namespaced = true;

const state = {
  models: [],
  policyRules: [],
  shocks: [],
  outputVars: [],
};

const getters = {
  models(state) {
    return state.models;
  },
  policyRules(state) {
    return state.policyRules;
  },
  shocks(state) {
    return state.shocks;
  },
  outputVars(state) {
    return state.outputVars;
  },

  numModels(state) {
    return state.models.length;
  },
  numPolicyRules(state) {
    return state.policyRules.length;
  },
  numShocks(state) {
    return state.shocks.length;
  },
  numOutputVars(state) {
    return state.outputVars.length;
  },

  isRuleDisabled(state, getters) {
    return (id) => {
      switch (id) {
        case 1:
          // user specified
          return false;
        case 2:
          // model specific
          return getters.models.some(m => !m.capabilities.model_specific_rule);
        default:
          // todo: check model/rule compat
          return false;
      }
    };
  },

  // isModelDisabled(state, getters) {
  //
  // },

  canCompare(state, getters) {
    return getters.numModels
      && getters.numPolicyRules
      && getters.numShocks
      && getters.numOutputVars;
  },
};

const mutations = {
  setModels(state, data) {
    state.models = data;
  },
  setPolicyRules(state, data) {
    state.policyRules = data;
  },
  setShocks(state, data) {
    state.shocks = data;
  },
  setOutputVars(state, data) {
    state.outputVars = data;
  },

  clearModels(state) {
    state.models = [];
  },
  clearPolicyRules(state) {
    state.policyRules = [];
  },
  clearShocks(state) {
    state.shocks = [];
  },
  clearOutputVars(state) {
    state.outputVars = [];
  },

  clearAll(state) {
    state.models = [];
    state.policyRules = [];
    state.shocks = [];
    state.outputVars = [];
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
