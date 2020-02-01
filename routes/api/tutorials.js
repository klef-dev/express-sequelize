const express = require("express").Router();
const { verifyToken } = require("../../app/Middleware/verifyToken");
const {
  index,
  single,
  create,
  edit,
  destroy
} = require("../../app/Controllers/Http/TutorialController");
const router = express;

router.get("/", index);
router.get("/:id", single);
router.post("/", verifyToken, create);
router.patch("/:id", verifyToken, edit);
router.delete("/:id", verifyToken, destroy);

module.exports = router;
