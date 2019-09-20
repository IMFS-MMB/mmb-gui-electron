import feathers from '@feathersjs/feathers';
import rest from '@feathersjs/rest-client';
import axios from 'axios';

const app = feathers();

app.configure(rest()
  .axios(axios));

export default async function compare(ctx) {
  const models = ctx.rootGetters['options/models'];
  const policyRules = ctx.rootGetters['options/policyRules'];
  const funcs = ctx.rootGetters['options/outputVars']; // todo fix naming (funcs vs outputVars)
  const shocks = ctx.rootGetters['options/shocks'];

  const query = {
    model: {
      $in: models.map(model => model.name),
    },
    rule: {
      $in: policyRules.map(pr => pr.name),
    },
    $or: [],
  };

  if (funcs && funcs.length) {
    funcs.forEach((func) => {
      const q = {
        func: func.name,
      };

      if (func.name === 'IRF') {
        q.shock = {
          $in: shocks.map(shock => shock.name),
        };
      }

      query.$or.push(q);
    });

    query.func = {
      $in: funcs.map(func => func.name),
    };
  }


  return app.service('data')
    .find({ query });
}
