const express = require("express");
const connection = require("../connection/connection.js");

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};
const cityState = async (req, res) => {
  try {
    var sql = `SELECT id,statename FROM states`;
    var result = await executeQuery(sql);
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
    var id = req.params.id;
    var sql2 = `SELECT name FROM cities WHERE state_id='${id}' `;
    var result2 = await executeQuery(sql2);
    // console.log(result2);
    res.send(result2);
  } catch (error) {
    res.json(error.message)
  }
};

module.exports = { cityState, getCity };
