/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('prules', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true,
    },
    description_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    internal_name: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
  }, {
    timestamps: false, tableName: 'prules',
  });
}
