// require all files matching the './RULENAME/RULENAME.json' pattern
const ctx = require.context('@/../../static/mmci-cli/rules', true, /^\.\/([^/]*)\/\1\.json$/);
const rules = ctx.keys().map(key => ctx(key));

export default rules;
