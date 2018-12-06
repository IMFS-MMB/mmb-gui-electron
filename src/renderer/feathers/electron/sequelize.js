import Sequelize from 'sequelize';
import path from 'path';

const sequelize = new Sequelize('sequelize', '', '', {
  dialect: 'sqlite',
  storage: path.join(__static, 'mmci-cli', 'mmb_input.sqlite'),
  logging: false,
});

export default sequelize;
