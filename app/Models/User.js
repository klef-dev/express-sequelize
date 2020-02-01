const Sequelize = require("sequelize");
const db = require("../../config/database");
const Article = require("./Article");

const User = db.define("users", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  name: {
    type: Sequelize.STRING
  },
  username: {
    type: Sequelize.STRING
  },
  email: {
    type: Sequelize.STRING
  },
  password: {
    type: Sequelize.STRING
  },
  reg_no: {
    type: Sequelize.INTEGER
  }
});

User.hasMany(Article, { as: "Articles" });
Article.belongsTo(User);
module.exports = User;
