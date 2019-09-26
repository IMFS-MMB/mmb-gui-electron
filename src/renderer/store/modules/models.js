import worker from '../../../worker';

const namespaced = true;

const state = {
  models: [],
  errors: [],
};

const getters = {
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
    commit('setModels', []);
    commit('setErrors', []);

    const modelsFolder = rootGetters['settings/modelsFolder'];

    let models = [];
    let errors = [];

    try {
      ({ models, errors } = await worker.loadModels(modelsFolder));
    } catch (e) {
      errors = [e];
    } finally {
      commit('setModels', models);
      commit('setErrors', errors);

      errors.forEach((err) => {
        window.vue.$bvToast.toast(`There was an error loading model ${err.model}:\n${err.message}`, {
          title: 'Model Error',
          variant: 'danger',
        });
      });
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
