import get from 'lodash.get';
import pick from 'lodash.pick';
import deepClone from 'lodash.clonedeep';
import captureBackendException from './compare/electron/capture-backend-exception';
import normalizeError from './compare/electron/normalize-error';
import chunkArray from '../../utils/chunkArray';
import compare from './compare';
import responsiveValue from '../../utils/responsive-value';

const namespaced = true;

const state = {
  options: {},
  colsPerRow: responsiveValue({
    mdDown: 2,
    lgUp: 4,
  }),
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

function getChartRows(allData, variables, titleFactory, dataSelector) {
  return variables.map(variable => getChart(
    allData,
    titleFactory(variable),
    d => dataSelector(d, variable),
  ));
}

function getShockChartRows(state) {
  const { shocks, variables } = state.options;

  const result = shocks.map((shock) => {
    const rows = getChartRows(
      state.data,
      variables,
      variable => `${shock.text} - ${variable.text}`,
      (data, variable) => get(data, ['IRF', shock.name, variable.name]),
    );

    return chunkArray(rows, state.colsPerRow);
  })
    .reduce((flat, shockRows) => flat.concat(shockRows), []);

  return result;
}

function getACChartRows(state) {
  if (!state.options.plotAutocorrelation) {
    return [];
  }

  const rows = getChartRows(
    state.data,
    state.options.variables,
    variable => `Autocorrelation - ${variable.text}`,
    (data, variable) => get(data, ['AC', variable.name]),
  );

  return chunkArray(rows, state.colsPerRow);
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
  colsPerRow(state) {
    return state.colsPerRow;
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

    return [
      ...getShockChartRows(state),
      ...getACChartRows(state),
    ];
  },
  varTable(state) {
    if (!state.options.plotVariance) {
      return null;
    }

    return state.data.map((d) => {
      const vars = pick(d.data.VAR, state.options.variables.map(v => v.name));

      return {
        title: getSeriesId(d),
        data: vars,
      };
    });
  },
};

const mutations = {
  start(state, options) {
    state.options = options;
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
  setColsPerRow(state, colsPerRow) {
    state.colsPerRow = colsPerRow;
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
    const options = deepClone(ctx.rootState.options);

    ctx.commit('start', options);

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
