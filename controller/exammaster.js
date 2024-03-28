const express = require("express");
const router = express.Router();
const mysql = require("mysql");
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
    console.error("Error connecting to MYSQL:", err);
    return;
  }
  console.log("Connected to MYSQL database!");
});

var m, y;
// Retive all data in views
var attedance = {};
router.get("/allattendance", (req, res) => {
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
      res.render(__dirname+"/views/attedance", {
        attedance: result,
        currentPage: page,
        month: m,
        year: y,
      });
    });
  });
});

// var days = {};
// app.get("/totalattendace", (req, res) => {
//   connection.connect(function (err) {
//     // if (err) throw err;
//     var page = req.query.page || "0";
//     var sortBy = req.query.sortBy || "1";
//     if (page < 0) {
//       var sql = "SELECT * FROM AttednaceMaster LIMIT " + page * 0 + ",200;";
//     } else {
//       var sql =
//         "SELECT * FROM AttednaceMaster" +
//         " ORDER BY " +
//         sortBy +
//         " LIMIT " +
//         page * 200 +
//         ",200;";
//     }

//     connection.query(sql, function (err, result, fields) {
//       if (err) throw err;
//       res.render("totalattendace", { days: result, currentPage: page });
//     });
//   });
// });

var results = {};
router.get("/results", (req, res) => {
  connection.connect(function (err) {
    var page = req.query.page || "0";
    var sortBy = req.query.sortBy || "1";
    if (page < 0) {
      var sql = "SELECT * FROM ExamMaster1 LIMIT " + page * 0 + ",20;";
    } else {
      var sql =
        `select StudentMaster27.StudentID , StudentMaster27.FirstName, StudentMaster27.LastName,
        sum(ResultMaster27.Theory_marks) as theory, sum(ResultMaster27.Practical_marks)as Practical
        from ResultMaster27 join StudentMaster27 join ExamMaster27 join SubjectMaster27
        on StudentMaster27.StudentID = ResultMaster27.StudentID and  ExamMaster27.ExamID = ResultMaster27.ExamID and SubjectMaster27.SubjectID = ResultMaster27.SubjectID
        where ExamType = ?
        group by StudentMaster27.StudentID,ResultMaster27.StudentID` +
        " LIMIT " +
        page * 20 +
        ",200;";
    }

    if (req.query.search) {
      sql = sql.replace(
        "group",
        "or StudentMaster27.StudentID in (" + req.query.search + ") group"
      );
    }
    let firstname = req.query.firstname;
    let lastname = req.query.lastname;
    if (firstname || lastname) {
      sql = sql.replace(
        "group",
        "and StudentMaster27.FirstName like '%" +
          firstname +
          "%'" +
          "and StudentMaster27.LastName like '%" +
          lastname +
          "%' group"
      );
    }

    connection.query(sql, "Terminal", function (err, result, fields) {
      if (err) throw err;
      connection.query(sql, "Prelime", function (err, result2, fields) {
        if (err) throw err;
        connection.query(sql, "Final", function (err, result3, fields) {
          if (err) throw err;
          var totalResult = `select StudentMaster27.StudentID, StudentMaster27.FirstName,
            sum(ResultMaster27.Theory_marks+ResultMaster27.Practical_marks) as TotalMarks
            from 
            ResultMaster27 join StudentMaster27  join SubjectMaster27 
            on StudentMaster27.StudentID = ResultMaster27.StudentID   and SubjectMaster27.SubjectID = ResultMaster27.SubjectID 
            group by StudentMaster27.StudentID,StudentMaster27.FirstName`;
          connection.query(totalResult, function (err, totalResult) {
            if (err) throw err;
            res.render(__dirname+"/views/exams", {
              result,
              result2,
              result3,
              totalResult,
              currentPage: page,
            });
          });
        });
      });
    });
  });
});

router.get("/ResultDetail", (req, res) => {
  connection.connect(function (err) {
    // if (err) throw err;
    var StudentID = req.query.StudentID || "1";
    var sql = `select StudentMaster27.StudentID, StudentMaster27.FirstName, StudentMaster27.LastName,
    SubjectMaster27.SubjectName, SubjectMaster27.SubjectID,
    sum(ResultMaster27.Theory_marks) as theory, sum(ResultMaster27.Practical_marks)as Practical
    from ResultMaster27
    join StudentMaster27 join ExamMaster27 join SubjectMaster27
    on StudentMaster27.StudentID = ResultMaster27.StudentID and  ExamMaster27.ExamID =ResultMaster27.ExamID and SubjectMaster27.SubjectID = ResultMaster27.SubjectID
    where StudentMaster27.StudentID = ${StudentID} and  ExamType = ?
    group by StudentMaster27.StudentID,SubjectMaster27.SubjectID;`;

    connection.query(sql, "Terminal", function (err, result) {
      connection.query(sql, "Prelime", function (err, result2) {
        connection.query(sql, "Final", function (err, result3) {
          if (err) throw err;
          var StudentID = req.query.StudentID || "1";
          var sql4 = `select count(distinct if(AttdenanceMaster.attendace = 'P',AttdenanceMaster.AttendDate,null))* 100/91 as PresentPercentage  
          from AttdenanceMaster join StudentMaster27 on StudentMaster27.StudentID = AttdenanceMaster.StudentID where StudentMaster27.StudentID = ${StudentID};`;
          connection.query(sql4, function (err, result4) {
            if (err) throw err;
            var StudentID = req.query.StudentID || "1";
            var sql5 = `select sum(ResultMaster27.Theory_marks+ResultMaster27.Practical_marks)* 6/100 as Percentage  
            from StudentMaster27 join ResultMaster27 on  
            StudentMaster27.StudentID = ResultMaster27.StudentID
            where StudentMaster27.StudentID = ${StudentID}`;
            connection.query(sql5, function (err, result5) {
              res.render(__dirname+"/views/StudentDetail", {
                result,
                result2,
                result3,
                result4,
                result5,
              });
            });
          });
        });
      });
    });
  });
});

module.exports = router;
