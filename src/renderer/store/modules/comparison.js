import memoize from 'memoize-one';
import deepClone from 'lodash.clonedeep';
import captureBackendException from './compare/electron/capture-backend-exception';
import normalizeError from './compare/electron/normalize-error';
import chunkArray from '../../utils/chunkArray';
import compare from './compare';
import responsiveValue from '../../utils/responsive-value';
import sortSeries from '../../utils/sortSeries';
import orders from '../../data/orders';

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
  order: orders.VariableModelRule,
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

function uniqueByText(item, index, arr) {
  return index === arr.findIndex(item1 => item1.text === item.text);
}

function findModelVariableByText(model, text) {
  return model.variables.find(variable => variable.text === text);
}

function findModelShockByText(model, text) {
  return model.shocks.find(shock => shock.text === text);
}

const normalizeIRFData = memoize((data, shocks, variables, models) => {
  const resulttype = 'IRF';
  const result = [];

  const allShocks = getAllShocks(shocks, models).filter(uniqueByText);
  const allVariables = getAllVariables(variables, models).filter(uniqueByText);

  models.forEach((model) => {
    data
      .filter(d => d.model === model.name)
      .forEach((d) => {
        allShocks
          .map(shock => findModelShockByText(model, shock.text))
          .forEach((shock) => {
            allVariables
              .map(variable => findModelVariableByText(model, variable.text))
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

  const allVariables = getAllVariables(variables, models);

  models.forEach((model) => {
    data
      .filter(d => d.model === model.name)
      .forEach((d) => {
        allVariables
          .map(variable => findModelVariableByText(model, variable.text))
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

const normalizeVARData = memoize((data, variables, models) => {
  const result = [];

  const allVariables = getAllVariables(variables, models).filter(uniqueByText);

  models.forEach((model) => {
    data
      .filter(d => d.model === model.name)
      .forEach((d) => {
        allVariables
          .map(variable => findModelVariableByText(model, variable.text))
          .forEach((v) => {
            const variance = d.data.VAR[v.name];

            if (typeof variance === 'undefined') return;

            result.push({
              resulttype: 'VAR',
              rule: d.rule,
              model: d.model,
              shock: null,
              variable: v.text,
              values: [variance],
            });
          });
      });
  });

  result
    .sort((a, b) => a.rule.localeCompare(b.rule))
    .sort((a, b) => a.model.localeCompare(b.model));

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

  const colorsById = new Map();
  const COLORS = [
    '#4572A7',
    '#AA4643',
    '#89A54E',
    '#80699B',
    '#3D96AE',
    '#DB843D',
    '#92A8CD',
    '#A47D7C',
    '#B5CA92',
  ];
  let nextColorIndex = 0;

  const getColor = (id) => {
    if (!colorsById.has(id)) {
      colorsById.set(id, COLORS[nextColorIndex]);
      nextColorIndex = (nextColorIndex + 1) % COLORS.length;
    }

    return colorsById.get(id);
  };

  groupBy(data, d => d[key1])
    .forEach((data1, group1) => {
      const charts = [];

      groupBy(data1, d => d[key2])
        .forEach((data2, group2) => {
          const series = [];

          data2.forEach((d) => {
            const id = getSeriesId(d[key3], d[key4]);
            const name = getSeriesName(d[key3], d[key4]);

            series.push({
              id,
              name,
              data: d.values,
              color: getColor(id),
            });
          });

          charts.push({
            series: series.sort(sortSeries),
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

function getACSections(data, chartsPerRow, order) {
  return getSections({
    data,
    chartsPerRow,
    keys: ['resulttype', ...order],
    getSectionTitle: () => 'Autocorrelation functions',
    getChartTitle: group2 => group2,
    getSeriesId: (group3, group4) => getSeriesId(group3, group4),
    getSeriesName: (group3, group4) => `${group3}, ${group4}`,
  });
}

function getIRFSections(data, chartsPerRow, order) {
  return getSections({
    data,
    chartsPerRow,
    keys: ['shock', ...order],
    getSectionTitle: group1 => group1,
    getChartTitle: group2 => group2,
    getSeriesId: (group3, group4) => getSeriesId(group3, group4),
    getSeriesName: (group3, group4) => `${group3}, ${group4}`,
  });
}

const getters = {
  normalizedACdata(state) {
    if (!state.data.length) {
      return [];
    }

    const {
      data,
      options: {
        variables,
        models,
        plotAutocorrelation,
      },
    } = state;

    return plotAutocorrelation ? normalizeACData(data, variables, models) : [];
  },
  normalizedIRFdata(state) {
    if (!state.data.length) {
      return [];
    }

    const {
      data,
      options: {
        models,
        shocks,
        variables,
      },
    } = state;

    return normalizeIRFData(data, shocks, variables, models);
  },
  normalizedVARdata(state) {
    if (!state.options.plotVariance || !state.data.length) {
      return [];
    }

    const {
      data,
      options: {
        models,
        variables,
      },
    } = state;

    return normalizeVARData(data, variables, models);
  },
  normalizedData(state, getters) {
    return [
      ...getters.normalizedACdata,
      ...getters.normalizedIRFdata,
      ...getters.normalizedVARdata,
    ];
  },
  data(state) {
    return state.data;
  },
  error(state) {
    return state.error;
  },
  show(state) {
    return state.show && !state.error;
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
  legendSeries(state, getters) {
    const allSeries = new Map();

    getters.sections.forEach((section) => {
      section.rows.forEach((chunk) => {
        chunk.forEach((chart) => {
          chart.series.forEach((s) => {
            if (!allSeries.has(s.id)) {
              const {
                data,
                ...lSeries
              } = s;

              allSeries.set(s.id, lSeries);
            }
          });
        });
      });
    });

    return [...allSeries.values()].sort(sortSeries);
  },

  sections(state, getters) {
    if (!state.show) {
      return [];
    }

    return [
      ...getIRFSections(getters.normalizedIRFdata.filter(d => d.resulttype === 'IRF'), state.colsPerRow, state.order),
      ...getACSections(getters.normalizedACdata.filter(d => d.resulttype === 'AC'), state.colsPerRow, state.order),
    ];
  },
  varTable(state, getters) {
    if (!state.options.plotVariance) {
      return null;
    }

    const data = getters.normalizedVARdata;

    const header = [...groupBy(data, data => data.variable).keys()]
      .sort((a, b) => a.localeCompare(b));

    const rows = [];

    groupBy(data, data => getSeriesId(data.model, data.rule))
      .forEach(((data, title) => {
        const values = data
          .sort((a, b) => a.variable.localeCompare(b.variable))
          .map(d => d.values[0]);

        rows.push({
          title,
          values,
        });
      }));

    header.sort((a, b) => a.localeCompare(b));

    return {
      header,
      rows,
    };
  },
  order(state) {
    return state.order;
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
  setOrder(state, data) {
    state.order = data;
  },
};

const actions = {
  async compare(ctx) {
    const options = deepClone(ctx.rootState.options);

    ctx.commit('start', options);

    let data = [];

    try {
      const result = await compare(ctx);

      if (result.error) {
        const error = normalizeError(result.error);

        captureBackendException(error);

        ctx.commit('error', error);
      } else {
        // eslint-disable-next-line prefer-destructuring
        data = result.data;
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
