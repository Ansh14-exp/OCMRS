<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>

<%
    List<Application> applications =
        (List<Application>) request.getAttribute("applications");

    if (applications == null) {
        applications = new java.util.ArrayList<Application>();
    }

    int totalApplications = applications.size();

    int appliedCount = 0;
    int reviewCount = 0;
    int shortlistedCount = 0;
    int interviewCount = 0;
    int rejectedCount = 0;

    for (Application app : applications) {

        String status = app.getStatus();

        if (status == null) {
            continue;
        }

        if (status.equalsIgnoreCase("Applied")) {
            appliedCount++;
        }
        else if (status.equalsIgnoreCase("Under Review")) {
            reviewCount++;
        }
        else if (status.equalsIgnoreCase("Shortlisted")) {
            shortlistedCount++;
        }
        else if (status.equalsIgnoreCase("Interview")) {
            interviewCount++;
        }
        else if (status.equalsIgnoreCase("Rejected")
              || status.equalsIgnoreCase("Not Selected")) {
            rejectedCount++;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>My Applications | OCMRS</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, #172554, #1e3a8a);
            color: white;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            padding: 25px 15px;
            overflow-y: auto;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h2 {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 12px;
            opacity: 0.8;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            margin-bottom: 8px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 13px 15px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        .menu a:hover {
            background: rgba(255,255,255,0.15);
        }

        .menu a.active {
            background: rgba(255,255,255,0.20);
            font-weight: bold;
        }

        /* ================= MAIN ================= */

        .main {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 28px;
            color: #172554;
        }

        .header p {
            color: #666;
            margin-top: 5px;
        }

        .user-box {
            background: white;
            padding: 10px 18px;
            border-radius: 8px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            color: #333;
        }

        /* ================= STAT CARDS ================= */

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .stat-card h3 {
            font-size: 28px;
            color: #1d4ed8;
            margin-bottom: 7px;
        }

        .stat-card p {
            color: #666;
            font-size: 14px;
        }

        /* ================= APPLICATION TABLE ================= */

        .application-section {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-header h2 {
            color: #172554;
            font-size: 21px;
        }

        .apply-button {
            background: #1d4ed8;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 7px;
            font-size: 14px;
            transition: 0.3s;
        }

        .apply-button:hover {
            background: #163ea8;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #eff6ff;
            color: #172554;
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        tr:hover {
            background: #f8fafc;
        }

        /* ================= STATUS ================= */

        .status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-applied {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .status-review {
            background: #fef3c7;
            color: #92400e;
        }

        .status-shortlisted {
            background: #dcfce7;
            color: #166534;
        }

        .status-interview {
            background: #ede9fe;
            color: #6d28d9;
        }

        .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-default {
            background: #e5e7eb;
            color: #374151;
        }

        /* ================= EMPTY STATE ================= */

        .empty {
            text-align: center;
            padding: 60px 20px;
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty h3 {
            color: #172554;
            margin-bottom: 8px;
        }

        .empty p {
            color: #777;
            margin-bottom: 20px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
                width: calc(100% - 210px);
                padding: 20px;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
            }

            .container {
                display: block;
            }

            .main {
                margin-left: 0;
                width: 100%;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .stats {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 450px) {

            .stats {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="logo">
            <h2>OCMRS</h2>
            <p>Student Portal</p>
        </div>

        <ul class="menu">

            <li>
                <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                    🏠
                    <span>Dashboard</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/StudentServlet">
                    👤
                    <span>Profile</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/EnrollmentServlet">
                    📚
                    <span>Enrollment</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/SubjectServlet">
                    📖
                    <span>Subjects</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ExamServlet">
                    📝
                    <span>Exams</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ResultServlet">
                    📊
                    <span>Results</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/JobServlet">
                    💼
                    <span>Jobs</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ApplicationServlet?action=apply">
    📨
    <span>Apply Job</span>
</a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ApplicationServlet"
                   class="active">
                    📄
                    <span>Applications</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/PlacementServlet">
                    🎓
                    <span>Placement</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/LogoutServlet">
                    🚪
                    <span>Logout</span>
                </a>
            </li>

        </ul>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main">

        <div class="header">

            <div>
                <h1>My Applications</h1>

                <p>
                    Track your job applications and their current status.
                </p>
            </div>

            <div class="user-box">
                👨‍🎓 Student Portal
            </div>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="stats">

            <div class="stat-card">
                <h3><%= totalApplications %></h3>
                <p>Total Applications</p>
            </div>

            <div class="stat-card">
                <h3><%= appliedCount %></h3>
                <p>Applied</p>
            </div>

            <div class="stat-card">
                <h3><%= reviewCount %></h3>
                <p>Under Review</p>
            </div>

            <div class="stat-card">
                <h3><%= shortlistedCount %></h3>
                <p>Shortlisted</p>
            </div>

            <div class="stat-card">
                <h3><%= interviewCount %></h3>
                <p>Interview</p>
            </div>

            <div class="stat-card">
                <h3><%= rejectedCount %></h3>
                <p>Rejected</p>
            </div>

        </div>


        <!-- ================= APPLICATIONS ================= -->

        <div class="application-section">

            <div class="section-header">

                <h2>Application History</h2>

                <a href="<%= request.getContextPath() %>/ApplicationServlet?action=apply"
   class="apply-button">
    + Apply for Jobs
</a>

            </div>


            <%
                if (applications.isEmpty()) {
            %>

                <div class="empty">

                    <div class="empty-icon">
                        📄
                    </div>

                    <h3>No Applications Yet</h3>

                    <p>
                        You have not applied for any job yet.
                    </p>

                    <a href="<%= request.getContextPath() %>/ApplicationServlet?action=apply"
   class="apply-button">
    Browse Available Jobs
</a>

                </div>

            <%
                } else {
            %>

            <div class="table-container">

                <table>

                    <thead>

                        <tr>
                            <th>Application ID</th>
                            <th>Job Title</th>
                            <th>Company</th>
                            <th>Application Date</th>
                            <th>Status</th>
                        </tr>

                    </thead>

                    <tbody>

                    <%
                        for (Application app : applications) {

                            String status = app.getStatus();

                            String statusClass = "status-default";

                            if (status != null) {

                                if (status.equalsIgnoreCase("Applied")) {
                                    statusClass = "status-applied";
                                }
                                else if (status.equalsIgnoreCase("Under Review")) {
                                    statusClass = "status-review";
                                }
                                else if (status.equalsIgnoreCase("Shortlisted")) {
                                    statusClass = "status-shortlisted";
                                }
                                else if (status.equalsIgnoreCase("Interview")) {
                                    statusClass = "status-interview";
                                }
                                else if (status.equalsIgnoreCase("Rejected")
                                      || status.equalsIgnoreCase("Not Selected")) {
                                    statusClass = "status-rejected";
                                }
                            }
                    %>

                        <tr>

                            <td>
                                #APP<%= app.getApplicationId() %>
                            </td>

                            <td>
                                <strong>
                                    <%= app.getJobTitle() %>
                                </strong>
                            </td>

                            <td>
                                <%= app.getCompanyName() %>
                            </td>

                            <td>
                                <%= app.getApplicationDate() %>
                            </td>

                            <td>

                                <span class="status <%= statusClass %>">
                                    <%= status %>
                                </span>

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

            <%
                }
            %>

        </div>

    </main>

</div>

</body>
</html>