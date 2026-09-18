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

<title>OCMRS | Jobs</title>

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

/* ================= HEADER ================= */

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

/* ================= JOBS ================= */

.jobs-grid {
    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 20px;

    margin-top: 25px;
}

.job-card {
    background: white;

    padding: 24px;

    border-radius: 16px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    transition: 0.3s;
}

.job-card:hover {
    transform: translateY(-5px);

    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

/* JOB TOP */

.job-top {
    display: flex;

    justify-content: space-between;

    align-items: flex-start;

    margin-bottom: 18px;
}

.company-logo {
    width: 52px;
    height: 52px;

    border-radius: 13px;

    background: #eff6ff;

    display: flex;

    justify-content: center;
    align-items: center;

    font-size: 23px;
}

.job-type {
    padding: 6px 11px;

    border-radius: 20px;

    background: #dcfce7;

    color: #166534;

    font-size: 11px;

    font-weight: 600;
}

/* JOB DETAILS */

.job-card h2 {
    font-size: 19px;

    margin-bottom: 5px;
}

.company {
    color: #64748b;

    font-size: 13px;

    margin-bottom: 17px;
}

.details {
    display: grid;

    grid-template-columns:
        1fr 1fr;

    gap: 12px;

    margin-bottom: 20px;
}

.detail {
    padding: 11px;

    background: #f8fafc;

    border-radius: 9px;
}

.detail span {
    display: block;

    color: #64748b;

    font-size: 11px;

    margin-bottom: 4px;
}

.detail strong {
    font-size: 12px;

    color: #334155;
}

/* FOOTER */

.job-footer {
    display: flex;

    justify-content: space-between;

    align-items: center;

    padding-top: 17px;

    border-top: 1px solid #eef2f7;
}

.deadline {
    color: #64748b;

    font-size: 11px;
}

.apply-btn {
    display: inline-block;

    padding: 9px 17px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 8px;

    font-size: 12px;

    font-weight: 600;

    transition: 0.3s;
}

.apply-btn:hover {
    background: #1d4ed8;

    transform: translateY(-2px);
}

/* ================= RESPONSIVE ================= */

@media(max-width: 950px) {

    .jobs-grid {
        grid-template-columns: 1fr;
    }
}

@media(max-width: 800px) {

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
            <a href="jobs.jsp" class="active">
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

        <h1>Job Opportunities</h1>

        <div class="user-area">

            <div class="avatar">
                <%= username.substring(0,1).toUpperCase() %>
            </div>

            <span class="username">
                <%= username %>
            </span>

        </div>

    </div>


    <!-- HEADER -->

    <div class="page-header">

        <h2>Find Your Opportunity 💼</h2>

        <p>
            Explore available jobs and placement opportunities
            posted by companies.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <h3>12</h3>

            <p>Available Jobs</p>

        </div>


        <div class="summary-card">

            <h3>05</h3>

            <p>Companies</p>

        </div>


        <div class="summary-card">

            <h3>04</h3>

            <p>New Jobs</p>

        </div>

    </div>


    <!-- JOBS -->

    <div class="jobs-grid">


        <!-- JOB 1 -->

        <div class="job-card">

            <div class="job-top">

                <div class="company-logo">
                    💻
                </div>

                <span class="job-type">
                    Full Time
                </span>

            </div>

            <h2>Java Developer</h2>

            <p class="company">
                Tech Solutions Pvt. Ltd.
            </p>


            <div class="details">

                <div class="detail">

                    <span>Location</span>

                    <strong>Kolkata</strong>

                </div>

                <div class="detail">

                    <span>Experience</span>

                    <strong>Fresher</strong>

                </div>

                <div class="detail">

                    <span>Salary</span>

                    <strong>₹4 - 6 LPA</strong>

                </div>

                <div class="detail">

                    <span>Department</span>

                    <strong>IT</strong>

                </div>

            </div>


            <div class="job-footer">

                <span class="deadline">
                    Deadline: 30 Oct 2026
                </span>

                <a href="apply-job.jsp" class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>


        <!-- JOB 2 -->

        <div class="job-card">

            <div class="job-top">

                <div class="company-logo">
                    🌐
                </div>

                <span class="job-type">
                    Full Time
                </span>

            </div>

            <h2>Web Developer</h2>

            <p class="company">
                Digital Works India
            </p>


            <div class="details">

                <div class="detail">

                    <span>Location</span>

                    <strong>Bangalore</strong>

                </div>

                <div class="detail">

                    <span>Experience</span>

                    <strong>Fresher</strong>

                </div>

                <div class="detail">

                    <span>Salary</span>

                    <strong>₹3.5 - 5 LPA</strong>

                </div>

                <div class="detail">

                    <span>Department</span>

                    <strong>IT</strong>

                </div>

            </div>


            <div class="job-footer">

                <span class="deadline">
                    Deadline: 05 Nov 2026
                </span>

                <a href="apply-job.jsp" class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>


        <!-- JOB 3 -->

        <div class="job-card">

            <div class="job-top">

                <div class="company-logo">
                    🗄️
                </div>

                <span class="job-type">
                    Full Time
                </span>

            </div>

            <h2>Database Developer</h2>

            <p class="company">
                DataCore Technologies
            </p>


            <div class="details">

                <div class="detail">

                    <span>Location</span>

                    <strong>Hyderabad</strong>

                </div>

                <div class="detail">

                    <span>Experience</span>

                    <strong>Fresher</strong>

                </div>

                <div class="detail">

                    <span>Salary</span>

                    <strong>₹4 - 5.5 LPA</strong>

                </div>

                <div class="detail">

                    <span>Department</span>

                    <strong>IT</strong>

                </div>

            </div>


            <div class="job-footer">

                <span class="deadline">
                    Deadline: 10 Nov 2026
                </span>

                <a href="apply-job.jsp" class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>


        <!-- JOB 4 -->

        <div class="job-card">

            <div class="job-top">

                <div class="company-logo">
                    ⚙️
                </div>

                <span class="job-type">
                    Internship
                </span>

            </div>

            <h2>Software Intern</h2>

            <p class="company">
                Innovation Labs
            </p>


            <div class="details">

                <div class="detail">

                    <span>Location</span>

                    <strong>Pune</strong>

                </div>

                <div class="detail">

                    <span>Experience</span>

                    <strong>Student</strong>

                </div>

                <div class="detail">

                    <span>Stipend</span>

                    <strong>₹15K / Month</strong>

                </div>

                <div class="detail">

                    <span>Department</span>

                    <strong>Software</strong>

                </div>

            </div>


            <div class="job-footer">

                <span class="deadline">
                    Deadline: 15 Nov 2026
                </span>

                <a href="apply-job.jsp" class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>


    </div>


</div>


</body>
</html>