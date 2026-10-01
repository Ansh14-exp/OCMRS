<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Student Profile - OCMRS</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f7fc;
    color: #222;
}

/* Sidebar */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 240px;
    height: 100vh;
    background: linear-gradient(180deg, #111827, #1e1b4b);
    padding: 25px 15px;
    color: white;
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    color: #60a5fa;
    font-size: 27px;
}

.logo p {
    font-size: 12px;
    color: #cbd5e1;
    margin-top: 5px;
}

.sidebar a {
    display: block;
    color: #dbeafe;
    text-decoration: none;
    padding: 13px 15px;
    margin: 6px 0;
    border-radius: 10px;
    transition: 0.3s;
}

.sidebar a:hover,
.sidebar a.active {
    background: linear-gradient(90deg, #2563eb, #7c3aed);
    color: white;
}

/* Main */

.main {
    margin-left: 240px;
    padding: 30px;
}

/* Header */

.header {
    background: linear-gradient(135deg, #2563eb, #7c3aed);
    color: white;
    padding: 25px;
    border-radius: 18px;
    margin-bottom: 25px;
}

.header h1 {
    font-size: 28px;
}

.header p {
    margin-top: 8px;
    color: #e0e7ff;
}

/* Profile */

.profile-container {
    background: white;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.profile-top {
    display: flex;
    align-items: center;
    gap: 25px;
    padding-bottom: 25px;
    border-bottom: 1px solid #e2e8f0;
    margin-bottom: 25px;
}

.profile-icon {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: linear-gradient(135deg, #2563eb, #7c3aed);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 38px;
}

.profile-top h2 {
    color: #1e293b;
    margin-bottom: 7px;
}

.profile-top p {
    color: #64748b;
}

/* Details */

.details {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.detail {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    padding: 18px;
    border-radius: 12px;
}

.detail label {
    display: block;
    color: #64748b;
    font-size: 13px;
    margin-bottom: 7px;
}

.detail p {
    color: #1e293b;
    font-size: 16px;
    font-weight: bold;
}

/* Student ID */

.student-id {
    margin-top: 25px;
    background: #eff6ff;
    border-left: 5px solid #2563eb;
    padding: 18px;
    border-radius: 10px;
}

.student-id h3 {
    color: #1e40af;
    margin-bottom: 7px;
}

.student-id p {
    color: #475569;
}

/* Responsive */

@media (max-width: 800px) {

    .sidebar {
        width: 200px;
    }

    .main {
        margin-left: 200px;
        padding: 20px;
    }

    .details {
        grid-template-columns: 1fr;
    }
}

</style>

</head>

<body>


<!-- Sidebar -->

<div class="sidebar">

    <div class="logo">
        <h2>OCMRS</h2>
        <p>Student Portal</p>
    </div>

    <!-- Dashboard -->
    <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
        🏠 Dashboard
    </a>

    <!-- Profile -->
    <a href="<%= request.getContextPath() %>/StudentServlet"
       class="active">
        👤 Profile
    </a>

    <!-- Enrollment -->
    <a href="<%= request.getContextPath() %>/EnrollmentServlet">
        📚 Enrollment
    </a>

    <!-- Subjects -->
    <a href="<%= request.getContextPath() %>/SubjectServlet">
        📖 Subjects
    </a>

    <!-- Exams -->
    <a href="<%= request.getContextPath() %>/ExamServlet">
        📝 Exams
    </a>

    <!-- Results -->
    <a href="<%= request.getContextPath() %>/ResultServlet">
        📊 Results
    </a>

    <!-- Jobs -->
    <a href="<%= request.getContextPath() %>/JobServlet">
        💼 Jobs
    </a>

    <!-- Apply Job -->
    <a href="<%= request.getContextPath() %>/ApplicationServlet">
        📨 Apply Job
    </a>

    <!-- Applications -->
    <a href="<%= request.getContextPath() %>/ApplicationServlet">
        📄 Applications
    </a>

    <!-- Placement -->
    <a href="<%= request.getContextPath() %>/PlacementServlet">
        🎓 Placement
    </a>

    <!-- Logout -->
    <a href="<%= request.getContextPath() %>/LogoutServlet">
        🚪 Logout
    </a>

</div>


<!-- Main -->

<div class="main">


    <!-- Header -->

    <div class="header">

        <h1>My Profile</h1>

        <p>
            View your personal and academic information.
        </p>

    </div>


    <!-- Profile Container -->

    <div class="profile-container">


        <!-- Profile Top -->

        <div class="profile-top">

            <div class="profile-icon">
                👤
            </div>

            <div>

                <h2>
                    <%= student.getName() %>
                </h2>

                <p>
                    Student ID: <%= student.getStudentId() %>
                </p>

            </div>

        </div>


        <!-- Details -->

        <div class="details">


            <div class="detail">

                <label>Full Name</label>

                <p>
                    <%= student.getName() %>
                </p>

            </div>


            <div class="detail">

                <label>Email Address</label>

                <p>
                    <%= student.getEmail() %>
                </p>

            </div>


            <div class="detail">

                <label>Phone Number</label>

                <p>
                    <%= student.getPhone() %>
                </p>

            </div>


            <div class="detail">

                <label>Date of Birth</label>

                <p>
                    <%= student.getDob() %>
                </p>

            </div>


            <div class="detail">

                <label>Gender</label>

                <p>
                    <%= student.getGender() %>
                </p>

            </div>


            <div class="detail">

                <label>Address</label>

                <p>
                    <%= student.getAddress() %>
                </p>

            </div>


            <div class="detail">

                <label>College ID</label>

                <p>
                    <%= student.getCollegeId() %>
                </p>

            </div>


            <div class="detail">

                <label>Course ID</label>

                <p>
                    <%= student.getCourseId() %>
                </p>

            </div>


        </div>


        <!-- Student ID -->

        <div class="student-id">

            <h3>Student Information</h3>

            <p>
                Student ID:
                <strong><%= student.getStudentId() %></strong>
                &nbsp;&nbsp; | &nbsp;&nbsp;

                User ID:
                <strong><%= student.getUserId() %></strong>
            </p>

        </div>


    </div>

</div>

</body>
</html>