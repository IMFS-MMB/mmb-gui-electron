import logger from '@/utils/logger';

function toSum(arr) {
  return arr.map(el => `2^${el.id - 1}`).join(' + ') || '0';
}

export default function buildMatlabScript(models, rules, output, shocks) {
  const lines = [
    `models = ${toSum(models)};`,
    `rules = ${toSum(rules)};`,
    `output = ${toSum(output)};`,
    `shocks = ${toSum(shocks)};`,
    'CMD_MMB(models,rules,output,shocks);',
  ];

  const result = lines.join('\n');

  logger.info(result);

  return result;
}
