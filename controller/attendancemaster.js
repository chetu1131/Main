const express = require("express");
const router = express.Router();
const mysql = require("mysql");
const verifyToken = require("../middleware/authMiddleware.js");

const app = express();

// var bodyParser = require("body-parser");

// app.use(bodyParser.urlencoded({ extended: true }));

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

var m, y;
// Retive all data in views
var attedance = {};
router.get("/allattendance",verifyToken, (req, res) => {
  connection.connect(function (err) {
    if (req.query.month || req.query.year) {
      m = req.query.month;
      y = req.query.year;
    }
    var page = req.query.page || "0";
    var sortBy = req.query.sortBy || "1";

    var sql =
      `SELECT StudentMaster.StudentID, StudentMaster.FirstName, YEAR (AttdenanceMaster.AttendDate) as year,
        MONTH(AttdenanceMaster.AttendDate) as month,
        count(distinct if(AttdenanceMaster.attendace = 'P',AttdenanceMaster.AttendDate,null)) as 
        TotalPresent,
        count(distinct if(AttdenanceMaster.attendace = 'P',AttdenanceMaster.AttendDate,null))* 100/30 as 
        Percentage from StudentMaster
        inner join AttdenanceMaster on  StudentMaster.StudentID= AttdenanceMaster.StudentID 
        WHERE YEAR(AttdenanceMaster.AttendDate)="${y}" and MONTH(AttdenanceMaster.AttendDate)="${m}"
        group by
        year,month, StudentMaster.StudentID` +
      " LIMIT " +
      page * 20 +
      ",20;";

    connection.query(sql, function (err, result, fields) {
      if (err) throw err;
      res.render(__dirname + "/views/attedance", {
        attedance: result,
        currentPage: page,
        month: m,
        year: y,
      });
    });
  });
});
module.exports = router;
