import { create } from '@/utils/interface';
import path from 'path';
import readJsonFile from '@/utils/read-json-file';
import buildMatlabScript from '@/utils/build-matlab-script';

import groupBy from 'lodash.groupby';
import map from 'lodash.map';

const namespaced = true;

const state = {
  show: false,
  inProgress: false,
  stdout: [],
  stderr: [],
  data: [],
  error: false,
};

const getters = {
  show(state) {
    return state.show;
  },
  data(state) {
    return state.data;
  },
  stdout(state) {
    return state.stdout;
  },
  inProgress(state) {
    return state.inProgress;
  },
  chartData(state, getters) {
    const rawData = getters.data;

    const grouped = groupBy(rawData, data => `${data.rule} ${data.shock} ${data.outputvar} ${data.func}`);

    const result = map(grouped, (data, index) => {
      const series = data.map(d => ({
        name: d.model,
        data: d.values,
      }));

      return {
        title: index,
        series,
      };
    });

    return result;
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

    const models = ctx.rootGetters['selections/models'];
    const policyRules = ctx.rootGetters['selections/policyRules'];
    const shocks = ctx.rootGetters['selections/shocks'];
    const outputVars = ctx.rootGetters['selections/outputVars'];
    const userRule = ctx.rootGetters['userrule/params'];

    const isElectron = true; // todo detect environment
    if (isElectron) {
      const cwd = path.join(__static, 'mmci-cli', 'MMB_OPTIONS');
      const executable = ctx.rootGetters['backends/selectedExecutable'];

      const backend = create({
        path: executable.path,
        type: executable.type,
        cwd,
      });

      const result = [];

      try {
        await backend.runCode(
          buildMatlabScript(models, policyRules, outputVars, shocks, userRule),
          data => ctx.commit('addStdOut', data.toString()),
          data => ctx.commit('addStdErr', data.toString()),
        );

        const output = path.join(cwd, 'Modelbasefile.json');

        const input = await readJsonFile(output, true);

        result.push(...input);
      } catch (e) {
        ctx.commit('error', e);
      } finally {
        ctx.commit('done', result);
      }
    } else {
      // todo: fetch comparison data from server
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
