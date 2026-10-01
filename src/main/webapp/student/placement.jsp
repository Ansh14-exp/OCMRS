<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>

<%
    List<Placement> placements =
        (List<Placement>) request.getAttribute("placements");

    if (placements == null) {
        placements = new java.util.ArrayList<Placement>();
    }

    int totalPlacements = placements.size();

    int selectedCount = 0;
    int pendingCount = 0;
    int rejectedCount = 0;

    for (Placement placement : placements) {

        String status = placement.getStatus();

        if (status == null) {
            continue;
        }

        if (status.equalsIgnoreCase("Selected")
                || status.equalsIgnoreCase("Placed")) {

            selectedCount++;

        } else if (status.equalsIgnoreCase("Pending")
                || status.equalsIgnoreCase("Under Review")) {

            pendingCount++;

        } else if (status.equalsIgnoreCase("Rejected")
                || status.equalsIgnoreCase("Not Selected")) {

            rejectedCount++;
        }
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Placement | OCMRS</title>

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
            top: 0;
            left: 0;
            bottom: 0;
            padding: 25px 15px;
            overflow-y: auto;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h2 {
            font-size: 25px;
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
            color: #172554;
            font-size: 28px;
        }

        .header p {
            color: #666;
            margin-top: 6px;
        }

        .user-box {
            background: white;
            padding: 11px 18px;
            border-radius: 8px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        /* ================= STATISTICS ================= */

        .stats {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h3 {
            font-size: 28px;
            color: #1d4ed8;
            margin-bottom: 7px;
        }

        .card p {
            color: #666;
            font-size: 14px;
        }

        /* ================= PLACEMENT SECTION ================= */

        .placement-section {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .section-header {
            margin-bottom: 20px;
        }

        .section-header h2 {
            color: #172554;
            font-size: 21px;
        }

        .section-header p {
            color: #777;
            font-size: 14px;
            margin-top: 5px;
        }

        /* ================= TABLE ================= */

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

        .status-selected {
            background: #dcfce7;
            color: #166534;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-default {
            background: #e5e7eb;
            color: #374151;
        }

        /* ================= EMPTY ================= */

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

        .job-button {
            display: inline-block;
            background: #1d4ed8;
            color: white;
            text-decoration: none;
            padding: 11px 20px;
            border-radius: 7px;
            font-size: 14px;
        }

        .job-button:hover {
            background: #163ea8;
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

            .container {
                display: block;
            }

            .sidebar {
                position: relative;
                width: 100%;
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
                <a href="<%= request.getContextPath() %>/JobServlet">
                    📨
                    <span>Apply Job</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ApplicationServlet">
                    📄
                    <span>Applications</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/PlacementServlet"
                   class="active">
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

                <h1>Placement Dashboard</h1>

                <p>
                    Track your placement progress and selection details.
                </p>

            </div>

            <div class="user-box">
                🎓 Student Portal
            </div>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="stats">

            <div class="card">
                <h3>
                    <%= totalPlacements %>
                </h3>
                <p>
                    Placement Records
                </p>
            </div>

            <div class="card">
                <h3>
                    <%= selectedCount %>
                </h3>
                <p>
                    Selected / Placed
                </p>
            </div>

            <div class="card">
                <h3>
                    <%= pendingCount %>
                </h3>
                <p>
                    Pending
                </p>
            </div>

            <div class="card">
                <h3>
                    <%= rejectedCount %>
                </h3>
                <p>
                    Not Selected
                </p>
            </div>

        </div>


        <!-- ================= PLACEMENT DETAILS ================= -->

        <div class="placement-section">

            <div class="section-header">

                <h2>
                    Placement Details
                </h2>

                <p>
                    Placement information retrieved from the college database.
                </p>

            </div>


            <%
                if (placements.isEmpty()) {
            %>

                <div class="empty">

                    <div class="empty-icon">
                        🎓
                    </div>

                    <h3>
                        No Placement Records Found
                    </h3>

                    <p>
                        Your placement information will appear here
                        when a placement record is available.
                    </p>

                    <a href="<%= request.getContextPath() %>/JobServlet"
                       class="job-button">
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

                            <th>Placement ID</th>
                            <th>Job Position</th>
                            <th>Company</th>
                            <th>Placement Date</th>
                            <th>Package</th>
                            <th>Status</th>

                        </tr>

                    </thead>

                    <tbody>

                    <%
                        for (Placement placement : placements) {

                            String status =
                                placement.getStatus();

                            String statusClass =
                                "status-default";

                            if (status != null) {

                                if (status.equalsIgnoreCase("Selected")
                                        || status.equalsIgnoreCase("Placed")) {

                                    statusClass =
                                        "status-selected";

                                } else if (status.equalsIgnoreCase("Pending")
                                        || status.equalsIgnoreCase("Under Review")) {

                                    statusClass =
                                        "status-pending";

                                } else if (status.equalsIgnoreCase("Rejected")
                                        || status.equalsIgnoreCase("Not Selected")) {

                                    statusClass =
                                        "status-rejected";
                                }
                            }
                    %>

                        <tr>

                            <td>
                                #PLC<%= placement.getPlacementId() %>
                            </td>

                            <td>
                                <strong>
                                    <%= placement.getJobTitle() %>
                                </strong>
                            </td>

                            <td>
                                <%= placement.getCompanyName() %>
                            </td>

                            <td>
                                <%= placement.getPlacementDate() != null
                                    ? placement.getPlacementDate()
                                    : "—" %>
                            </td>

                            <td>
                                <%= placement.getPackageAmount() != null
                                    ? placement.getPackageAmount()
                                    : "—" %>
                            </td>

                            <td>

                                <span class="status <%= statusClass %>">

                                    <%= status != null
                                        ? status
                                        : "Not Updated" %>

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