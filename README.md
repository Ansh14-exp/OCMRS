# 🎓 Online College Management and Recruitment System (OCMRS)

> A web-based Java application designed to manage college information, students, recruitment activities, applications, interviews, and placements through a centralized platform.

---

## 📌 About the Project

**Online College Management and Recruitment System (OCMRS)** is a web-based application developed to simplify and centralize college management and recruitment-related activities.

The system provides different functionalities for **Students, Colleges, Companies, and Administrators**. It allows administrators to manage academic and recruitment data while providing a structured platform for handling jobs, applications, interviews, and placements.

The project is developed using **Java Servlets, JSP, JDBC, MySQL, and Apache Tomcat** and follows an **MVC-oriented architecture**.

---

## 🎯 Objectives

- Centralize college management and recruitment activities.
- Manage student and college information efficiently.
- Manage departments, courses, and faculty.
- Allow companies to manage recruitment opportunities.
- Manage job postings and student applications.
- Track interviews and placement records.
- Provide administrators with centralized management and reporting.
- Gain practical experience in Java web development and database-driven applications.

---

## 👥 User Roles

### 👨‍🎓 Student

The student module is designed to provide functionalities such as:

- Student registration and login
- Profile management
- College and course browsing
- Admission-related activities
- Job and recruitment browsing
- Job applications
- Application status tracking
- Interview and placement information

### 🏫 College

The college module supports:

- College profile management
- Department management
- Course management
- Faculty management
- Student information management
- Admission-related activities
- Recruitment participation

### 🏢 Company

The recruitment module supports:

- Company profile management
- Job posting
- Job descriptions
- Salary and location information
- Recruitment activities
- Application and interview processing

### 👨‍💼 Administrator

The Admin module provides centralized management of:

- Students
- Colleges
- Departments
- Courses
- Faculty
- Companies
- Jobs
- Applications
- Interviews
- Placements
- Reports

---

## 🧩 Main Modules

| Module | Description |
|---|---|
| 🔐 Authentication | Login and user access management |
| 📊 Admin Dashboard | Centralized navigation for administrative operations |
| 👨‍🎓 Student Management | Manage student records |
| 🏫 College Management | Manage college information |
| 🏢 Department Management | Manage departments and HOD information |
| 📚 Course Management | Manage courses, duration, and level |
| 👨‍🏫 Faculty Management | Manage faculty and designations |
| 🏭 Company Management | Manage company profiles |
| 💼 Job Management | Manage recruitment opportunities |
| 📝 Application Management | Manage student job applications |
| 🎤 Interview Management | Manage interview schedules and results |
| 🎓 Placement Management | Manage placement records |
| 📈 Reports | Display administrative and recruitment information |

---

## 🏗️ System Architecture

The project follows an MVC-oriented layered architecture:

```text
             ┌─────────────────────┐
             │      JSP / UI        │
             │   HTML + CSS + JSP   │
             └──────────┬──────────┘
                        │
                        ▼
             ┌─────────────────────┐
             │      Servlets       │
             │ Request Handling    │
             └──────────┬──────────┘
                        │
                        ▼
             ┌─────────────────────┐
             │        DAO          │
             │ Database Operations │
             └──────────┬──────────┘
                        │
                        ▼
             ┌─────────────────────┐
             │        JDBC         │
             │ Database Connection │
             └──────────┬──────────┘
                        │
                        ▼
             ┌─────────────────────┐
             │       MySQL         │
             │      Database       │
             └─────────────────────┘

| Technology         | Purpose                                |
| ------------------ | -------------------------------------- |
| ☕ Java 8           | Backend programming                    |
| 🌐 JSP             | Dynamic web pages                      |
| ⚙️ Java Servlets   | Request handling and application logic |
| 🔗 JDBC            | Database connectivity                  |
| 🗄️ MySQL          | Relational database                    |
| 🐱 Apache Tomcat 9 | Application server                     |
| 💻 Eclipse         | Development environment                |
| 🔧 Git             | Version control                        |
| 🐙 GitHub          | Repository and collaboration           |


