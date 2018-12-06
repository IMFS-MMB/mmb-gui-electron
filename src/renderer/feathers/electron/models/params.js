/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('params', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    position: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    text_plain: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    text_markup: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
  }, {
    timestamps: false, tableName: 'params',
  });
}
