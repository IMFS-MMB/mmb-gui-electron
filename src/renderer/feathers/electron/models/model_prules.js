/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('model_prules', {
    model_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    prule_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    timestamps: false, tableName: 'model_prules',
  });
}
