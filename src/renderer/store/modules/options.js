import memoize from 'memoize-one';
import commonShocks from '@/data/shocks';
import commonVariables from '@/data/variables';
import intersection from '../../utils/intersection';
import partition from '../../utils/partition';
import { MODEL_RULE, USER_RULE } from '../../../config/constants';

function defaultModelStates(models) {
  return models.reduce((states, model) => {
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
  states: null,
  plotAutocorrelation: false,
  plotVariance: false,
  horizon: 20,
  gain: 0.01,
};

const getAvailableVars = memoize((models) => {
  const variables = models.map(model => model.variables);
  const common = intersection(variables, variable => variable.text);

  const [humanReadable, nonHumanReadable] =
    partition(common, variable => variable.text !== variable.name);

  return commonVariables
    .concat(humanReadable)
    .concat(nonHumanReadable)
    .filter((v, i, a) => a.findIndex(v_ => v.name === v_.name) === i);
});

const getAvailableShocks = memoize((models) => {
  const shocks = models.map(model => model.shocks);
  const common = intersection(shocks, shock => shock.text);

  const [humanReadable, nonHumanReadable] =
    partition(common, shock => shock.text !== shock.name);

  return commonShocks
    .concat(humanReadable)
    .concat(nonHumanReadable)
    .filter((v, i, a) => a.findIndex(v_ => v.name === v_.name) === i);
});

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
  shocksAvailable(state, getters) {
    return getAvailableShocks(getters.models);
  },
  variables(state) {
    return state.variables;
  },
  variablesAvailable(state, getters) {
    return getAvailableVars(getters.models);
  },
  plotAutocorrelation(state) {
    return state.plotAutocorrelation;
  },
  plotVariance(state, getters) {
    return getters.isPlotVarianceAvailable && state.plotVariance;
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
    return state.models.length === 0;
  },
  modelSpecificVariablesUnavailable(state) {
    return state.models.length === 0;
  },

  isPlotVarianceAvailable(state) {
    return state.models.some(model => model.capabilities.unconditional_variances);
  },

  isModelDisabled(state, getters) {
    return (model) => {
      const { policyRules } = getters;

      const hasUnsupportedRules = policyRules.some((rule) => {
        switch (rule.name) {
          case USER_RULE:
            return false;
          case MODEL_RULE:
            return !model.msr;
          default:
            return !model.capabilities.rules.includes(rule.name);
        }
      });

      return hasUnsupportedRules;
    };
  },

  isRuleDisabled(state, getters) {
    return (name) => {
      switch (name) {
        case USER_RULE:
          return false;
        case MODEL_RULE:
          return getters.models.some(m => !m.msr);
        default:
          return getters.models.some(m => !m.capabilities.rules.includes(name));
      }
    };
  },

  compareDisabled(state, getters, rootState, rootGetters) {
    const dynare = rootGetters['dynare/selected'];
    const backend = rootGetters['backends/selected'];

    const hints = [];

    if (!backend) {
      hints.push('Select a Matlab or Dynare executable in the settings menu');
    }

    if (!dynare) {
      hints.push('Select a dynare path in the settings menu');
    }

    if (!getters.numModels) {
      hints.push('Select at least 1 model from the model section');
    }

    if (!getters.numPolicyRules) {
      hints.push('Select at least 1 rule from the rules section');
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
  setDefaultStates(state, models) {
    state.states = defaultModelStates(models);
  },
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

    const nextAvailableVariables = getAvailableVars(state.models);
    state.variables = intersection([nextAvailableVariables, state.variables], v => v.text);

    const nextAvailableShocks = getAvailableShocks(state.models);
    state.shocks = intersection([nextAvailableShocks, state.shocks], v => v.text);

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
