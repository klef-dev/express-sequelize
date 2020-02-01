const express = require("express");
const router = express.Router();
const {
  index,
  getUser,
  create,
  login,
  edit,
  destroy
} = require("../../app/Controllers/Http/UserController");

router.get("/", index);

router.get("/:id", getUser);

router.post("/", create);
router.post("/login", login);

router.patch("/:id", edit);

router.delete("/:id", destroy);

module.exports = router;
