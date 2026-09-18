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

<title>OCMRS | Exams</title>

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

/* ================= SIDEBAR ================= */

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

/* ================= MAIN ================= */

.main {
    margin-left: 250px;

    padding: 25px 30px;

    min-height: 100vh;
}

/* ================= TOPBAR ================= */

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

/* ================= PAGE HEADER ================= */

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
    font-size: 14px;

    opacity: 0.9;
}

/* ================= SUMMARY ================= */

.summary {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

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

/* ================= EXAM TABLE ================= */

.exam-card {
    background: white;

    margin-top: 25px;

    padding: 24px;

    border-radius: 15px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    overflow-x: auto;
}

.exam-header {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;
}

.exam-header h2 {
    font-size: 19px;
}

.exam-header span {
    color: #64748b;

    font-size: 13px;
}

table {
    width: 100%;

    border-collapse: collapse;

    min-width: 700px;
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

/* ================= STATUS ================= */

.status {
    display: inline-block;

    padding: 6px 12px;

    border-radius: 20px;

    font-size: 11px;

    font-weight: 600;
}

.upcoming {
    background: #dbeafe;

    color: #1d4ed8;
}

.completed {
    background: #dcfce7;

    color: #166534;
}

/* ================= EXAM CARDS ================= */

.exam-grid {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 18px;

    margin-top: 25px;
}

.exam-box {
    background: white;

    padding: 22px;

    border-radius: 15px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.exam-icon {
    width: 48px;
    height: 48px;

    border-radius: 12px;

    background: #eff6ff;

    display: flex;

    align-items: center;
    justify-content: center;

    font-size: 22px;

    margin-bottom: 15px;
}

.exam-box h3 {
    font-size: 16px;

    margin-bottom: 8px;
}

.exam-box p {
    color: #64748b;

    font-size: 12px;

    line-height: 1.7;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 1000px) {

    .exam-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }

    .summary {
        grid-template-columns:
            repeat(2, 1fr);
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

    .summary {
        grid-template-columns: 1fr;
    }

    .exam-grid {
        grid-template-columns: 1fr;
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
            <a href="enrollment.jsp">
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
            <a href="exams.jsp" class="active">
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

        <h1>Examination</h1>

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

        <h2>Exams & Schedule 📝</h2>

        <p>
            View your examination schedule, dates and examination status.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <h3>06</h3>

            <p>Total Exams</p>

        </div>


        <div class="summary-card">

            <h3>04</h3>

            <p>Upcoming Exams</p>

        </div>


        <div class="summary-card">

            <h3>02</h3>

            <p>Completed Exams</p>

        </div>

    </div>


    <!-- EXAM TABLE -->

    <div class="exam-card">

        <div class="exam-header">

            <h2>Examination Schedule</h2>

            <span>Academic Year 2026-27</span>

        </div>


        <table>

            <thead>

                <tr>

                    <th>Exam ID</th>

                    <th>Subject</th>

                    <th>Date</th>

                    <th>Time</th>

                    <th>Semester</th>

                    <th>Status</th>

                </tr>

            </thead>


            <tbody>


                <tr>

                    <td>EX001</td>

                    <td>Java Programming</td>

                    <td>15 Oct 2026</td>

                    <td>10:00 AM</td>

                    <td>5th</td>

                    <td>
                        <span class="status upcoming">
                            Upcoming
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>EX002</td>

                    <td>Database Management</td>

                    <td>18 Oct 2026</td>

                    <td>10:00 AM</td>

                    <td>5th</td>

                    <td>
                        <span class="status upcoming">
                            Upcoming
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>EX003</td>

                    <td>Web Technology</td>

                    <td>21 Oct 2026</td>

                    <td>02:00 PM</td>

                    <td>5th</td>

                    <td>
                        <span class="status upcoming">
                            Upcoming
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>EX004</td>

                    <td>Data Structures</td>

                    <td>24 Oct 2026</td>

                    <td>10:00 AM</td>

                    <td>5th</td>

                    <td>
                        <span class="status upcoming">
                            Upcoming
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>EX005</td>

                    <td>Operating Systems</td>

                    <td>12 Aug 2026</td>

                    <td>10:00 AM</td>

                    <td>4th</td>

                    <td>
                        <span class="status completed">
                            Completed
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>EX006</td>

                    <td>Computer Networks</td>

                    <td>15 Aug 2026</td>

                    <td>02:00 PM</td>

                    <td>4th</td>

                    <td>
                        <span class="status completed">
                            Completed
                        </span>
                    </td>

                </tr>


            </tbody>

        </table>

    </div>


    <!-- EXAM INFORMATION -->

    <div class="exam-grid">


        <div class="exam-box">

            <div class="exam-icon">
                📅
            </div>

            <h3>Exam Schedule</h3>

            <p>
                Check your examination dates and timings
                before attending the examination.
            </p>

        </div>


        <div class="exam-box">

            <div class="exam-icon">
                ⏰
            </div>

            <h3>Exam Time</h3>

            <p>
                Make sure you reach the examination venue
                before the scheduled time.
            </p>

        </div>


        <div class="exam-box">

            <div class="exam-icon">
                📋
            </div>

            <h3>Exam Status</h3>

            <p>
                Track your upcoming and completed examinations
                from this page.
            </p>

        </div>


    </div>


</div>


</body>
</html>
