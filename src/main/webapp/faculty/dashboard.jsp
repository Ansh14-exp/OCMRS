<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.User" %>

<%
    Faculty faculty =
            (Faculty) session.getAttribute("faculty");

    User user =
            (User) session.getAttribute("user");

    if (user == null ||
        !"FACULTY".equalsIgnoreCase(user.getRole())) {

        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );

        return;
    }

    if (faculty == null) {

        response.sendRedirect(
            request.getContextPath() + "/LoginServlet"
        );

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Faculty Dashboard | OCMRS</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f4f7fb;
    color: #1f2937;
}

/* SIDEBAR */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 245px;
    height: 100vh;
    background: #172554;
    color: white;
    padding: 25px 15px;
}

.logo {
    text-align: center;
    font-size: 23px;
    font-weight: bold;
    margin-bottom: 8px;
}

.logo-sub {
    text-align: center;
    font-size: 11px;
    color: #bfdbfe;
    margin-bottom: 30px;
}

.menu a {
    display: block;
    color: #dbeafe;
    text-decoration: none;
    padding: 13px 15px;
    margin: 5px 0;
    border-radius: 8px;
    font-size: 14px;
}

.menu a:hover,
.menu a.active {
    background: #2563eb;
    color: white;
}

.logout {
    margin-top: 25px;
    background: #dc2626 !important;
    color: white !important;
}

/* MAIN */

.main {
    margin-left: 245px;
    padding: 30px;
}

/* TOP */

.topbar {
    background: #E1D9D1;
    padding: 22px 25px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
    margin-bottom: 25px;
}

.topbar h1 {
    font-size: 27px;
    color: #172554;
    margin-bottom: 6px;
}

.topbar p {
    color: #64748b;
    font-size: 14px;
}

/* PROFILE */

.profile-card {
    background: linear-gradient(
        135deg,
        #172554,
        #2563eb
    );

    color: white;

    padding: 28px;

    border-radius: 15px;

    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-bottom: 25px;

    box-shadow: 0 8px 25px rgba(37,99,235,0.18);
}

.profile-info h2 {
    font-size: 25px;
    margin-bottom: 8px;
}

.profile-info p {
    margin: 4px 0;
    color: #dbeafe;
    font-size: 14px;
}

.profile-badge {
    width: 75px;
    height: 75px;
    border-radius: 50%;
    background: rgba(255,255,255,0.15);

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 32px;
}

/* CARDS */

.cards {
    display: grid;
    grid-template-columns:
        repeat(4, 1fr);

    gap: 18px;
    margin-bottom: 25px;
}

.card {
    background: white;
    padding: 22px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
}

.card-icon {
    font-size: 27px;
    margin-bottom: 12px;
}

.card h3 {
    font-size: 17px;
    margin-bottom: 7px;
    color: #172554;
}

.card p {
    font-size: 13px;
    color: #64748b;
    margin-bottom: 15px;
}

.card a {
    display: inline-block;
    text-decoration: none;
    background: #2563eb;
    color: white;
    padding: 8px 13px;
    border-radius: 6px;
    font-size: 12px;
}

.card a:hover {
    background: #1d4ed8;
}

/* WELCOME */

.welcome {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
}

.welcome h2 {
    color: #172554;
    margin-bottom: 10px;
}

.welcome p {
    color: #64748b;
    line-height: 1.7;
    font-size: 14px;
}

/* RESPONSIVE */

@media (max-width: 1000px) {

    .cards {
        grid-template-columns:
            repeat(2, 1fr);
    }
}

@media (max-width: 700px) {

    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
    }

    .main {
        margin-left: 0;
        padding: 20px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .profile-card {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }
}

</style>

</head>


<body>


<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">
        OCMRS
    </div>

    <div class="logo-sub">
        Faculty Portal
    </div>


    <div class="menu">

        <a href="<%= request.getContextPath() %>/faculty/dashboard.jsp"
           class="active">
            🏠 Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/FacultyProfileServlet">
            👨‍🏫 My Profile
        </a>

        <a href="<%= request.getContextPath() %>/FacultySubjectServlet">
            📚 My Subjects
        </a>

        <a href="<%= request.getContextPath() %>/FacultyStudentServlet">
            👨‍🎓 Students
        </a>

        <a href="<%= request.getContextPath() %>/FacultyExamServlet">
            📝 Exams
        </a>

        <a href="<%= request.getContextPath() %>/FacultyResultServlet">
            📊 Results
        </a>

        <a href="<%= request.getContextPath() %>/FacultyAttendanceServlet">
            📅 Attendance
        </a>

        <a href="<%= request.getContextPath() %>/LogoutServlet"
           class="logout">
            🚪 Logout
        </a>

    </div>

</div>


<!-- MAIN -->

<div class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <h1>
            FACULTY DASHBOARD
        </h1>

        <p>
            Welcome to the OCMRS Faculty Portal
        </p>

    </div>


    <!-- PROFILE -->

    <div class="profile-card">

        <div class="profile-info">

            <h2>
                Welcome, <%= faculty.getName() %> 👋
            </h2>

            <p>
                <strong>Designation:</strong>
                <%= faculty.getDesignation() %>
            </p>

            <p>
                <strong>Email:</strong>
                <%= faculty.getEmail() %>
            </p>

        </div>


        <div class="profile-badge">
            👨‍🏫
        </div>

    </div>


    <!-- MODULE CARDS -->

    <div class="cards">


        <!-- PROFILE -->

        <div class="card">

            <div class="card-icon">
                👨‍🏫
            </div>

            <h3>
                My Profile
            </h3>

            <p>
                View your faculty information.
            </p>

            <a href="<%= request.getContextPath() %>/FacultyProfileServlet">
                View Profile
            </a>

        </div>


        <!-- SUBJECTS -->

        <div class="card">

            <div class="card-icon">
                📚
            </div>

            <h3>
                My Subjects
            </h3>

            <p>
                View subjects assigned to you.
            </p>

            <a href="<%= request.getContextPath() %>/FacultySubjectServlet">
                View Subjects
            </a>

        </div>


        <!-- STUDENTS -->

        <div class="card">

            <div class="card-icon">
                👨‍🎓
            </div>

            <h3>
                Students
            </h3>

            <p>
                View students related to your classes.
            </p>

            <a href="<%= request.getContextPath() %>/FacultyStudentServlet">
                View Students
            </a>

        </div>


        <!-- EXAMS -->

        <div class="card">

            <div class="card-icon">
                📝
            </div>

            <h3>
                Exams
            </h3>

            <p>
                Manage and view examination details.
            </p>

            <a href="<%= request.getContextPath() %>/FacultyExamServlet">
                View Exams
            </a>

        </div>


        <!-- RESULTS -->

        <div class="card">

            <div class="card-icon">
                📊
            </div>

            <h3>
                Results
            </h3>

            <p>
                Manage student marks and results.
            </p>

            <a href="<%= request.getContextPath() %>/FacultyResultServlet">
                View Results
            </a>

        </div>


        <!-- ATTENDANCE -->

        <div class="card">

            <div class="card-icon">
                📅
            </div>

            <h3>
                Attendance
            </h3>

            <p>
                Manage student attendance.
            </p>

            <a href="<%= request.getContextPath() %>/FacultyAttendanceServlet">
                Attendance
            </a>

        </div>


    </div>


    <!-- WELCOME -->

    <div class="welcome">

        <h2>
            Faculty Portal
        </h2>

        <p>
            From this portal, faculty members will be able to
            manage their profile, view assigned subjects,
            access student information, manage examinations,
            update results and maintain student attendance.
        </p>

    </div>


</div>

</body>

</html>