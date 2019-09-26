import path from 'path';
import tempy from 'tempy';
import logger from '@/utils/logger';
import { writeFile } from 'fs-extra';
import { create } from '../../../../../common/backend/interface';
import buildMatlabScript from './build-matlab-script';
import readOutput from './read-output';

export default async function compare(ctx) {
  const cwd = ctx.rootGetters['settings/mmbFolder'];
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

  const options = buildMatlabScript({
    dynare,
    gain,
    horizon,
    models,
    rules,
    shocks,
    states,
    userRule,
  });

  logger.info('generated config:', JSON.stringify(options));
  const tmpfile = tempy.file({ extension: 'json' });
  logger.info(`config file: ${tmpfile}`);
  await writeFile(tmpfile, JSON.stringify(options, null, 2), { encoding: 'utf8' });

  const script = `mmb('${tmpfile}');exit();`;

  await backend.runCode(
    script,
    data => ctx.commit('addStdOut', data.toString()),
    data => ctx.commit('addStdOut', data.toString()),
  );

  return readOutput(path.join(cwd, 'out'));
}
