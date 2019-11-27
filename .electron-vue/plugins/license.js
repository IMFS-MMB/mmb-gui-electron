const { LicenseWebpackPlugin } = require('license-webpack-plugin');

module.exports = function licensePlugin() {
  return new LicenseWebpackPlugin({
    preferredLicenseTypes: ['MIT'],
  });
};
