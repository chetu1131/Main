const express = require("express");

const connection = require("../connection/connection1.js");

let q = "select * from StudentMaster limit 5000;";

const delimeter = (req, res) => {
  connection.query(q, (err, result, fields) => {
    if (err) throw err;
    else {
      res.render("../views/delisearchs", {
        result: result,
        fields,
        search,
      });
    }
  });
};

let search;
const postDelimeter = (req, res) => {
  search = req.body.search;
  let arr = [],
    firstname = [],
    lastname = [],
    email = [],
    address = [],
    phonenumber = [];

  for (let i = 0; i < search.length; i++) {
    if (
      search[i] == "_" ||
      search[i] == "^" ||
      search[i] == "$" ||
      search[i] == "{" ||
      search[i] == ":" ||
      search[i] == ""
    ) {
      arr.push(i);
    }
  }

  j = 0;
  for (let i = 0; i < search.length; i++) {
    switch (search[i]) {
      case "_":
        firstname.push(search.substring(arr[j] + 1, arr[j + 1]));
        j++;
        break;
      case "^":
        lastname.push(search.substring(arr[j] + 1, arr[j + 1]));
        j++;
        break;
      case "$":
        email.push(search.substring(arr[j] + 1, arr[j + 1]));
        j++;
        break;

      case "{":
        phonenumber.push(search.substring(arr[j] + 1, arr[j + 1]));
        j++;
        break;

      case ":":
        address.push(search.substring(arr[j] + 1, arr[j + 1]));
        j++;
        break;
      default:
        continue;
    }
  }

  let sql = "SELECT * FROM StudentMaster where ";

  if (firstname.length >= 1) {
    for (let i = 0; i < firstname.length; i++) {
      sql += "FirstName LIKE '%" + firstname[i] + "%' or ";
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (lastname.length >= 1) {
    for (let i = 0; i < lastname.length; i++) {
      sql += "LastName LIKE '%" + lastname[i] + "%' or ";
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (email.length >= 1) {
    for (let i = 0; i < email.length; i++) {
      sql += "Email LIKE '%" + email[i] + "%' or ";
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (phonenumber.length >= 1) {
    for (let i = 0; i < phonenumber.length; i++) {
      sql += "PhoneNumber LIKE '%" + phonenumber[i] + "%' or ";
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (address.length >= 1) {
    for (let i = 0; i < address.length; i++) {
      sql += "Address LIKE '%" + address[i] + "%' or ";
    }
    sql = sql.slice(0, sql.length - 3) + " and";
  }

  sql = sql.slice(0, sql.length - 5) + " limit 5000;";

  connection.query(sql, function (err, result, fields) {
    if (err) throw err;
    res.render("../views/search", {
      result: result,
      fields: fields,
      search: search,
    });
  });
};

module.exports = { delimeter, postDelimeter };
