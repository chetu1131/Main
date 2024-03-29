const express = require("express");
const app = express();
const router = express.Router();
const verifyToken = require("../middleware/authMiddleware.js");


//middlewares
app.set("view engine", "ejs");

/* GET home page. */
router.get("/clock", verifyToken,async (req, res) => {
  res.render(__dirname + "/views/clock");
  //    console.log(Intl.DateTimeFormat().resolvedOptions().timeZone);
});

router.get("clock/getcities/:id", async (req, res) => {});

module.exports = router;
