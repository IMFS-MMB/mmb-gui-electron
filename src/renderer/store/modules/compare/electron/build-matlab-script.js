import { MODEL_RULE, USER_RULE } from '../../../../../config/constants';

function useMSR(rules) {
  return rules.some(r => r.name === MODEL_RULE);
}

function useUSR(rules) {
  return rules.some(r => r.name === USER_RULE);
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
    rules: rules.filter(r => r.name !== USER_RULE && r.name !== MODEL_RULE)
      .map(r => r.name),
    models: models.map(m => m.name),
    msr: useMSR(rules),
    usr: useUSR(rules) ? userRule : false,
    options: {
      shocks: allShocks.map(s => s.name),
      gain,
      horizon,
      states,
    },
  };

  return config;
}
