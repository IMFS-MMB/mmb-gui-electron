/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('prule_params', {
    prule_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    param_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    value: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  }, {
    timestamps: false, tableName: 'prule_params',
  });
}
