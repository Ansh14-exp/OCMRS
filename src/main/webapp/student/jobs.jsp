<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>

<%
    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");

    if (jobs == null) {
        response.sendRedirect(
            request.getContextPath() + "/JobServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Available Jobs - OCMRS</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;

            width: 240px;
            height: 100vh;

            background: linear-gradient(
                180deg,
                #667eea,
                #764ba2
            );

            padding-top: 25px;

            box-shadow:
                3px 0 15px rgba(0,0,0,0.12);

            overflow-y: auto;
        }

        .logo {
            text-align: center;
            color: white;

            margin-bottom: 25px;
            padding-bottom: 20px;

            border-bottom:
                1px solid rgba(255,255,255,0.2);
        }

        .logo h2 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 13px;
            opacity: 0.85;
        }

        .sidebar a {
            display: block;

            color: white;
            text-decoration: none;

            padding: 14px 22px;
            margin: 5px 12px;

            border-radius: 8px;

            font-size: 15px;

            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255,255,255,0.18);
            transform: translateX(4px);
        }

        .sidebar a.active {
            background: rgba(255,255,255,0.25);

            font-weight: bold;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.12);
        }

        /* ================= MAIN CONTENT ================= */

        .main-content {
            margin-left: 240px;
            padding: 40px;

            min-height: 100vh;
        }

        .header {
            background: linear-gradient(
                135deg,
                #1e3c72,
                #2a5298
            );

            color: white;

            padding: 25px 35px;

            border-radius: 15px;

            margin-bottom: 30px;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.15);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 6px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        /* ================= JOB CARD ================= */

        .card {
            background: white;

            border-radius: 12px;

            padding: 25px;

            margin-bottom: 20px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);

            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 7px 20px rgba(0,0,0,0.12);
        }

        .company {
            color: #1e3c72;

            font-size: 14px;

            font-weight: bold;

            margin-bottom: 8px;
        }

        .title {
            font-size: 22px;

            font-weight: bold;

            margin-bottom: 12px;
        }

        .description {
            color: #666;

            line-height: 1.6;

            margin-bottom: 18px;
        }

        .details {
            display: flex;

            flex-wrap: wrap;

            gap: 12px;

            margin-bottom: 20px;
        }

        .detail {
            background: #f1f4f9;

            padding: 9px 13px;

            border-radius: 6px;

            font-size: 14px;
        }

        /* ================= APPLY BUTTON ================= */

        .apply-btn {
            display: inline-block;

            background: #1e3c72;

            color: white;

            padding: 10px 20px;

            border-radius: 6px;

            text-decoration: none;

            font-weight: bold;

            transition: 0.3s;
        }

        .apply-btn:hover {
            background: #2a5298;

            transform: translateY(-2px);
        }

        /* ================= NO JOBS ================= */

        .no-jobs {
            background: white;

            text-align: center;

            padding: 40px;

            border-radius: 12px;

            color: #777;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);
        }

        .no-jobs h2 {
            margin-bottom: 10px;
        }

        /* ================= BACK BUTTON ================= */

        .back-btn {
            display: inline-block;

            margin-top: 5px;

            padding: 10px 18px;

            background: #555;

            color: white;

            text-decoration: none;

            border-radius: 6px;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #333;

            transform: translateY(-2px);
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 25px;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;
                height: auto;
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .sidebar a {
                display: inline-block;
                width: auto;
            }
        }

    </style>

</head>

<body>


<!-- =====================================================
     SIDEBAR
     ===================================================== -->

<div class="sidebar">

    <div class="logo">

        <h2>OCMRS</h2>

        <p>Student Portal</p>

    </div>


    <a href="<%= request.getContextPath() %>/student/dashboard.jsp">

        🏠 Dashboard

    </a>


    <a href="<%= request.getContextPath() %>/StudentServlet">

        👤 Profile

    </a>


    <a href="<%= request.getContextPath() %>/EnrollmentServlet">

        📚 Enrollment

    </a>


    <a href="<%= request.getContextPath() %>/SubjectServlet">

        📖 Subjects

    </a>


    <a href="<%= request.getContextPath() %>/ExamServlet">

        📝 Exams

    </a>


    <a href="<%= request.getContextPath() %>/ResultServlet">

        📊 Results

    </a>


    <a href="<%= request.getContextPath() %>/JobServlet"
       class="active">

        💼 Jobs

    </a>


    <a href="<%= request.getContextPath() %>/ApplicationServlet?action=apply">

    📨 Apply Job

</a>


    <a href="<%= request.getContextPath() %>/ApplicationServlet">

        📄 Applications

    </a>


    <a href="<%= request.getContextPath() %>/PlacementServlet">

        🎓 Placement

    </a>


    <a href="<%= request.getContextPath() %>/LogoutServlet">

        🚪 Logout

    </a>

</div>


<!-- =====================================================
     MAIN CONTENT
     ===================================================== -->

<div class="main-content">


    <!-- HEADER -->

    <div class="header">

        <h1>💼 Available Jobs</h1>

        <p>
            Explore career opportunities from recruiting companies
        </p>

    </div>


    <!-- JOB DATA -->

    <% if (jobs.isEmpty()) { %>


        <div class="no-jobs">

            <h2>No Jobs Available</h2>

            <p>
                There are currently no job openings.
            </p>

        </div>


    <% } else { %>


        <% for (Job job : jobs) { %>


            <div class="card">


                <div class="company">

                    <%= job.getCompanyName() %>

                </div>


                <div class="title">

                    <%= job.getTitle() %>

                </div>


                <div class="description">

                    <%= job.getDescription() %>

                </div>


                <div class="details">


                    <div class="detail">

                        💰 Salary:
                        <%= job.getSalaryRange() %>

                    </div>


                    <div class="detail">

                        📍 Location:
                        <%= job.getLocation() %>

                    </div>


                    <div class="detail">

                        📅 Last Date:
                        <%= job.getLastDate() %>

                    </div>


                </div>


                <!-- APPLY NOW -->

                <a href="<%= request.getContextPath() %>/ApplicationServlet?jobId=<%= job.getJobId() %>"
                   class="apply-btn">

                    Apply Now

                </a>


            </div>


        <% } %>


    <% } %>


    <!-- BACK BUTTON -->

    <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
       class="back-btn">

        ← Back to Dashboard

    </a>


</div>


</body>
</html>