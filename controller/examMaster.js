const connection = require("../connection/connection1.js");

const examResult = (req, res) => {
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
            res.render("../views/exams", {
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
};

const ResultDetail = (req, res) => {
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
              res.render("../views/StudentDetail", {
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
};

module.exports = { examResult, ResultDetail };
