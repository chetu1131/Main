const express = require("express");
const app = express();
const router = express.Router();
const connection = require("../connection");

//middlewares
app.set("view engine", "ejs");

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

router.get("/citystate", async (req, res) => {
  var sql = `SELECT id,statename FROM states`;
  var result = await executeQuery(sql);
  res.render(__dirname + "/views/citystate", {
    title: "Express",
    state_data: result,
  });
});

router.get("/citystate/getcities/:id", async (req, res) => {
  var id = req.params.id;

  var sql2 = `SELECT name FROM cities WHERE state_id='${id}' `;
  var result2 = await executeQuery(sql2);
  // console.log(result2);
  res.send(result2);
});

module.exports = router;
