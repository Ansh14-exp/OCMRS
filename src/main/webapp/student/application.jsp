<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Applications - OCMRS</title>

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

/* Summary Cards */

.cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.card {
    background: white;
    padding: 22px;
    border-radius: 15px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.07);
}

.card h3 {
    color: #64748b;
    font-size: 14px;
}

.card h2 {
    margin-top: 10px;
    color: #1e293b;
    font-size: 28px;
}

/* Application Section */

.application-box {
    background: white;
    padding: 25px;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.application-box h2 {
    color: #1e293b;
    margin-bottom: 20px;
}

/* Table */

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #eff6ff;
    color: #1e3a8a;
    padding: 15px;
    text-align: left;
}

td {
    padding: 15px;
    border-bottom: 1px solid #e2e8f0;
    color: #475569;
}

tr:hover {
    background: #f8fafc;
}

/* Status */

.status {
    padding: 7px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

.pending {
    background: #fef3c7;
    color: #92400e;
}

.shortlisted {
    background: #dcfce7;
    color: #166534;
}

.rejected {
    background: #fee2e2;
    color: #991b1b;
}

.interview {
    background: #dbeafe;
    color: #1e40af;
}

/* View Button */

.view-btn {
    text-decoration: none;
    background: #2563eb;
    color: white;
    padding: 8px 13px;
    border-radius: 7px;
    font-size: 13px;
}

.view-btn:hover {
    background: #1d4ed8;
}

/* Info */

.info {
    margin-top: 25px;
    background: #eff6ff;
    border-left: 5px solid #2563eb;
    padding: 18px;
    border-radius: 10px;
}

.info h3 {
    color: #1e40af;
    margin-bottom: 8px;
}

.info p {
    color: #475569;
}

/* Responsive */

@media (max-width: 1000px) {

    .cards {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 700px) {

    .sidebar {
        width: 200px;
    }

    .main {
        margin-left: 200px;
        padding: 20px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    table {
        font-size: 12px;
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

    <a href="dashboard.jsp">🏠 Dashboard</a>
    <a href="profile.jsp">👤 Profile</a>
    <a href="enrollment.jsp">📚 Enrollment</a>
    <a href="subjects.jsp">📖 Subjects</a>
    <a href="exams.jsp">📝 Exams</a>
    <a href="results.jsp">📊 Results</a>
    <a href="jobs.jsp">💼 Jobs</a>
    <a href="apply-job.jsp">📨 Apply Job</a>
    <a href="application.jsp" class="active">📄 Applications</a>
    <a href="placement.jsp">🎓 Placement</a>

</div>


<!-- Main Content -->

<div class="main">

    <div class="header">

        <h1>My Applications</h1>

        <p>
            Track your submitted job applications and application status.
        </p>

    </div>


    <!-- Summary Cards -->

    <div class="cards">

        <div class="card">
            <h3>Total Applications</h3>
            <h2>04</h2>
        </div>

        <div class="card">
            <h3>Under Review</h3>
            <h2>01</h2>
        </div>

        <div class="card">
            <h3>Shortlisted</h3>
            <h2>02</h2>
        </div>

        <div class="card">
            <h3>Interviews</h3>
            <h2>01</h2>
        </div>

    </div>


    <!-- Application Table -->

    <div class="application-box">

        <h2>Application History</h2>

        <table>

            <thead>

                <tr>

                    <th>Application ID</th>
                    <th>Job Position</th>
                    <th>Company</th>
                    <th>Applied Date</th>
                    <th>Status</th>
                    <th>Action</th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td>APP001</td>

                    <td>Java Developer</td>

                    <td>Tech Solutions Pvt. Ltd.</td>

                    <td>18 Sep 2026</td>

                    <td>
                        <span class="status shortlisted">
                            Shortlisted
                        </span>
                    </td>

                    <td>
                        <a href="#" class="view-btn">
                            View
                        </a>
                    </td>

                </tr>


                <tr>

                    <td>APP002</td>

                    <td>Web Developer</td>

                    <td>Digital Works India</td>

                    <td>16 Sep 2026</td>

                    <td>
                        <span class="status interview">
                            Interview
                        </span>
                    </td>

                    <td>
                        <a href="#" class="view-btn">
                            View
                        </a>
                    </td>

                </tr>


                <tr>

                    <td>APP003</td>

                    <td>Database Developer</td>

                    <td>DataCore Technologies</td>

                    <td>14 Sep 2026</td>

                    <td>
                        <span class="status pending">
                            Under Review
                        </span>
                    </td>

                    <td>
                        <a href="#" class="view-btn">
                            View
                        </a>
                    </td>

                </tr>


                <tr>

                    <td>APP004</td>

                    <td>Software Intern</td>

                    <td>Innovation Labs</td>

                    <td>10 Sep 2026</td>

                    <td>
                        <span class="status rejected">
                            Not Selected
                        </span>
                    </td>

                    <td>
                        <a href="#" class="view-btn">
                            View
                        </a>
                    </td>

                </tr>

            </tbody>

        </table>


        <!-- Information -->

        <div class="info">

            <h3>Application Status Information</h3>

            <p>
                Your application status will be updated by the company
                or placement team. Check this page regularly for updates
                regarding interviews and selection.
            </p>

        </div>

    </div>

</div>

</body>
</html>