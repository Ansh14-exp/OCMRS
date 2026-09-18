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

<title>OCMRS | Student Dashboard</title>

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

/* Logo */

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

/* Menu */

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

    box-shadow: 0 5px 15px rgba(37, 99, 235, 0.3);
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

/* ================= WELCOME ================= */

.welcome {
    margin-top: 25px;

    padding: 30px;

    border-radius: 18px;

    color: white;

    background: linear-gradient(
        135deg,
        #2563eb,
        #4f46e5,
        #7c3aed
    );

    box-shadow: 0 10px 25px rgba(79,70,229,0.2);

    position: relative;

    overflow: hidden;
}

.welcome::after {
    content: "";

    position: absolute;

    width: 180px;
    height: 180px;

    border-radius: 50%;

    background: rgba(255,255,255,0.08);

    right: 50px;
    top: -60px;
}

.welcome h2 {
    font-size: 27px;

    margin-bottom: 8px;
}

.welcome p {
    opacity: 0.9;

    font-size: 15px;
}

/* ================= STAT CARDS ================= */

.stats {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 18px;

    margin-top: 25px;
}

.stat-card {
    background: white;

    padding: 22px;

    border-radius: 15px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    transition: 0.3s;
}

.stat-card:hover {
    transform: translateY(-5px);

    box-shadow: 0 8px 22px rgba(0,0,0,0.08);
}

.stat-top {
    display: flex;

    justify-content: space-between;

    align-items: center;
}

.stat-icon {
    width: 45px;
    height: 45px;

    border-radius: 12px;

    background: #eff6ff;

    display: flex;

    justify-content: center;
    align-items: center;

    font-size: 21px;
}

.stat-card h3 {
    margin-top: 18px;

    font-size: 27px;
}

.stat-card p {
    color: #64748b;

    margin-top: 4px;

    font-size: 14px;
}

/* ================= CONTENT GRID ================= */

.content-grid {
    display: grid;

    grid-template-columns: 2fr 1fr;

    gap: 20px;

    margin-top: 25px;
}

/* ================= CARD ================= */

.dashboard-card {
    background: white;

    border-radius: 15px;

    padding: 23px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.card-header {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;
}

.card-header h2 {
    font-size: 18px;
}

.view-btn {
    text-decoration: none;

    color: #2563eb;

    font-size: 13px;

    font-weight: 600;
}

/* ================= QUICK ACTIONS ================= */

.quick-actions {
    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 12px;
}

.action {
    padding: 16px;

    border: 1px solid #e5e7eb;

    border-radius: 12px;

    text-decoration: none;

    color: #334155;

    transition: 0.3s;
}

.action:hover {
    border-color: #2563eb;

    background: #eff6ff;

    transform: translateY(-2px);
}

.action-icon {
    font-size: 22px;

    margin-bottom: 8px;
}

.action h4 {
    font-size: 14px;

    margin-bottom: 4px;
}

.action p {
    font-size: 12px;

    color: #64748b;
}

/* ================= ACTIVITY ================= */

.activity {
    display: flex;

    gap: 13px;

    padding: 13px 0;

    border-bottom: 1px solid #eef2f7;
}

.activity:last-child {
    border-bottom: none;
}

.activity-icon {
    width: 38px;
    height: 38px;

    background: #eff6ff;

    border-radius: 10px;

    display: flex;

    align-items: center;

    justify-content: center;
}

.activity h4 {
    font-size: 13px;

    margin-bottom: 3px;
}

.activity p {
    font-size: 11px;

    color: #64748b;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 1100px) {

    .stats {
        grid-template-columns:
            repeat(2, 1fr);
    }

    .content-grid {
        grid-template-columns: 1fr;
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

    .stats {
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
            <a href="dashboard.jsp" class="active">
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


<!-- ================= MAIN CONTENT ================= -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">

        <h1>Student Dashboard</h1>

        <div class="user-area">

            <div class="avatar">
                <%= username.substring(0,1).toUpperCase() %>
            </div>

            <span class="username">
                <%= username %>
            </span>

        </div>

    </div>


    <!-- WELCOME -->

    <div class="welcome">

        <h2>
            Welcome back, <%= username %> 👋
        </h2>

        <p>
            Manage your academic activities and placement journey
            from one place.
        </p>

    </div>


    <!-- ================= STATISTICS ================= -->

    <div class="stats">


        <div class="stat-card">

            <div class="stat-top">

                <span>Enrollments</span>

                <div class="stat-icon">
                    📚
                </div>

            </div>

            <h3>04</h3>

            <p>Active enrollments</p>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <span>Subjects</span>

                <div class="stat-icon">
                    📖
                </div>

            </div>

            <h3>06</h3>

            <p>Current subjects</p>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <span>Applications</span>

                <div class="stat-icon">
                    📄
                </div>

            </div>

            <h3>03</h3>

            <p>Job applications</p>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <span>Placement</span>

                <div class="stat-icon">
                    🏆
                </div>

            </div>

            <h3>Active</h3>

            <p>Placement status</p>

        </div>


    </div>


    <!-- ================= LOWER CONTENT ================= -->

    <div class="content-grid">


        <!-- QUICK ACTIONS -->

        <div class="dashboard-card">

            <div class="card-header">

                <h2>Quick Actions</h2>

            </div>


            <div class="quick-actions">


                <a href="profile.jsp" class="action">

                    <div class="action-icon">
                        👤
                    </div>

                    <h4>My Profile</h4>

                    <p>View your information</p>

                </a>


                <a href="enrollment.jsp" class="action">

                    <div class="action-icon">
                        📚
                    </div>

                    <h4>Enrollment</h4>

                    <p>View your enrollment</p>

                </a>


                <a href="exams.jsp" class="action">

                    <div class="action-icon">
                        📝
                    </div>

                    <h4>Exams</h4>

                    <p>Check exam schedule</p>

                </a>


                <a href="jobs.jsp" class="action">

                    <div class="action-icon">
                        💼
                    </div>

                    <h4>Find Jobs</h4>

                    <p>Explore job opportunities</p>

                </a>


            </div>

        </div>


        <!-- RECENT ACTIVITY -->

        <div class="dashboard-card">

            <div class="card-header">

                <h2>Recent Activity</h2>

            </div>


            <div class="activity">

                <div class="activity-icon">
                    📚
                </div>

                <div>

                    <h4>Enrollment Updated</h4>

                    <p>Academic enrollment</p>

                </div>

            </div>


            <div class="activity">

                <div class="activity-icon">
                    📝
                </div>

                <div>

                    <h4>Exam Schedule</h4>

                    <p>Check upcoming exams</p>

                </div>

            </div>


            <div class="activity">

                <div class="activity-icon">
                    💼
                </div>

                <div>

                    <h4>New Jobs Available</h4>

                    <p>Explore opportunities</p>

                </div>

            </div>


            <div class="activity">

                <div class="activity-icon">
                    📊
                </div>

                <div>

                    <h4>Results</h4>

                    <p>View academic results</p>

                </div>

            </div>

        </div>


    </div>

</div>


</body>
</html>