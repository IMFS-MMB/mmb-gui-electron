const app = require('./app');

app.setup();

const data = require('../Modelbasefile');
const service = app.service('data');

service.create(data)
  .catch(err => console.log(err.message)) // eslint-disable-line
  .then(result => {
    console.log(`${result.length} rows imported successfully.`);// eslint-disable-line
  });
