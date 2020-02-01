const Sequelize = require("sequelize");
const db = require("../../config/database");
const User = require("./User");

const Article = db.define("articles", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  user_id: {
    type: Sequelize.INTEGER(11).UNSIGNED,
    references: {
      model: User,
      key: "id"
    }
  },
  topic: {
    type: Sequelize.STRING(100),
    allowNull: false
  },
  body: {
    type: Sequelize.STRING(400),
    allowNull: false
  },
  image: {
    type: Sequelize.STRING(191),
    allowNull: false
  },
  btn_text: {
    type: Sequelize.STRING(20),
    allowNull: false
  },
  comments: {
    type: Sequelize.INTEGER(11),
    allowNull: false,
    defaultValue: 0
  },
  claps: {
    type: Sequelize.INTEGER(11),
    allowNull: false,
    defaultValue: 0
  }
});

module.exports = Article;
