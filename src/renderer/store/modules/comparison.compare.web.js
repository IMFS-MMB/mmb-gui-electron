import feathers from '@feathersjs/feathers';
import rest from '@feathersjs/rest-client';
import axios from 'axios';

const app = feathers();

app.configure(rest().axios(axios));

export default async function compare(ctx) {
  const models = ctx.rootGetters['settings/models'];
  const policyRules = ctx.rootGetters['settings/policyRules'];
  const funcs = ctx.rootGetters['settings/outputVars']; // todo fix naming (funcs vs outputVars)
  const shocks = ctx.rootGetters['settings/shocks'];

  const query = {
    model: {
      $in: models.map(model => model.internal_name),
    },
    rule: {
      $in: policyRules.map(pr => pr.internal_name),
    },
  };

  if (funcs && funcs.length) {
    query.func = {
      $in: funcs.map(func => func.name),
    };
  }

  if (shocks && shocks.length) {
    query.shock = {
      $in: shocks.map(shock => shock.name),
    };
  }

  return app.service('data').find({ query });
}
