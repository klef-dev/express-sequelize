const { users } = require("../../../users");

class HomeController {
  static async home(req, res) {
    res.render("index", { users });
  }
}

module.exports = HomeController;
