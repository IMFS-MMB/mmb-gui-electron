import commonShocks from '@/data/shocks';
import commonVariables from '@/data/variables';
import allModels from '@/data/models';

function defaultStates() {
  return allModels.reduce((states, model) => {
    if (model.al) {
      states[model.name] = [...model.al_info.states_long];
    }

    return states;
  }, {});
}

const namespaced = true;

const state = {
  models: [],
  policyRules: [],
  shocks: [],
  variables: [
    ...commonVariables,
  ],
  states: defaultStates(),
  plotAutocorrelation: true,
  plotVariance: true,
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
    return state.models.sort((a, b) => a.name.localeCompare(b.name));
  },
  alModels(state) {
    return state.models.filter(model => !!model.al)
      .sort((a, b) => a.name.localeCompare(b.name));
  },
  policyRules(state) {
    return state.policyRules;
  },
  shocks(state) {
    return state.shocks;
  },
  variables(state) {
    return state.variables;
  },
  plotAutocorrelation(state) {
    return state.plotAutocorrelation;
  },
  plotVariance(state) {
    return state.plotVariance;
  },
  states(state) {
    return modelname => state.states[modelname];
  },
  statesForSelectedModels(state, getters) {
    const { models, states } = getters;

    return models.reduce((relevantStates, model) => ({
      ...relevantStates,
      [model.name]: states(model.name),
    }), {});
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
  numVariables(state) {
    return state.variables.length;
  },
  alModelSelected(state) {
    return state.models.some(model => !!model.al);
  },

  modelSpecificShocksUnavailable(state) {
    return state.models.length !== 1;
  },
  modelSpecificVariablesUnavailable(state) {
    return state.models.length !== 1;
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

  compareDisabled(state, getters, rootState, rootGetters) {
    const dynare = rootGetters['dynare/selected'];
    const backend = rootGetters['backends/selected'];

    const hints = [];

    if (!backend) {
      hints.push('Select a Matlab or Dynare executable from the settings menu');
    }

    if (!dynare) {
      hints.push('Select a dynare path from the settings menu');
    }

    if (!getters.numModels) {
      hints.push('Select at least 1 model from the model section');
    }

    if (!getters.numPolicyRules) {
      hints.push('Select at least 1 model from the rules section');
    }

    return hints.length ? { hints } : false;
  },

};

function isShockSelectable(selectedModels, shock) {
  if (commonShocks.some(s => s.name === shock.name)) {
    return true;
  }

  switch (selectedModels.length) {
    case 0:
      return false;
    case 1:
      return selectedModels[0].shocks.some(s => s.name === shock.name);
    default:
      return false;
  }
}

const mutations = {
  setStates(state, { modelname, states }) {
    state.states[modelname] = states;
  },
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
  setVariables(state, data) {
    state.variables = data;
  },
  setPlotAutocorrelation(state, data) {
    state.plotAutocorrelation = data;
  },
  setPlotVariance(state, data) {
    state.plotVariance = data;
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
  clearVariables(state) {
    state.variables = [];
  },

  clearAll(state) {
    state.models = [];
    state.policyRules = [];
    state.shocks = [];
    state.variables = [];
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
