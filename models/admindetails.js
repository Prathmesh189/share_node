'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class adminDetails extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  adminDetails.init({
    name: DataTypes.STRING,
    advancePrice: DataTypes.DOUBLE,
    shareLink: DataTypes.STRING,
    ratingLink: DataTypes.STRING,
    password: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'adminDetails',
  });
  return adminDetails;
};