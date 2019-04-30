import path from 'path';
import { create } from '@/utils/electron/interface';
import buildMatlabScript from '@/utils/electron/build-matlab-script';
import logger from '@/utils/logger';
import fs from 'fs';
import { promisify } from 'util';
import parseOutput from '../../utils/parseOutput';
import { mmbFolder } from '../../../../config/paths';

const readFile = promisify(fs.readFile);

export default async function compare(ctx) {
  const cwd = mmbFolder;

  const models = ctx.rootGetters['settings/models'];
  const policyRules = ctx.rootGetters['settings/policyRules'];
  const shocks = ctx.rootGetters['settings/shocks'];
  const outputVars = ctx.rootGetters['settings/outputVars'];
  const horizon = ctx.rootGetters['settings/horizon'];

  const executable = ctx.rootGetters['backends/selectedExecutable'];
  const userRule = ctx.rootGetters['userrule/params'];

  const backend = create({
    path: executable.path,
    type: executable.type,
    cwd,
  });

  await backend.runCode(
    buildMatlabScript(models, policyRules, outputVars, shocks, horizon, userRule),
    data => ctx.commit('addStdOut', data.toString()),
    data => ctx.commit('addStdOut', data.toString()), // todo: handle errors differently if needed
  );

  let output = [];

  try {
    const json = await readFile(path.join(cwd, 'Modelbasefile.json'), { encoding: 'utf8' });

    output = parseOutput(json);
  } catch (e) {
    logger.warn(e.message);
  }

  logger.debug(JSON.stringify(output, null, true));

  return output;
}
