const Sequelize = require("sequelize");
const db = require("../../config/database");

const Tutorial = db.define("tutorial", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  name: {
    type: Sequelize.STRING(65),
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please enter your name"
      }
    }
  },
  venue: {
    type: Sequelize.STRING,
    allowNull: false
  },
  description: {
    type: Sequelize.STRING
  },
  course_code: {
    type: Sequelize.STRING(6),
    allowNull: false
  },
  image: {
    type: Sequelize.STRING
  },
  day: {
    type: Sequelize.STRING(10),
    allowNull: false
  },
  time: {
    type: Sequelize.TIME
  }
});

module.exports = Tutorial;
