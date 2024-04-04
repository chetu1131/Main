const express = require("express");
const router = express.Router();
const connection = require("../connection/connection1.js");

let len;
let query;
let recordperpage = 20;

const grid = (req, res) => {
  if (req.query.query) {
    if (req.body.recordperpage) recordperpage = req.body.recordperpage;
    page = req.query.page || 1;

    if (req.query.page) page = req.query.page;

    connection.query(
      query,
      [(page - 1) * recordperpage, parseInt(recordperpage)],
      (err, result, fields) => {
        if (err) throw err;
        else if (result.fieldCount == 0) res.end("Query success");
        else
          res.render("../views/query", {
            data: false,
            result,
            fields,
            currentPage: page,
            query,
            len,
            url: "/query",
            recordperpage,
          });
        res.render("../views/query");
      }
    );
  } else {
    res.render("../views/query", {
      data: false,
    });
  }
};

const postQuery = (req, res) => {
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
            if (err) throw err;
            else if (result.fieldCount == 0) res.end("Query success");
            else
              res.render("../views/query", {
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
          let len = limit.length;
          query = query.replace("limit", " limit ?,? ; ");

          query = query.substring(0, query.indexOf(";") + 1);

          connection.query(query, [
            (page - 1) * recordperpage,
            parseInt(recordperpage),
            (err, result) => {
              if (err) res.end("Error : " + err.mesaage);
              else if (result.fieldCount == 0) res.end("Query Done");
              else {
                res.render("../views/query", {
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
};

const getQuery =  (req, res) => {
  if (req.query.recordperpage) recordperpage = req.query.recordperpage;
  page = req.query.page || 1;

  if (req.query.page) page = req.query.page;

  connection.query(
    query,
    [(page - 1) * recordperpage, parseInt(recordperpage)],
    (err, result, fields) => {
      if (err) throw err;
      else if (result.fieldCount == 0) res.end("Query success");
      else
        res.render("../views/query", {
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
};

module.exports = { grid, postQuery ,getQuery};
