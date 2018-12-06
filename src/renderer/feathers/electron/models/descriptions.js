/* jshint indent: 2 */

export default function (sequelize, DataTypes) {
  return sequelize.define('descriptions', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true,
    },
    ac_ref: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    paper_title: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    journal: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    replicants_name: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    pub_date: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    keywords: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    category: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
  }, {
    timestamps: false, tableName: 'descriptions',
  });
}
