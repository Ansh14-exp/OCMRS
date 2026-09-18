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

<title>OCMRS | Subjects</title>

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

/* ================= SUBJECT SUMMARY ================= */

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

    transition: 0.3s;
}

.summary-card:hover {
    transform: translateY(-4px);
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

/* ================= SUBJECTS ================= */

.subjects-container {
    margin-top: 25px;
}

.subjects-grid {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;
}

.subject-card {
    background: white;

    padding: 22px;

    border-radius: 15px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    transition: 0.3s;
}

.subject-card:hover {
    transform: translateY(-5px);

    box-shadow: 0 8px 22px rgba(0,0,0,0.08);
}

.subject-icon {
    width: 48px;
    height: 48px;

    display: flex;

    justify-content: center;
    align-items: center;

    border-radius: 12px;

    background: #eff6ff;

    font-size: 22px;

    margin-bottom: 16px;
}

.subject-card h3 {
    font-size: 17px;

    margin-bottom: 7px;
}

.subject-code {
    font-size: 12px;

    color: #64748b;

    margin-bottom: 15px;
}

.subject-info {
    display: flex;

    justify-content: space-between;

    padding-top: 14px;

    border-top: 1px solid #eef2f7;
}

.subject-info span {
    font-size: 12px;

    color: #64748b;
}

.subject-info strong {
    color: #334155;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 1050px) {

    .subjects-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }
}

@media(max-width: 850px) {

    .summary {
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

    .subjects-grid {
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
            <a href="subjects.jsp" class="active">
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

        <h1>My Subjects</h1>

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

        <h2>Subjects 📖</h2>

        <p>
            View your current semester subjects and course details.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <h3>06</h3>

            <p>Total Subjects</p>

        </div>


        <div class="summary-card">

            <h3>18</h3>

            <p>Total Credits</p>

        </div>


        <div class="summary-card">

            <h3>2026-27</h3>

            <p>Academic Year</p>

        </div>

    </div>


    <!-- SUBJECT CARDS -->

    <div class="subjects-container">

        <div class="subjects-grid">


            <!-- Subject 1 -->

            <div class="subject-card">

                <div class="subject-icon">
                    💻
                </div>

                <h3>Java Programming</h3>

                <div class="subject-code">
                    Subject Code: CS301
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>3</strong>

                </div>

            </div>


            <!-- Subject 2 -->

            <div class="subject-card">

                <div class="subject-icon">
                    🗄️
                </div>

                <h3>Database Management</h3>

                <div class="subject-code">
                    Subject Code: CS302
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>4</strong>

                </div>

            </div>


            <!-- Subject 3 -->

            <div class="subject-card">

                <div class="subject-icon">
                    🌐
                </div>

                <h3>Web Technology</h3>

                <div class="subject-code">
                    Subject Code: CS303
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>3</strong>

                </div>

            </div>


            <!-- Subject 4 -->

            <div class="subject-card">

                <div class="subject-icon">
                    🧠
                </div>

                <h3>Data Structures</h3>

                <div class="subject-code">
                    Subject Code: CS304
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>3</strong>

                </div>

            </div>


            <!-- Subject 5 -->

            <div class="subject-card">

                <div class="subject-icon">
                    ⚙️
                </div>

                <h3>Operating Systems</h3>

                <div class="subject-code">
                    Subject Code: CS305
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>3</strong>

                </div>

            </div>


            <!-- Subject 6 -->

            <div class="subject-card">

                <div class="subject-icon">
                    📐
                </div>

                <h3>Computer Networks</h3>

                <div class="subject-code">
                    Subject Code: CS306
                </div>

                <div class="subject-info">

                    <span>Credits</span>

                    <strong>2</strong>

                </div>

            </div>


        </div>

    </div>


</div>


</body>
</html>