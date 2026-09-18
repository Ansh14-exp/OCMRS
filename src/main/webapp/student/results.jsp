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

<title>OCMRS | Results</title>

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

/* HEADER */

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

/* RESULT CARD */

.result-card {
    background: white;
    margin-top: 25px;
    padding: 24px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
    overflow-x: auto;
}

.result-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.result-header h2 {
    font-size: 19px;
}

.result-header span {
    color: #64748b;
    font-size: 13px;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 650px;
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

/* GRADE */

.grade {
    display: inline-block;
    min-width: 34px;
    text-align: center;
    padding: 5px 8px;
    border-radius: 7px;
    background: #eff6ff;
    color: #1d4ed8;
    font-weight: 700;
}

/* STATUS */

.status {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 600;
}

.pass {
    background: #dcfce7;
    color: #166534;
}

/* SGPA */

.sgpa-box {
    margin-top: 25px;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.sgpa-info h2 {
    font-size: 19px;
    margin-bottom: 6px;
}

.sgpa-info p {
    color: #64748b;
    font-size: 13px;
}

.sgpa-value {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: #eff6ff;
    color: #2563eb;

    display: flex;
    justify-content: center;
    align-items: center;

    font-size: 25px;
    font-weight: 700;
}

/* RESPONSIVE */

@media(max-width: 900px) {

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

    .sgpa-box {
        flex-direction: column;
        gap: 20px;
        align-items: flex-start;
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
            <a href="results.jsp" class="active">
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

        <h1>Academic Results</h1>

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

        <h2>My Results 📊</h2>

        <p>
            View your semester-wise academic performance and grades.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <h3>06</h3>

            <p>Subjects</p>

        </div>

        <div class="summary-card">

            <h3>82%</h3>

            <p>Overall Percentage</p>

        </div>

        <div class="summary-card">

            <h3>8.2</h3>

            <p>Current SGPA</p>

        </div>

    </div>


    <!-- RESULTS -->

    <div class="result-card">

        <div class="result-header">

            <h2>Semester 4 Result</h2>

            <span>Academic Year 2025-26</span>

        </div>


        <table>

            <thead>

                <tr>

                    <th>Subject Code</th>
                    <th>Subject</th>
                    <th>Marks</th>
                    <th>Grade</th>
                    <th>Credits</th>
                    <th>Status</th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td>CS401</td>

                    <td>Operating Systems</td>

                    <td>84 / 100</td>

                    <td>
                        <span class="grade">A</span>
                    </td>

                    <td>3</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>CS402</td>

                    <td>Computer Networks</td>

                    <td>78 / 100</td>

                    <td>
                        <span class="grade">A</span>
                    </td>

                    <td>3</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>CS403</td>

                    <td>Software Engineering</td>

                    <td>81 / 100</td>

                    <td>
                        <span class="grade">A</span>
                    </td>

                    <td>3</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>CS404</td>

                    <td>Web Technology</td>

                    <td>88 / 100</td>

                    <td>
                        <span class="grade">A+</span>
                    </td>

                    <td>4</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>CS405</td>

                    <td>Database Management</td>

                    <td>79 / 100</td>

                    <td>
                        <span class="grade">A</span>
                    </td>

                    <td>4</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>


                <tr>

                    <td>CS406</td>

                    <td>Data Structures</td>

                    <td>82 / 100</td>

                    <td>
                        <span class="grade">A</span>
                    </td>

                    <td>3</td>

                    <td>
                        <span class="status pass">
                            Pass
                        </span>
                    </td>

                </tr>

            </tbody>

        </table>

    </div>


    <!-- SGPA -->

    <div class="sgpa-box">

        <div class="sgpa-info">

            <h2>Semester Performance</h2>

            <p>
                Your current Semester Grade Point Average
                for the selected semester.
            </p>

        </div>

        <div class="sgpa-value">
            8.2
        </div>

    </div>


</div>


</body>
</html>