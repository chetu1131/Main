const mysql = require("mysql");
var connection = mysql.createConnection({
  host: "localhost",
  database: "studentmaster0603",
  user: "root",
  password: "Dev@123",
});

connection.connect(function (error) {
  if (error) {
    throw error;
  } else {
    console.log("MySQL Database is connected Successfully");
  }
});

module.exports = connection;
