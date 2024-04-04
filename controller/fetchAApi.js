const express = require("express");

const user = (req, res) => {
  res.render("../views/fetchapi");
};
const userAlldetails = (req, res) => {
  var id = req.query.id;
  res.render("../views/alldetails", { id: id });
};

module.exports = { user, userAlldetails };
