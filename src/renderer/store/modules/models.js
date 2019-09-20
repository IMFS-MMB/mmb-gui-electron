import worker from '../../../worker';

const namespaced = true;

const state = {
  models: [],
  errors: [],
};

const getters = {
  modelErrors(state) {
    return state.errors;
  },
  sortedModels(state) {
    return state.models.sort((a, b) => a.name.localeCompare(b.name));
  },
  filteredModels(state, getters, rootState, rootGetters) {
    const text = rootGetters['search/text'].toLowerCase();

    if (!text) {
      return getters.sortedModels;
    }

    return getters.sortedModels.filter(model =>
      model.name.toLowerCase()
        .includes(text) ||
      (model.description.keywords || []).some(k => k.toLowerCase()
        .includes(text)) ||
      (model.description.paper_title || '').toLowerCase()
        .includes(text) ||
      (model.description.journal || '').toLowerCase()
        .includes(text) ||
      (model.description.replicants_name || '').toLowerCase()
        .includes(text) ||
      (model.description.pub_date || '').toLowerCase()
        .includes(text) ||
      (model.description.authors || []).some(a => a.toLowerCase()
        .includes(text)));
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

  modelsAdaptiveLearning(state, getters) {
    return getters.filteredModels.filter(model => model.description.category === 'Adaptive learning model');
  },

  modelsOther(state, getters) {
    return getters.filteredModels.filter(model =>
      model.description.category === 'Estimated/Calibrated multi-country model' ||
      model.description.category === 'Estimated other-country model');
  },
};

const mutations = {
  setModels(state, models) {
    state.models = [...models];
  },
  setErrors(state, errors) {
    state.errors = [...errors];
  },
};

const actions = {
  async loadModels({ commit, rootGetters }) {
    const modelsFolder = rootGetters['settings/modelsFolder'];

    commit('setModels', []);
    commit('setErrors', []);

    try {
      const { models, errors } = await worker.loadModels(modelsFolder);

      commit('setModels', models);
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
