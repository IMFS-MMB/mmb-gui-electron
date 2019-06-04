import path from 'path';
import { create } from '@/utils/electron/interface';
import buildMatlabScript from '@/utils/electron/build-matlab-script';
import logger from '@/utils/logger';
import readOutput from '@/utils/readOutput';
import { mmbFolder } from '../../../../config/paths';

export default async function compare(ctx) {
  const cwd = mmbFolder;

  const dynare = ctx.rootGetters['dynare/selected'];
  const executable = ctx.rootGetters['backends/selected'];
  const gain = ctx.rootGetters['settings/gain'];
  const horizon = ctx.rootGetters['settings/horizon'];
  const models = ctx.rootGetters['settings/models'];
  const rules = ctx.rootGetters['settings/policyRules'];
  const shocks = ctx.rootGetters['settings/shocks'];
  const states = ctx.rootGetters['settings/statesForSelectedModels'];
  const userRule = ctx.rootGetters['userrule/params'];

  const backend = create({
    path: executable.path,
    type: executable.type,
    cwd,
  });

  await backend.runCode(
    buildMatlabScript({
      dynare,
      gain,
      horizon,
      models,
      rules,
      shocks,
      states,
      userRule,
    }),
    data => ctx.commit('addStdOut', data.toString()),
    data => ctx.commit('addStdOut', data.toString()), // todo: handle errors differently if needed
  );

  let output = [];

  try {
    output = await readOutput(path.join(cwd, 'out'));
  } catch (e) {
    logger.warn(e.message);
  }

  return output;
}
