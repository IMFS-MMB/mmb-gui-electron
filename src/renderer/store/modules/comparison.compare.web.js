import feathers_ from '@feathersjs/feathers';
// todo use real backend
const feathers = () => {
  const app = feathers_();

  app.use('data', {
    async find(params) {
      console.log(params);

      return [];
    },
  });

  return app;
};

const app = feathers();

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
