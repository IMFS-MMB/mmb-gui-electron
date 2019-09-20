import path from 'path';
import logger from '@/utils/logger';
import { create } from '../../../../../common/backend/interface';
import buildMatlabScript from './build-matlab-script';
import readOutput from './read-output';
import { mmbFolder } from '../../../../../config/paths';

export default async function compare(ctx) {
  const cwd = mmbFolder;

  const dynare = ctx.rootGetters['dynare/selected'];
  const executable = ctx.rootGetters['backends/selected'];
  const gain = ctx.rootGetters['options/gain'];
  const horizon = ctx.rootGetters['options/horizon'];
  const models = ctx.rootGetters['options/models'];
  const rules = ctx.rootGetters['options/policyRules'];
  const shocks = ctx.rootGetters['options/shocks'];
  const states = ctx.rootGetters['options/statesForSelectedModels'];
  const userRule = ctx.rootGetters['userrule/params'];

  const backend = create({
    path: executable.path,
    type: executable.type,
    ver: executable.ver,
    cwd,
  });

  const script = buildMatlabScript({
    dynare,
    gain,
    horizon,
    models,
    rules,
    shocks,
    states,
    userRule,
  });

  logger.debug(script);

  await backend.runCode(
    script,
    data => ctx.commit('addStdOut', data.toString()),
    data => ctx.commit('addStdOut', data.toString()),
  );

  return readOutput(path.join(cwd, 'out'));
}
