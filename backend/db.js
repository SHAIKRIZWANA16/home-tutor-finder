const mysql = require('mysql2');

// 1) MySQL connection settings
// Change user and password to match your MySQL setup
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // your MySQL user
  password: 'root@123', // your MySQL password
  database: 'tutor_app' // database you created
});
exports.db = db;
