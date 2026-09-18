<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Placement - OCMRS</title>

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

/* SIDEBAR */

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


/* MAIN */

.main {
    margin-left: 240px;
    padding: 30px;
}


/* HEADER */

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


/* SUMMARY CARDS */

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
    font-size: 27px;
}


/* PLACEMENT STATUS */

.placement-box {
    background: white;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    margin-bottom: 25px;
}

.placement-box h2 {
    color: #1e293b;
    margin-bottom: 20px;
}


/* STATUS */

.status-container {
    display: flex;
    align-items: center;
    gap: 25px;
    background: #eff6ff;
    border: 1px solid #bfdbfe;
    padding: 25px;
    border-radius: 15px;
}

.status-icon {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    background: #dbeafe;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 32px;
}

.status-text h3 {
    color: #1d4ed8;
    margin-bottom: 8px;
}

.status-text p {
    color: #475569;
}


/* PLACEMENT DETAILS */

.details {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 18px;
}

.detail-card {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    padding: 20px;
    border-radius: 12px;
}

.detail-card h4 {
    color: #64748b;
    font-size: 13px;
    margin-bottom: 8px;
}

.detail-card p {
    color: #1e293b;
    font-size: 17px;
    font-weight: bold;
}


/* TIMELINE */

.timeline-box {
    background: white;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.timeline-box h2 {
    margin-bottom: 25px;
    color: #1e293b;
}

.timeline {
    border-left: 3px solid #2563eb;
    padding-left: 25px;
}

.timeline-item {
    position: relative;
    margin-bottom: 25px;
}

.timeline-item::before {
    content: "";
    position: absolute;
    left: -34px;
    top: 2px;
    width: 14px;
    height: 14px;
    background: #2563eb;
    border-radius: 50%;
}

.timeline-item h3 {
    color: #1e40af;
    margin-bottom: 5px;
}

.timeline-item p {
    color: #64748b;
    font-size: 14px;
}


/* NOTICE */

.notice {
    margin-top: 25px;
    background: #f0fdf4;
    border-left: 5px solid #16a34a;
    padding: 18px;
    border-radius: 10px;
}

.notice h3 {
    color: #166534;
    margin-bottom: 8px;
}

.notice p {
    color: #475569;
}


/* RESPONSIVE */

@media (max-width: 1000px) {

    .cards {
        grid-template-columns: repeat(2, 1fr);
    }

    .details {
        grid-template-columns: 1fr;
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

    .status-container {
        flex-direction: column;
        text-align: center;
    }
}

</style>

</head>

<body>


<!-- SIDEBAR -->

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
    <a href="application.jsp">📄 Applications</a>
    <a href="placement.jsp" class="active">🎓 Placement</a>

</div>


<!-- MAIN CONTENT -->

<div class="main">


    <!-- HEADER -->

    <div class="header">

        <h1>Placement Dashboard</h1>

        <p>
            Track your placement progress and selection details.
        </p>

    </div>


    <!-- SUMMARY -->

    <div class="cards">

        <div class="card">

            <h3>Applications</h3>

            <h2>04</h2>

        </div>


        <div class="card">

            <h3>Shortlisted</h3>

            <h2>02</h2>

        </div>


        <div class="card">

            <h3>Interviews</h3>

            <h2>01</h2>

        </div>


        <div class="card">

            <h3>Placement Status</h3>

            <h2>Selected</h2>

        </div>

    </div>


    <!-- PLACEMENT STATUS -->

    <div class="placement-box">

        <h2>Current Placement Status</h2>


        <div class="status-container">

            <div class="status-icon">
                🎉
            </div>


            <div class="status-text">

                <h3>Congratulations!</h3>

                <p>
                    You have been selected for a placement opportunity.
                </p>

            </div>

        </div>


        <br>


        <!-- DETAILS -->

        <div class="details">

            <div class="detail-card">

                <h4>Company</h4>

                <p>Tech Solutions Pvt. Ltd.</p>

            </div>


            <div class="detail-card">

                <h4>Job Position</h4>

                <p>Java Developer</p>

            </div>


            <div class="detail-card">

                <h4>Package</h4>

                <p>₹4 - 6 LPA</p>

            </div>


            <div class="detail-card">

                <h4>Location</h4>

                <p>Kolkata</p>

            </div>


            <div class="detail-card">

                <h4>Selection Date</h4>

                <p>18 September 2026</p>

            </div>


            <div class="detail-card">

                <h4>Placement Year</h4>

                <p>2026-27</p>

            </div>

        </div>

    </div>


    <!-- PLACEMENT PROCESS -->

    <div class="timeline-box">

        <h2>Placement Process</h2>


        <div class="timeline">

            <div class="timeline-item">

                <h3>Application Submitted</h3>

                <p>
                    Your application was successfully submitted.
                </p>

            </div>


            <div class="timeline-item">

                <h3>Shortlisted</h3>

                <p>
                    Your profile was shortlisted by the company.
                </p>

            </div>


            <div class="timeline-item">

                <h3>Interview Completed</h3>

                <p>
                    The interview process has been completed.
                </p>

            </div>


            <div class="timeline-item">

                <h3>Selected</h3>

                <p>
                    You have been selected for the placement.
                </p>

            </div>

        </div>


        <!-- NOTICE -->

        <div class="notice">

            <h3>Placement Team Notice</h3>

            <p>
                Please contact the college placement cell for
                joining instructions and further documentation.
            </p>

        </div>

    </div>


</div>

</body>
</html>