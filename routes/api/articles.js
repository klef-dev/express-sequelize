const express = require("express").Router();
const {
  index,
  create,
  edit,
  destroy
} = require("../../app/Controllers/Http/ArticleController");
const router = express;

router.get("/", index);
router.post("/", create);
router.patch("/:id", edit);
router.delete("/:id", destroy);

module.exports = router;
