const Sequelize = require("sequelize");
const { env } = require("./env");
const sequelize = new Sequelize(env.dbname, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,
  define: {
    timestamps: true,
    underscored: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
  },
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

module.exports = sequelize;
