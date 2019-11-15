import memoize from 'memoize-one';
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

function getSeriesId(a, b) {
  return `${a}, ${b}`;
}

function getAllShocks(shocks, models) {
  return shocks
    .reduce((all, shock) => [
      ...all,
      ...models.map(m => m.shocks.find(modelShock => modelShock.text === shock.text)),
    ], [])
    .filter(s => !!s);
}

function getAllVariables(variables, models) {
  return variables
    .reduce((all, variable) => [
      ...all,
      ...models.map(m => m.variables.find(modelVariable => modelVariable.text === variable.text)),
    ], [])
    .filter(s => !!s);
}

function uniqueBy(selector) {
  return (v, i, a) => a.findIndex(b => selector(b) === selector(v)) === i;
}

const normalizeIRFData = memoize((data, shocks, variables, models) => {
  const resulttype = 'IRF';
  const result = [];

  const allShocks = getAllShocks(shocks, models).filter(uniqueBy(s => s.text));
  const allVariables = getAllVariables(variables, models).filter(uniqueBy(v => v.text));

  models.forEach((model) => {
    data
      .filter(d => d.model === model.name)
      .forEach((d) => {
        allShocks
          .filter(shock => !!d.data[resulttype][shock.name])
          .forEach((shock) => {
            allVariables
              .filter(variable => !!d.data[resulttype][shock.name][variable.name])
              .forEach((variable) => {
                result.push({
                  resulttype,
                  rule: d.rule,
                  model: model.name,
                  shock: shock.text,
                  variable: variable.text,
                  values: d.data[resulttype][shock.name][variable.name],
                });
              });
          });
      });
  });

  return result;
});

const normalizeACData = memoize((data, variables, models) => {
  const resulttype = 'AC';
  const result = [];

  const allVariables = getAllVariables(variables, models).filter(uniqueBy(v => v.text));

  models.forEach((model) => {
    data
      .filter(d => d.model === model.name)
      .forEach((d) => {
        allVariables
          .filter(variable => !!d.data[resulttype][variable.name])
          .forEach((variable) => {
            result.push({
              resulttype,
              rule: d.rule,
              model: model.name,
              shock: null,
              variable: variable.text,
              values: d.data[resulttype][variable.name],
            });
          });
      });
  });

  return result;
});

function groupBy(data, selector) {
  const result = new Map();

  if (!Array.isArray(data)) {
    throw new Error(`groupBy function expects array. Got ${data}`);
  }

  data.forEach((d) => {
    const key = selector(d);

    if (!result.has(key)) {
      result.set(key, []);
    }

    result.get(key)
      .push(d);
  });

  return result;
}

function getSections({
  data,
  chartsPerRow,
  keys: [key1, key2, key3, key4],
  getSeriesId,
  getSeriesName,
  getChartTitle,
  getSectionTitle,
}) {
  const sections = [];

  if (!data.length) {
    return [];
  }

  groupBy(data, d => d[key1])
    .forEach((data1, group1) => {
      const charts = [];

      groupBy(data1, d => d[key2])
        .forEach((data2, group2) => {
          const series = [];

          data2.forEach((d) => {
            series.push({
              id: getSeriesId(d[key3], d[key4]),
              name: getSeriesName(d[key3], d[key4]),
              data: d.values,
            });
          });

          charts.push({
            series,
            title: getChartTitle(group2),
          });
        });

      sections.push({
        rows: chunkArray(charts, chartsPerRow),
        title: getSectionTitle(group1),
      });
    });

  return sections;
}

function getACSections(data, chartsPerRow) {
  return getSections({
    data,
    chartsPerRow,
    keys: ['resulttype', 'variable', 'model', 'rule'],
    getSectionTitle: () => 'Autocorrelation functions',
    getChartTitle: group2 => group2,
    getSeriesId: (group3, group4) => getSeriesId(group3, group4),
    getSeriesName: (group3, group4) => `${group3}, ${group4}`,
  });
}

function getIRFSections(data, chartsPerRow) {
  return getSections({
    data,
    chartsPerRow,
    keys: ['shock', 'variable', 'model', 'rule'],
    getSectionTitle: group1 => group1,
    getChartTitle: group2 => group2,
    getSeriesId: (group3, group4) => getSeriesId(group3, group4),
    getSeriesName: (group3, group4) => `${group3}, ${group4}`,
  });
}

function getShockChartRows(state) {
  const { options, data } = state;
  const { shocks, variables, models } = options;

  const normalized = normalizeIRFData(data, shocks, variables, models);

  return getIRFSections(normalized.filter(d => d.resulttype === 'IRF'), state.colsPerRow);
}


function getACChartRows(state) {
  const { options, data } = state;
  const {
    variables, models, plotAutocorrelation,
  } = options;

  if (!plotAutocorrelation) {
    return [];
  }

  const normalized = normalizeACData(data, variables, models);

  return getACSections(normalized.filter(d => d.resulttype === 'AC'), state.colsPerRow);
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
    const series = [];

    state.options.models.forEach((m) => {
      state.options.policyRules.forEach((r) => {
        series.push({
          id: getSeriesId(m.name, r.name),
          name: getSeriesId(m.name, r.name),
          values: [],
        });
      });
    });

    return series;
  },

  sections(state) {
    if (!state.show) {
      return [];
    }

    const sections = [
      ...getShockChartRows(state),
      ...getACChartRows(state),
    ];

    return sections;
  },
  varTable(state) {
    if (!state.options.plotVariance) {
      return null;
    }

    return state.data.map((d) => {
      const vars = pick(d.data.VAR, state.options.variables.map(v => v.name));

      return {
        title: getSeriesId(d.model, d.rule),
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
