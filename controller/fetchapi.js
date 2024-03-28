const express = require("express");
const app = express();
const router = express.Router();

// app.use(express.static(__dirname + "/public"));
// app.set("view engine", "ejs");


router.get("/user", (req, res) => {
  res.render(__dirname + "/views/fetchapi");
});
router.get("/user/alldetails", (req, res) => {
  var id = req.query.id;
  res.render(__dirname + "/views/alldetails", { id: id });
});

module.exports = router;
