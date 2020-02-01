const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { env } = require("../../../config/env");
const User = require("../../Models/User");
const { users } = require("../../../users");

class UserController {
  static async login(request, response) {
    let { username, password } = request.body;
    let errors = [];
    if (!username) {
      errors.push({ text: "Please provide your username", field: "username" });
    }
    if (!password) {
      errors.push({
        text: "Enter your password",
        field: "password"
      });
    }
    if (errors.length > 0) {
      return response.json(errors);
    }
    try {
      const findUser = await User.findOne({ where: { username } });
      if (!findUser) {
        return response.json({
          msg: "Couldn't find a user with provided username"
        });
      }
      const match = await bcrypt.compare(password, findUser.password);
      if (match) {
        const user = {
          id: findUser.id,
          username,
          email: findUser.email
        };
        try {
          const token = await jwt.sign(user, env.secret, {
            expiresIn: "1h"
          });
          response.json({ token });
        } catch (error) {
          response.json({ error });
        }
      } else {
        response.json({ msg: "Your credentials are not correct", error: true });
      }
    } catch (error) {
      response.json({ error });
    }
  }

  static async index(_req, res) {
    try {
      const users = await User.findAll();
      res.json(users);
    } catch (err) {
      console.log(err);
      return res.json({ msg: "Query error" });
    }
  }

  static getUser(req, res) {
    const { id } = req.params;
    const found = users.some(user => user.id == id);
    if (found) {
      res.json(users.filter(user => user.id == id));
    } else {
      res.status(404).json({ msg: "User not found" });
    }
  }

  static create(req, res) {
    const { name, email } = req.body;
    const newUser = {
      name,
      email,
      id: 4,
      status: "online"
    };
    if (!name || !email) {
      return res.status(400).json({ msg: "Please include a name and email" });
    }
    users.push(newUser);
    res.json(users);
  }

  static edit(req, res) {
    const { id } = req.params;
    const { name, email } = req.body;

    const found = users.some(user => user.id == id);
    if (found) {
      users.forEach(user => {
        if (id == user.id) {
          user.name = name ? name : user.name;
          user.email = email ? email : user.email;
          res.json({ msg: "User info updated", user });
        }
      });
    } else {
      res.status(404).json({ msg: "No user found" });
    }
  }

  static destroy(req, res) {
    const { id } = req.params;
    const found = users.some(user => user.id == id);
    if (found) {
      res.json({
        msg: "User deleted",
        users: users.filter(user => user.id != id)
      });
    } else {
      res.status(404).json({ msg: "No user found" });
    }
  }
}
module.exports = UserController;
