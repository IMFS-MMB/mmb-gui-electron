import get from 'lodash.get';
import pick from 'lodash.pick';
import cloneDeep from 'lodash.clonedeep';

import compare from './comparison.compare.PLATFORM';

const namespaced = true;

const state = {
  settings: null,
  show: false,
  inProgress: false,
  stdout: [],
  stderr: [],
  data: [],
  error: false,
};

function getSeriesId(d) {
  return `${d.model}, ${d.rule}`;
}

function getAllSeries(data, nameSelector, dataSelector) {
  return data
    .map(d => ({
      id: nameSelector(d),
      name: nameSelector(d),
      data: dataSelector(d.data),
    }))
    .filter(series => series.data && series.data.length);
}

function getChart(data, title, dataSelector) {
  return {
    title,
    series: getAllSeries(data, d => getSeriesId(d), d => dataSelector(d)),
  };
}

function getAllCharts(allData, varNames, titleFactory, dataSelector) {
  return varNames.map(varName => getChart(
    allData,
    titleFactory(varName),
    d => dataSelector(d, varName),
  ));
}

const DEFAULT_VARS = ['inflation', 'interest', 'output', 'outputgap'];

function getAllShockCharts(state) {
  const { shocks } = state.settings;

  return shocks.map(shock => getAllCharts(
    state.data,
    DEFAULT_VARS,
    varName => `${shock.text} - ${varName}`,
    (data, varName) => get(data, ['IRF', shock.name, varName]),
  ));
}

const getters = {
  data(state) {
    return state.data;
  },
  show(state) {
    return state.show;
  },
  stdout(state) {
    return state.stdout;
  },
  inProgress(state) {
    return state.inProgress;
  },
  legendSeries(state) {
    return state.data.map(d => ({
      id: getSeriesId(d),
      name: getSeriesId(d),
      values: [],
    }));
  },
  charts(state) {
    return [
      getAllCharts(state.data, DEFAULT_VARS, varName => `AC - ${varName}`, (data, varName) => get(data, ['AC', varName])),
      ...getAllShockCharts(state),
    ];
  },
  varTable(state) {
    state.data.map((d) => {
      const vars = pick(d.data.VAR, DEFAULT_VARS);

      return {
        title: getSeriesId(d),
        data: vars,
      };
    });
  },
};

const mutations = {
  start(state, settings) {
    state.settings = settings;
    state.stdout = [];
    state.stderr = [];
    state.data = [];
    state.error = false;
    state.inProgress = true;
    state.show = true;
  },
  addStdOut(state, data) {
    state.stdout.push(data);
  },
  addStdErr(state, data) {
    state.stderr.push(data);
  },
  setData(state, data) {
    state.data = data;
  },
  addData(state, data) {
    state.data = (state.data || []).concat(data);
  },
  error(state, error) {
    state.error = error;
  },
  done(state, data) {
    state.data = data;
    state.inProgress = false;
    state.show = true;
  },
};

const actions = {
  async compare(ctx) {
    const settings = cloneDeep(ctx.rootState.settings);

    ctx.commit('start', settings);

    let result = [];

    try {
      result = await compare(ctx);
    } catch (e) {
      ctx.commit('error', e);
      throw e;
    } finally {
      ctx.commit('done', result);
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
