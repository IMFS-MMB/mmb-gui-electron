import get from 'lodash.get';
import pick from 'lodash.pick';
import deepClone from 'lodash.clonedeep';
import { isElectron } from '../../../constants';
import captureBackendException from '../../utils/electron/capture-backend-exception';
import normalizeError from '../../utils/electron/normalize-error';

const { default: compare } = isElectron ? require('./comparison.compare.electron') : require('./comparison.compare.web');

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
  error(state) {
    return state.error;
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

    return state.data.map((d, i) => {
      const model = state.settings.models[i];

      const vars = model.capabilities.unconditional_variances
        ? pick(d.data.VAR, state.settings.variables.map(v => v.name))
        : null;

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
    const settings = deepClone(ctx.rootState.settings);

    ctx.commit('start', settings);

    let data = [];

    try {
      const result = await compare(ctx);

      // eslint-disable-next-line prefer-destructuring
      data = result.data;

      if (result.error) {
        const error = normalizeError(result.error);

        captureBackendException(error);
        ctx.commit('error', error);
      }
    } catch (e) {
      ctx.commit('error', e);
      throw e;
    } finally {
      ctx.commit('done', data);
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
