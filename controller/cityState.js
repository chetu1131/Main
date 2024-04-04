const express = require("express");
const connection = require("../connection/connection.js");

const executeQuery = (sql, values) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, values, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};
const cityState = async (req, res) => {
  try {
    let sql = "SELECT id,statename FROM states";
    let result = await executeQuery(sql);
    res.render("../views/citystate", {
      title: "Express",
      state_data: result,
    });
  } catch (error) {
    res.json(err.message);
  }
};

const getCity = async (req, res) => {
  try {
    let id = req.params.id;
    let sql2 = "SELECT name FROM cities WHERE state_id= ? ";
    let result2 = await executeQuery(sql2, id);
    res.send(result2);
  } catch (error) {
    res.json(error.message);
  }
};

module.exports = { cityState, getCity };
