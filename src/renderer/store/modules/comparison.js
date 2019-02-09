import groupBy from 'lodash.groupby';
import map from 'lodash.map';

import compare from './comparison.compare.PLATFORM';

const namespaced = true;

const state = {
  show: false,
  inProgress: false,
  stdout: [],
  stderr: [],
  data: [],
  error: false,
};

function toSeries(data) {
  return data
    .map(d => ({
      name: `${d.model}, ${d.rule}`,
      data: d.values,
    }))
    .filter(d => !!d.data);
}

function toChartData(raw, title, filter) {
  const data1 = raw
    .filter(filter);

  if (!data1.length) {
    return null;
  }

  const grouped = groupBy(data1, d => d.outputvar);

  return [
    {
      title: `${title} - Inflation`,
      series: toSeries(grouped.inflation),
    },
    {
      title: `${title} - Interest Rate`,
      series: toSeries(grouped.interest),
    },
    {
      title: `${title} - Output`,
      series: toSeries(grouped.output),
    },
    {
      title: `${title} - Output Gap`,
      series: toSeries(grouped.outputgap),
    },
  ];
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
  acCharts(state) {
    return toChartData(state.data, 'Autocorrelation Fct.', d => d.func === 'AC');
  },
  monCharts(state) {
    return toChartData(state.data, 'Monetary Shock', d => d.shock === 'Mon');
  },
  fisCharts(state) {
    return toChartData(state.data, 'Fiscal Shock', d => d.shock === 'Fis');
  },
  varTable(state) {
    const varResults = state.data.filter(data => data.func === 'VAR');

    const groupedVariances = groupBy(varResults, data => `${data.model}, ${data.rule}`);

    return map(groupedVariances, (data, index) => ({
      title: index,
      data: {
        inflation: (data.find(d => d.outputvar === 'inflation') || {}).values,
        interest: (data.find(d => d.outputvar === 'interest') || {}).values,
        output: (data.find(d => d.outputvar === 'output') || {}).values,
        outputgap: (data.find(d => d.outputvar === 'outputgap') || {}).values,
      },
    }));
  },
};

const mutations = {
  start(state) {
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
    ctx.commit('start');

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
