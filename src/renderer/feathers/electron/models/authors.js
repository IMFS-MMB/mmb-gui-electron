/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('authors', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  }, {
    timestamps: false, tableName: 'authors',
  });
}
