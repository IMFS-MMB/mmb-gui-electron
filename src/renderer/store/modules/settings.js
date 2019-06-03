import commonShocks from '@/data/shocks';

const namespaced = true;

const state = {
  models: [],
  policyRules: [],
  shocks: [],
  outputVars: [],
  horizon: 20,
  gain: 0.01,
};

const getters = {
  horizon(state) {
    return state.horizon;
  },
  gain(state) {
    return state.gain;
  },

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

  isModelDisabled(state, getters) {
    return (model) => {
      const { policyRules } = getters;

      const hasUnsupportedRules = policyRules.some((rule) => {
        switch (rule.id) {
          case 1:
            return false;
          case 2:
            return !model.msr;
          default:
            return !model.capabilities.rules.includes(rule.id);
        }
      });

      return hasUnsupportedRules;
    };
  },

  isRuleDisabled(state, getters) {
    return (id) => {
      switch (id) {
        case 1:
          // user specified
          return false;
        case 2:
          // model specific
          return getters.models.some(m => !m.msr);
        default:
          return getters.models.some(m => !m.capabilities.rules.includes(id));
      }
    };
  },

  canCompare(state, getters) {
    return getters.numModels && getters.numPolicyRules;
  },
};

function isShockSelectable(selectedModels, shock) {
  if (commonShocks.some(s => s.name === shock.name)) {
    return true;
  }

  switch (selectedModels.length) {
    case 0: return false;
    case 1: return selectedModels[0].shocks.some(s => s.name === shock.name);
    default: return false;
  }
}

const mutations = {
  setHorizon(state, data) {
    state.horizon = data;
  },
  setGain(state, data) {
    state.gain = data;
  },
  setModels(state, data) {
    state.models = data;

    state.shocks = state.shocks.filter(shock => isShockSelectable(state.models, shock));
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
