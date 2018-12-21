const namespaced = true;

const state = {
  models: require('../../data/models'),
};

const getters = {
  sortedModels(state) {
    return state.models.sort((a, b) => a.internal_name.localeCompare(b.internal_name));
  },
  filteredModels(state, getters, rootState, rootGetters) {
    const text = rootGetters['search/text'].toLowerCase();

    if (!text) {
      return getters.sortedModels;
    }

    return getters.sortedModels.filter(model =>
      model.internal_name.toLowerCase().includes(text) ||
      (model.description.keywords || []).some(k => k.toLowerCase().includes(text)) ||
      (model.description.paper_title || '').toLowerCase().includes(text) ||
      (model.description.journal || '').toLowerCase().includes(text) ||
      (model.description.replicants_name || '').toLowerCase().includes(text) ||
      (model.description.pub_date || '').toLowerCase().includes(text) ||
      (model.description.authors || []).some(a => a.toLowerCase().includes(text)));
  },

  total(state) {
    return state.models.length;
  },

  modelsCalibrated(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Calibrated model');
  },

  modelsEstimatedUs(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Estimated US model');
  },

  modelsEstimatedEuroArea(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Estimated euro area model');
  },

  modelsEstimatedCalibratedMultiCountry(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Estimated/Calibrated multi-country model');
  },

  modelsEstimatedOtherCountries(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Estimated other-country model');
  },
};

const mutations = {};

const actions = {};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
