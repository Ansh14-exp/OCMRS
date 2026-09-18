<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String username = "Student";

    if (session.getAttribute("user") != null) {
        com.ocmrs.model.User user =
                (com.ocmrs.model.User) session.getAttribute("user");

        username = user.getUsername();
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>OCMRS | Enrollment</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    background: #f5f7fb;
    color: #1e293b;
}

/* SIDEBAR */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 250px;
    height: 100vh;
    background: #111827;
    padding: 24px 16px;
    overflow-y: auto;
}

.logo {
    text-align: center;
    margin-bottom: 35px;
}

.logo h2 {
    color: white;
    font-size: 27px;
    letter-spacing: 1px;
}

.logo span {
    color: #38bdf8;
}

.menu {
    list-style: none;
}

.menu li {
    margin: 6px 0;
}

.menu a {
    display: flex;
    align-items: center;
    gap: 13px;
    padding: 13px 15px;
    color: #cbd5e1;
    text-decoration: none;
    border-radius: 10px;
    font-size: 15px;
    transition: 0.3s;
}

.menu a:hover {
    background: #1e293b;
    color: white;
    transform: translateX(4px);
}

.menu a.active {
    background: #2563eb;
    color: white;
}

/* MAIN */

.main {
    margin-left: 250px;
    padding: 25px 30px;
    min-height: 100vh;
}

/* TOPBAR */

.topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: white;
    padding: 18px 24px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.topbar h1 {
    font-size: 23px;
}

.user-area {
    display: flex;
    align-items: center;
    gap: 12px;
}

.avatar {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: #2563eb;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
}

.username {
    font-weight: 600;
}

/* PAGE HEADER */

.page-header {
    margin-top: 25px;
    padding: 28px;
    border-radius: 18px;
    color: white;

    background: linear-gradient(
        135deg,
        #2563eb,
        #4f46e5,
        #7c3aed
    );

    box-shadow: 0 10px 25px rgba(79,70,229,0.2);
}

.page-header h2 {
    font-size: 26px;
    margin-bottom: 7px;
}

.page-header p {
    opacity: 0.9;
    font-size: 14px;
}

/* SUMMARY */

.summary {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
    margin-top: 25px;
}

.summary-card {
    background: white;
    padding: 22px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.summary-card h3 {
    font-size: 27px;
    color: #2563eb;
    margin-bottom: 5px;
}

.summary-card p {
    color: #64748b;
    font-size: 13px;
}

/* ENROLLMENT TABLE */

.table-card {
    background: white;
    margin-top: 25px;
    padding: 24px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.table-header h2 {
    font-size: 19px;
}

.status {
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.active {
    background: #dcfce7;
    color: #166534;
}

.pending {
    background: #fef3c7;
    color: #92400e;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #f8fafc;
    color: #475569;
    font-size: 13px;
    text-align: left;
    padding: 14px;
}

td {
    padding: 15px 14px;
    border-bottom: 1px solid #eef2f7;
    font-size: 13px;
}

tr:hover {
    background: #f8fafc;
}

/* EMPTY MESSAGE */

.empty-message {
    text-align: center;
    padding: 30px;
    color: #64748b;
}

/* RESPONSIVE */

@media(max-width: 900px) {

    .summary {
        grid-template-columns: 1fr;
    }

    .table-card {
        overflow-x: auto;
    }
}

@media(max-width: 700px) {

    .sidebar {
        width: 210px;
    }

    .main {
        margin-left: 210px;
        padding: 15px;
    }

    .topbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
    }
}

</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        <h2>OCM<span>RS</span></h2>
    </div>

    <ul class="menu">

        <li>
            <a href="dashboard.jsp">
                🏠
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a href="profile.jsp">
                👤
                <span>Profile</span>
            </a>
        </li>

        <li>
            <a href="enrollment.jsp" class="active">
                📚
                <span>Enrollment</span>
            </a>
        </li>

        <li>
            <a href="subjects.jsp">
                📖
                <span>Subjects</span>
            </a>
        </li>

        <li>
            <a href="exams.jsp">
                📝
                <span>Exams</span>
            </a>
        </li>

        <li>
            <a href="results.jsp">
                📊
                <span>Results</span>
            </a>
        </li>

        <li>
            <a href="jobs.jsp">
                💼
                <span>Jobs</span>
            </a>
        </li>

        <li>
            <a href="apply-job.jsp">
                📄
                <span>Apply Job</span>
            </a>
        </li>

        <li>
            <a href="application.jsp">
                📋
                <span>Application</span>
            </a>
        </li>

        <li>
            <a href="placement.jsp">
                🏆
                <span>Placement</span>
            </a>
        </li>

    </ul>

</div>


<!-- ================= MAIN ================= -->

<div class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <h1>Enrollment</h1>

        <div class="user-area">

            <div class="avatar">
                <%= username.substring(0,1).toUpperCase() %>
            </div>

            <span class="username">
                <%= username %>
            </span>

        </div>

    </div>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <h2>My Enrollment 📚</h2>

        <p>
            View and manage your current academic enrollments.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <h3>04</h3>

            <p>Total Enrollments</p>

        </div>


        <div class="summary-card">

            <h3>03</h3>

            <p>Active Courses</p>

        </div>


        <div class="summary-card">

            <h3>01</h3>

            <p>Pending Enrollment</p>

        </div>

    </div>


    <!-- ENROLLMENT TABLE -->

    <div class="table-card">

        <div class="table-header">

            <h2>Enrollment Details</h2>

        </div>


        <table>

            <thead>

                <tr>

                    <th>Enrollment ID</th>

                    <th>Course</th>

                    <th>Department</th>

                    <th>Academic Year</th>

                    <th>Status</th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td>ENR001</td>

                    <td>B.Tech Computer Science</td>

                    <td>Computer Science</td>

                    <td>2026-27</td>

                    <td>
                        <span class="status active">
                            Active
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>ENR002</td>

                    <td>Database Management</td>

                    <td>Computer Science</td>

                    <td>2026-27</td>

                    <td>
                        <span class="status active">
                            Active
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>ENR003</td>

                    <td>Web Technology</td>

                    <td>Computer Science</td>

                    <td>2026-27</td>

                    <td>
                        <span class="status active">
                            Active
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>ENR004</td>

                    <td>Advanced Programming</td>

                    <td>Computer Science</td>

                    <td>2026-27</td>

                    <td>
                        <span class="status pending">
                            Pending
                        </span>
                    </td>

                </tr>

            </tbody>

        </table>

    </div>


</div>


</body>
</html>