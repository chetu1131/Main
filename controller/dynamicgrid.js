const express = require("express");
const mysql = require("mysql");
const router = express.Router();
const verifyToken = require("../middleware/authMiddleware.js");

const app = express();

var len;
var query;
var recordperpage = 20;

//middlewares
app.set("view engine", "ejs");

const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "Dev@123",
  database: "StudentDb260224",
});

connection.connect(function (err) {
  if (err) {
    // console.error("Error connecting to MYSQL:", err);
    return;
  }
  // console.log("Connected to MYSQL database!");
});

router.get("/grid",verifyToken, (req, res) => {
  if (req.query.query) {
    if (req.body.recordperpage) recordperpage = req.body.recordperpage;
    page = req.query.page || 1;

    if (req.query.page) page = req.query.page;

    connection.query(
      query,
      [(page - 1) * recordperpage, parseInt(recordperpage)],
      (err, result, fields) => {
        console.log(query);
        if (err) throw err;
        else if (result.fieldCount == 0) res.end("Query success");
        else
          res.render(__dirname + "/views/query", {
            data: false,
            result,
            fields,
            currentPage: page,
            query,
            len,
            url: "/query",
            recordperpage,
          });
        res.render(__dirname + "/views/query");
      }
    );
  } else {
    res.render(__dirname + "/views/query", {
      data: false,
    });
  }
});

router.post("/query",verifyToken, (req, res) => {
  query = req.body.search;
  if (req.body.recordperpage) recordperpage = req.body.recordperpage;
  page = req.query.page || 1;

  connection.query(query, (err, result, fields) => {
    if (err) res.send(err.message);
    len = result.length;
    if (len)
      if (query.search("limit") == -1) {
        if (req.query.page) page = req.query.page;
        if (query.search(";") != -1) {
          query = query.replace(";", " limit ?,?; ");
        } else {
          query += " limit ?,? ";
        }
        connection.query(
          query,
          [(page - 1) * recordperpage, parseInt(recordperpage)],
          (err, result) => {
            console.log(query);
            if (err) throw err;
            else if (result.fieldCount == 0) res.end("Query success");
            else
              res.render(__dirname + "/views/query", {
                data: true,
                result,
                fields,
                currentPage: page,
                query,
                len,
                url: "/query",
                recordperpage,
              });
          }
        );
      } else {
        connection.query(query, (err, limit) => {
          if (err) res.send(err.message);
          var len = limit.length;
          query = query.replace("limit", " limit ?,? ; ");

          query = query.substring(0, query.indexOf(";") + 1);

          connection.query(query, [
            (page - 1) * recordperpage,
            parseInt(recordperpage),
            (err, result) => {
              console.log(query);
              if (err) res.end("Error : " + err.mesaage);
              else if (result.fieldCount == 0) res.end("Query Done");
              else {
                res.render(__dirname + "/views/query", {
                  data: true,
                  result,
                  fields,
                  len,
                  currentPage: page,
                  recordperpage,
                  query,
                  url: "/query",
                });
              }
            },
          ]);
        });
      }
    else {
      res.send("please enter query");
    }
  });

  router.get("/query", (req, res) => {
    console.log("hello");
    if (req.query.recordperpage) recordperpage = req.query.recordperpage;
    page = req.query.page || 1;

    if (req.query.page) page = req.query.page;

    connection.query(
      query,
      [(page - 1) * recordperpage, parseInt(recordperpage)],
      (err, result, fields) => {
        console.log(query);
        if (err) throw err;
        else if (result.fieldCount == 0) res.end("Query success");
        else
          res.render(__dirname + "/views/query", {
            data: true,
            result,
            fields,
            currentPage: page,
            query,
            len,
            url: "/query",
            recordperpage,
          });
      }
    );
  });
});

module.exports = router;
