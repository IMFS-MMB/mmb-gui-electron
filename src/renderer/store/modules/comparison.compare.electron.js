import path from 'path';
import { create } from '@/utils/electron/interface';
import buildMatlabScript from '@/utils/electron/build-matlab-script';
import logger from '@/utils/logger';
import readOutput from '@/utils/readOutput';
import { mmbFolder } from '../../../../config/paths';

export default async function compare(ctx) {
  const cwd = mmbFolder;

  const models = ctx.rootGetters['settings/models'];
  const policyRules = ctx.rootGetters['settings/policyRules'];
  const shocks = ctx.rootGetters['settings/shocks'];
  const horizon = ctx.rootGetters['settings/horizon'];
  const gain = ctx.rootGetters['settings/gain'];
  const userRule = ctx.rootGetters['userrule/params'];
  const executable = ctx.rootGetters['backends/selected'];
  const dynare = ctx.rootGetters['dynare/selected'];

  const backend = create({
    path: executable.path,
    type: executable.type,
    cwd,
  });

  await backend.runCode(
    buildMatlabScript(models, policyRules, shocks, horizon, gain, userRule, dynare),
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
