const mysql = require("mysql");
require("dotenv").config();
 
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DATABASE1,
});

connection.connect(function (error) {
  if (error) {
    throw error;
  } else {
    // console.log("MySQL Database is connected Successfully");
  }
});

module.exports = connection;

// checkConnection() {
//   this.db.getConnection((err, connection) => {
//       if (err) {
//           if (err.code === 'PROTOCOL_CONNECTION_LOST') {
//               console.error('Database connection was closed.');
//           }
//           if (err.code === 'ER_CON_COUNT_ERROR') {
//               console.error('Database has too many connections.');
//           }
//           if (err.code === 'ECONNREFUSED') {
//               console.error('Database connection was refused.');
//           }
//       }
//       if (connection) {
//           connection.release();
//       }
//       return
//   });
// }
