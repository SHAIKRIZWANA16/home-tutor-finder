// backend/server.js
const express = require('express');
const path = require('path');
const { db } = require('./db');
const app = express();
exports.app = app;
const PORT = 3000;

// 2) Connect once when server starts
db.connect(err => {
  if (err) {
    console.error('MySQL connection error:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

// 3) Serve static frontend files (index.html, style.css, script.js) from ../public
app.use(express.static(path.join(__dirname, '..', 'public')));

// 4) API: GET /api/tutors?class=10&subject=math
app.get('/api/tutors', (req, res) => {
  const classParam = req.query.class;
  const subjectParam = req.query.subject;

  let sql = 'SELECT * FROM tutors WHERE 1=1';
  const params = [];

  if (classParam) {
    sql += ' AND class = ?';
    params.push(classParam);
  }
  if (subjectParam) {
    sql += ' AND subject = ?';
    params.push(subjectParam);
  }

  db.query(sql, params, (err, results) => {
    if (err) {
      console.error('Query error:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// 5) Root route: send index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});

// 6) Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
