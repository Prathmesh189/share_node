const { Model, DataTypes } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class ModuleNames extends Model {
    static associate(models) {
      // Add associations here
    }
  }

  ModuleNames.init(
    {
      course_id: DataTypes.INTEGER,
      module_id: DataTypes.INTEGER,
      moduleNames: DataTypes.STRING,
    },
    {
      sequelize,
      modelName: 'ModuleNames', // Model name should be capitalized here
      tableName: 'modulenames', // Make sure the table name matches the actual database table
    }
  );

  return ModuleNames;
};
