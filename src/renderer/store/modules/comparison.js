import get from 'lodash.get';
import pick from 'lodash.pick';
import cloneDeep from 'lodash.clonedeep';

import compare from './comparison.compare.PLATFORM';

const namespaced = true;

const state = {
  settings: {},
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

function getChartRow(allData, variables, titleFactory, dataSelector) {
  return variables.map(variable => getChart(
    allData,
    titleFactory(variable),
    d => dataSelector(d, variable),
  ));
}

function getShockChartRows(state) {
  const { shocks, variables } = state.settings;

  return shocks.map(shock => getChartRow(
    state.data,
    variables,
    variable => `${shock.text} - ${variable.text}`,
    (data, variable) => get(data, ['IRF', shock.name, variable.name]),
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
  chartRows(state) {
    if (!state.show) {
      return [];
    }

    const chartRows = getShockChartRows(state);

    if (state.settings.plotAutocorrelation) {
      const acRow = getChartRow(
        state.data,
        state.settings.variables,
        variable => `Autocorrelation - ${variable.text}`,
        (data, variable) => get(data, ['AC', variable.name]),
      );

      chartRows.unshift(acRow);
    }

    return chartRows;
  },
  varTable(state) {
    if (!state.settings.plotVariance) {
      return null;
    }

    return state.data.map((d) => {
      const vars = pick(d.data.VAR, state.settings.variables.map(v => v.name));

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
