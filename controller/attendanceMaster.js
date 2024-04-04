const express = require("express");
const connection = require("../connection/connection1.js");

let m, y;

const attedance = (req, res) => {
  console.log("hello from attendence master");
  if (req.query.month || req.query.year) {
    m = req.query.month;
    y = req.query.year;
  }
  let page = req.query.page || "0";
  // let sortBy = req.query.sortBy || "1";
  let values = [y, m];
  let sql =
    "SELECT StudentMaster.StudentID, StudentMaster.FirstName, YEAR (AttdenanceMaster.AttendDate) as year,MONTH(AttdenanceMaster.AttendDate) as month,count(distinct if(AttdenanceMaster.attendace = 'P',AttdenanceMaster.AttendDate,null)) as TotalPresent,count(distinct if(AttdenanceMaster.attendace = 'P',AttdenanceMaster.AttendDate,null))* 100/30 as Percentage from StudentMaster inner join AttdenanceMaster on  StudentMaster.StudentID= AttdenanceMaster.StudentID   WHERE YEAR(AttdenanceMaster.AttendDate)= ? and MONTH(AttdenanceMaster.AttendDate)= ? group by year,month, StudentMaster.StudentID" +
    " LIMIT " +
    page * 20 +
    ",20;";

  connection.query(sql, values, function (err, result, fields) {
    if (err) throw err;
    res.render("../views/attedance", {
      attedance: result,
      currentPage: page,
      month: m,
      year: y,
    });
  });
};

module.exports = attedance;
