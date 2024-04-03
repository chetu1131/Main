const express = require("express");

const router = express.Router();

/* GET home page. */
const clock = async (req, res) => {
  res.render("../views/clock");
  //    console.log(Intl.DateTimeFormat().resolvedOptions().timeZone);
};

module.exports = clock;
