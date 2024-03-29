const express = require("express");
const app = express();
const verifyToken = require("../middleware/authMiddleware.js");
 
const router = express.Router();
const mysql = require("mysql");

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

let q = `select * from StudentMaster limit 5000;`;

router.get("/delimeter",verifyToken, (req, res) => {
  connection.query(q, (err, result, fields) => {
    if (err) throw err;
    else {
      res.render(__dirname+"/views/delisearchs", { result: result, fields, search: search });
    }
  });
});

let search;
router.post("/delimeter",verifyToken, (req, res) => {
  search = req.body.search;
  console.log(search);
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
      search[i] == "}" ||
      search[i] == ":" ||
      search[i] == ""
    ) {
      arr.push(i);
    }
  }

  console.log(arr);

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

  var sql = `SELECT * FROM StudentMaster where `;

  // if (!firstname[0]) firstname[0] = "%_";
  // if (!lastname[0]) lastname[0] = "%_";
  // if (!email[0]) email[0] = "%_";
  // if (!address[0]) address[0] = "%_";
  // if (!phonenumber[0]) phonenumber[0] = "%_";

  if (firstname.length >= 1) {
    for (let i = 0; i < firstname.length; i++) {
      sql += `FirstName LIKE '%${firstname[i]}%' or `;
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (lastname.length >= 1) {
    for (let i = 0; i < lastname.length; i++) {
      sql += `LastName LIKE '%${lastname[i]}%' or `;
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (email.length >= 1) {
    for (let i = 0; i < email.length; i++) {
      sql += `Email LIKE '%${email[i]}%' or `;
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (phonenumber.length >= 1) {
    for (let i = 0; i < phonenumber.length; i++) {
      sql += `PhoneNumber LIKE '%${phonenumber[i]}%' or `;
    }
    sql = sql.slice(0, sql.length - 3) + " and ";
  }
  if (address.length >= 1) {
    for (let i = 0; i < address.length; i++) {
      sql += `Address LIKE '%${address[i]}%' or `;
    }
    sql = sql.slice(0, sql.length - 3) + " and";
  }

  sql = sql.slice(0, sql.length - 6) + "limit 5000;";

  console.log(firstname);
  console.log(lastname);
  console.log(sql);

  connection.query(sql, function (err, result, fields) {
    if (err) throw err;
    res.render(__dirname +"/views/search", {
      result: result,
      fields: fields,
      search: search,
    });
  });
});

module.exports = router;
