export const sentry = {
  dsnElectron: 'https://b0fda030c61748cd95cc5f27e4a07a15@sentry.macromodelbase.com/2',
  dsnWeb: 'https://69d6aff76a234100a714aa1507b79985@sentry.macromodelbase.com/3',
};

export const USER_RULE = 1;
export const MODEL_RULE = 2;

export const isWeb = !!process.env.IS_WEB;
export const isElectron = !isWeb;
export const isProduction = process.env.NODE_ENV === 'production';
