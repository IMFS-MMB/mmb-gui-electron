// require all files matching the './MODELNAME/MODELNAME.json' pattern
const ctx = require.context('@/../../static/mmci-cli/models', true, /^\.\/([^/]*)\/\1\.json$/);
const models = ctx.keys().map(key => ctx(key));

export default models;
