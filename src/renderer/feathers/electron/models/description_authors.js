/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('description_authors', {
    description_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    author_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    timestamps: false, tableName: 'description_authors',
  });
}
