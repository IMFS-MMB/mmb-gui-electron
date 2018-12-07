import path from 'path';
import { create } from '@/utils/electron/interface';
import readJsonFile from '@/utils/electron/read-json-file';
import buildMatlabScript from '@/utils/electron/build-matlab-script';

export default async function compare(ctx, models, policyRules, outputVars, shocks) {
  const cwd = path.join(__static, 'mmci-cli', 'MMB_OPTIONS');

  const executable = ctx.rootGetters['backends/selectedExecutable'];
  const userRule = ctx.rootGetters['userrule/params'];

  const backend = create({
    path: executable.path,
    type: executable.type,
    cwd,
  });

  await backend.runCode(
    buildMatlabScript(models, policyRules, outputVars, shocks, userRule),
    data => ctx.commit('addStdOut', data.toString()),
    data => ctx.commit('addStdErr', data.toString()),
  );

  const output = path.join(cwd, 'Modelbasefile.json');

  return readJsonFile(output, true);
}
