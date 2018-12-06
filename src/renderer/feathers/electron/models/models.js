/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('models', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true,
    },
    description_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    internal_name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    path: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    interest: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
    inflation: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
    outputgap: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
    output: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
    mp_shock: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
    fiscal_shock: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
    },
  }, {
    timestamps: false, tableName: 'models',
  });
}
