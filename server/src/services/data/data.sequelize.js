
/* eslint quotes: 0 */
// Defines Sequelize model for service `data`. (Can be re-generated.)
const merge = require('lodash.merge');
const Sequelize = require('sequelize');
// eslint-disable-next-line no-unused-vars
const DataTypes = Sequelize.DataTypes;
// !code: imports // !end
// !code: init // !end

let moduleExports = merge({},
  // !<DEFAULT> code: sequelize_model
  {
    model: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    rule: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    shock: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    func: {
      type: Sequelize.ENUM(["IRF","AC","VAR"]),
      allowNull: false
    },
    outputvar: {
      type: Sequelize.ENUM(["inflation","interest","output","outputgap"]),
      allowNull: false
    },
    values: {
      type: DataTypes.TEXT,
      allowNull: false
    }
  },
  // !end
  // !code: moduleExports
  {
    shock: {
      allowNull: true
    }
  }
  // !end
);

// !code: exports // !end
module.exports = moduleExports;

// !code: funcs // !end
// !code: end // !end
