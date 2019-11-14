import { MODEL_RULE, USER_RULE } from '../../../../../config/constants';

function userrule9x4to1x33(old) {
  // for legacy reasons the user rule used to be a 9x4 matrix in matlab,
  // although other coefficient matrices were 1x33. The user rule is 1x33 now, too.

  const result = [];

  result.push(old[1][0]);
  result.push(old[2][0]);
  result.push(old[3][0]);
  result.push(old[4][0]);
  result.push(old[0][1]);
  result.push(old[1][1]);
  result.push(old[2][1]);
  result.push(old[3][1]);
  result.push(old[4][1]);
  result.push(old[5][1]);
  result.push(old[6][1]);
  result.push(old[7][1]);
  result.push(old[8][1]);
  result.push(old[0][2]);
  result.push(old[1][2]);
  result.push(old[2][2]);
  result.push(old[3][2]);
  result.push(old[4][2]);
  result.push(old[5][2]);
  result.push(old[6][2]);
  result.push(old[7][2]);
  result.push(old[8][2]);
  result.push(old[0][3]);
  result.push(old[1][3]);
  result.push(old[2][3]);
  result.push(old[3][3]);
  result.push(old[4][3]);
  result.push(old[5][3]);
  result.push(old[6][3]);
  result.push(old[7][3]);
  result.push(old[8][3]);
  result.push('1');
  result.push('0.25');

  return result;
}

function useMSR(rules) {
  return rules.some(r => r.id === MODEL_RULE);
}

function useUSR(rules) {
  return rules.some(r => r.id === USER_RULE);
}

export default function buildMatlabScript({
  dynare,
  gain,
  horizon,
  models,
  rules,
  shocks,
  states,
  userRule,
}) {
  const allShocks = shocks
    .reduce((all, shock) => [
      ...all,
      ...models.map(m => m.shocks.find(modelShock => modelShock.text === shock.text)),
    ], [])
    .filter(s => !!s);

  const config = {
    dynare: dynare.path,
    rules: rules.filter(r => r.id !== USER_RULE && r.id !== MODEL_RULE)
      .map(r => r.name),
    models: models.map(m => m.name),
    msr: useMSR(rules),
    usr: useUSR(rules) ? userrule9x4to1x33(userRule) : false,
    options: {
      shocks: allShocks.map(s => s.name),
      gain,
      horizon,
      states,
    },
  };


  return config;
}
