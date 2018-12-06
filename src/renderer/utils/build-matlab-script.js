import logger from '@/utils/logger';

function toSum(arr) {
  return arr.map(el => `2^${el.id - 1}`)
    .join(' + ') || '0';
}

function userRuleToMatrix(userRule) {
  const rows = userRule.map(row => row
    .map(num => (num === null ? NaN : +num))
    .join(','));

  const contents = rows.join(';');

  return `'[${contents}]'`;
}

export default function buildMatlabScript(models, rules, output, shocks, userRule) {
  let moreArgs = '';

  if (rules.find(r => r.id === 1 /* user specified rule */)) {
    const matrix = userRuleToMatrix(userRule);

    moreArgs = `,'data',${matrix}`;
  }

  const lines = [
    'try',
    `  models = ${toSum(models)};`,
    `  rules = ${toSum(rules)};`,
    `  output = ${toSum(output)};`,
    `  shocks = ${toSum(shocks)};`,
    `  CMD_MMB(models,rules,output,shocks${moreArgs});`,
    'catch ERR',
    '  disp(\'\')',
    '  disp(\'An error occured:\')',
    '  disp(ERR)',
    'end',
  ];

  const result = lines.join('\n');

  logger.info(result);

  return result;
}
