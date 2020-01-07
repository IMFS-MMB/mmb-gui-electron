import axios from 'axios';

function getURL(model, rule) {
  return `/data/${model.name}-${rule.name}.output.json`;
}

export default async function compare(ctx) {
  const models = ctx.rootGetters['options/models'];
  const policyRules = ctx.rootGetters['options/policyRules'];

  const urls = [];

  models.forEach((model) => {
    policyRules.forEach((rule) => {
      urls.push(getURL(model, rule));
    });
  });

  const data = [];

  // eslint-disable-next-line no-restricted-syntax
  for (const url of urls) {
    // eslint-disable-next-line no-await-in-loop
    const response = await axios.get(url, { responseType: 'json' });
    data.push(response.data);
  }

  return {
    data,
    error: null,
  };
}
