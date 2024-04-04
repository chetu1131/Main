const express = require("express");

/* GET home page. */
const clock = async (req, res) => {
  res.render("../views/clock");
  //  Intl.DateTimeFormat().resolvedOptions().timeZone
};

module.exports = clock;
