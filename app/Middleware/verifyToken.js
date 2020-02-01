const jwt = require("jsonwebtoken");
const { env } = require("../../config/env");
const User = require("../Models/User");
const verifyToken = (request, response, next) => {
  const bearerHeader = request.headers["authorization"];

  if (typeof bearerHeader !== "undefined") {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];
    request.token = bearerToken;
    next();
  } else {
    response.status(403).json({ msg: "JWT token required", error: true });
  }
};

const verifyJWT = async token => {
  let user = jwt.verify(token, env.secret);
  return auth(user);
};

const auth = async user => {
  return User.findOne({ where: { id: user.id } });
};

exports.verifyToken = verifyToken;
exports.verifyJWT = verifyJWT;
