<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard - OCMRS</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .header {
            background-color: #1f2937;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            padding: 30px;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .card h2 {
            margin-bottom: 10px;
        }

        .card p {
            color: #555;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>

    <div class="header">

        <h1>Online College Management and Recruitment System</h1>

        <h2>Admin Dashboard</h2>

    </div>


    <div class="container">

        <div class="welcome">

            <h2>Welcome, Admin!</h2>

            <p>You have successfully logged into the OCMRS Admin Panel.</p>

        </div>


        <div class="cards">


            <!-- Students -->

            <div class="card">

                <h2>Students</h2>

                <p>Manage student records</p>

                <a href="/OCMRS/StudentServlet" class="btn">
                    Manage Students
                </a>

            </div>


            <!-- Colleges -->

            <div class="card">

                <h2>Colleges</h2>

                <p>Manage college information</p>

                <a href="/OCMRS/CollegeServlet" class="btn">
                    Manage Colleges
                </a>

            </div>


            <!-- Departments -->

            <div class="card">

                <h2>Departments</h2>

                <p>Manage departments</p>

                <a href="/OCMRS/DepartmentServlet" class="btn">
                    Manage Departments
                </a>

            </div>


            <!-- Courses -->

            <div class="card">

                <h2>Courses</h2>

                <p>Manage courses</p>

                <a href="/OCMRS/CourseServlet" class="btn">
                    Manage Courses
                </a>

            </div>


            <!-- Faculty -->

            <div class="card">

                <h2>Faculty</h2>

                <p>Manage faculty records</p>

                <a href="/OCMRS/FacultyServlet" class="btn">
                    Manage Faculty
                </a>

            </div>


            <!-- Companies -->

            <div class="card">

                <h2>Companies</h2>

                <p>Manage recruitment companies</p>

                <a href="/OCMRS/CompanyServlet" class="btn">
                    Manage Companies
                </a>

            </div>


            <!-- Jobs -->

            <div class="card">

                <h2>Jobs</h2>

                <p>Manage job postings</p>

                <a href="/OCMRS/JobServlet" class="btn">
                    Manage Jobs
                </a>

            </div>


            <!-- Applications -->

            <div class="card">

                <h2>Applications</h2>

                <p>Manage student applications</p>

                <a href="/OCMRS/ApplicationServlet" class="btn">
                    Manage Applications
                </a>

            </div>


            <!-- Interviews -->

            <div class="card">

                <h2>Interviews</h2>

                <p>Manage interview schedules</p>

                <a href="/OCMRS/InterviewServlet" class="btn">
                    Manage Interviews
                </a>

            </div>


            <!-- Placements -->

            <div class="card">

                <h2>Placements</h2>

                <p>Manage placement records</p>

                <a href="/OCMRS/PlacementServlet" class="btn">
                    Manage Placements
                </a>

            </div>


            <!-- Reports -->

            <div class="card">

                <h2>Reports</h2>

                <p>View admin reports and statistics</p>

                <a href="/OCMRS/ReportServlet" class="btn">
                    View Reports
                </a>

            </div>


        </div>

    </div>

</body>

</html>