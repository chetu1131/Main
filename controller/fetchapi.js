const express = require("express");
const app = express();
const router = express.Router();
const verifyToken = require("../middleware/authMiddleware.js");

// app.use(express.static(__dirname + "/public"));
// app.set("view engine", "ejs");

router.get("/user", verifyToken, (req, res) => {
  res.render(__dirname + "/views/fetchapi");
});
router.get("/user/alldetails", verifyToken, (req, res) => {
  var id = req.query.id;
  res.render(__dirname + "/views/alldetails", { id: id });
});

module.exports = router;
