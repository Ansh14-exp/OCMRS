<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Faculty" %>

<%
    Faculty faculty =
            (Faculty) request.getAttribute("faculty");

    if (faculty == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/FacultyProfileServlet"
        );

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile | OCMRS</title>

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

.header {
    background: white;
    padding: 22px 25px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
    margin-bottom: 25px;
}

.header h1 {
    color: #172554;
    font-size: 27px;
    margin-bottom: 6px;
}

.header p {
    color: #64748b;
    font-size: 14px;
}

/* PROFILE CARD */

.profile-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 7px 25px rgba(0,0,0,0.07);
}

/* PROFILE TOP */

.profile-top {
    display: flex;
    align-items: center;
    gap: 22px;

    padding-bottom: 25px;
    margin-bottom: 25px;

    border-bottom: 1px solid #e5e7eb;
}

.avatar {
    width: 85px;
    height: 85px;

    border-radius: 50%;

    background: linear-gradient(
        135deg,
        #172554,
        #2563eb
    );

    color: white;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 38px;
}

.profile-top h2 {
    color: #172554;
    margin-bottom: 7px;
}

.profile-top p {
    color: #64748b;
    font-size: 14px;
}

/* DETAILS */

.details {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.detail-box {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    padding: 18px;
    border-radius: 10px;
}

.detail-box label {
    display: block;
    color: #64748b;
    font-size: 12px;
    margin-bottom: 7px;
    font-weight: bold;
    text-transform: uppercase;
}

.detail-box span {
    color: #1e293b;
    font-size: 15px;
}

/* BACK BUTTON */

.back-area {
    margin-top: 25px;
}

.back-btn {
    display: inline-block;
    text-decoration: none;
    background: #2563eb;
    color: white;
    padding: 11px 20px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
}

.back-btn:hover {
    background: #1d4ed8;
}

/* RESPONSIVE */

@media (max-width: 750px) {

    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
    }

    .main {
        margin-left: 0;
        padding: 20px;
    }

    .details {
        grid-template-columns: 1fr;
    }

    .profile-top {
        flex-direction: column;
        align-items: flex-start;
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

        <a href="<%= request.getContextPath() %>/faculty/dashboard.jsp">
            🏠 Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/FacultyProfileServlet"
           class="active">
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


    <!-- HEADER -->

    <div class="header">

        <h1>
            My Profile
        </h1>

        <p>
            View your faculty information
        </p>

    </div>


    <!-- PROFILE -->

    <div class="profile-card">


        <div class="profile-top">

            <div class="avatar">
                👨‍🏫
            </div>

            <div>

                <h2>
                    <%= faculty.getName() %>
                </h2>

                <p>
                    <%= faculty.getDesignation() %>
                </p>

            </div>

        </div>


        <!-- DETAILS -->

        <div class="details">


            <!-- FACULTY ID -->

            <div class="detail-box">

                <label>
                    Faculty ID
                </label>

                <span>
                    <%= faculty.getFacultyId() %>
                </span>

            </div>


            <!-- DEPARTMENT ID -->

            <div class="detail-box">

                <label>
                    Department ID
                </label>

                <span>
                    <%= faculty.getDepartmentId() %>
                </span>

            </div>


            <!-- NAME -->

            <div class="detail-box">

                <label>
                    Full Name
                </label>

                <span>
                    <%= faculty.getName() %>
                </span>

            </div>


            <!-- DESIGNATION -->

            <div class="detail-box">

                <label>
                    Designation
                </label>

                <span>
                    <%= faculty.getDesignation() %>
                </span>

            </div>


            <!-- EMAIL -->

            <div class="detail-box">

                <label>
                    Email Address
                </label>

                <span>
                    <%= faculty.getEmail() != null
                        ? faculty.getEmail()
                        : "Not Available" %>
                </span>

            </div>


            <!-- PHONE -->

            <div class="detail-box">

                <label>
                    Phone Number
                </label>

                <span>
                    <%= faculty.getPhone() != null
                        ? faculty.getPhone()
                        : "Not Available" %>
                </span>

            </div>


        </div>


        <!-- BACK -->

        <div class="back-area">

            <a href="<%= request.getContextPath() %>/faculty/dashboard.jsp"
               class="back-btn">

                ← Back to Dashboard

            </a>

        </div>


    </div>


</div>

</body>

</html>