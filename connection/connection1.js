const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "Dev@123",
  database: "StudentDb260224",
});

connection.connect(function (error) {
  if (error) {
    throw error;
  } else {
    // console.log("MySQL Database is connected Successfully");
  }
});

module.exports = connection;
