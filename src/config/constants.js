export const sentry = {
  dsnElectron: 'https://b0fda030c61748cd95cc5f27e4a07a15@sentry.macromodelbase.com/2',
  dsnWeb: 'https://69d6aff76a234100a714aa1507b79985@sentry.macromodelbase.com/3',
};

export const USER_RULE = 'User';
export const MODEL_RULE = 'Model';

export const isProduction = process.env.NODE_ENV === 'production';
