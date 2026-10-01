<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company = (Company) request.getAttribute("company");

    List<Application> applications =
        (List<Application>) request.getAttribute("applications");

    if (applications == null) {
        applications = new java.util.ArrayList<Application>();
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Applicants - Company</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f4f7fb;
    color: #1f2937;
}

/* ================= SIDEBAR ================= */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;

    width: 240px;
    height: 100vh;

    background: #111827;
    color: white;

    padding: 25px 15px;

    overflow-y: auto;
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    color: #60a5fa;
    font-size: 22px;
}

.logo p {
    color: #9ca3af;
    font-size: 12px;
    margin-top: 5px;
}

.menu-title {
    color: #6b7280;
    font-size: 11px;
    margin: 20px 10px 8px;
    text-transform: uppercase;
}

.sidebar a {
    display: block;

    color: #d1d5db;
    text-decoration: none;

    padding: 12px 14px;

    margin-bottom: 5px;

    border-radius: 7px;

    transition: 0.3s;
}

.sidebar a:hover {
    background: #1f2937;
    color: white;
}

.sidebar a.active {
    background: #2563eb;
    color: white;
}

/* ================= MAIN ================= */

.main {
    margin-left: 240px;
    padding: 30px;
}

/* ================= TOP BAR ================= */

.topbar {
    background: white;

    padding: 20px 25px;

    border-radius: 12px;

    margin-bottom: 25px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.06);

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.topbar h1 {
    font-size: 25px;
    color: #111827;
}

.topbar p {
    color: #6b7280;
    margin-top: 5px;
    font-size: 14px;
}

.company-name {
    font-weight: bold;
    color: #2563eb;
}

/* ================= CARD ================= */

.card {
    background: white;

    border-radius: 12px;

    padding: 25px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.06);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-bottom: 20px;
}

.card-header h2 {
    font-size: 20px;
    color: #111827;
}

.total {
    background: #eff6ff;
    color: #2563eb;

    padding: 8px 14px;

    border-radius: 20px;

    font-size: 13px;
    font-weight: bold;
}

/* ================= TABLE ================= */

.table-container {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 1150px;
}

thead {
    background: #f8fafc;
}

th {
    text-align: left;

    padding: 14px 12px;

    font-size: 13px;

    color: #475569;

    border-bottom: 2px solid #e5e7eb;
}

td {
    padding: 15px 12px;

    font-size: 14px;

    border-bottom: 1px solid #e5e7eb;

    color: #374151;

    vertical-align: middle;
}

tbody tr:hover {
    background: #f9fafb;
}

/* ================= STUDENT ================= */

.student-name {
    font-weight: 600;
    color: #111827;
}

.student-id {
    color: #6b7280;
    font-size: 12px;
    margin-top: 3px;
}

/* ================= JOB ================= */

.job-title {
    font-weight: 600;
    color: #2563eb;
}

/* ================= STATUS ================= */

.status {
    display: inline-block;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: 600;
}

.status-applied {
    background: #eff6ff;
    color: #2563eb;
}

.status-selected {
    background: #dcfce7;
    color: #15803d;
}

.status-rejected {
    background: #fee2e2;
    color: #dc2626;
}

.status-pending {
    background: #fef3c7;
    color: #b45309;
}

/* ================= ACTION BUTTONS ================= */

.action-container {
    display: flex;
    flex-direction: column;
    gap: 7px;
    align-items: flex-start;
}

.schedule-btn {
    display: inline-block;

    padding: 8px 12px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    font-size: 12px;

    font-weight: 600;

    white-space: nowrap;

    transition: 0.3s;
}

.schedule-btn:hover {
    background: #1d4ed8;
}

.placement-btn {
    display: inline-block;

    padding: 8px 12px;

    background: #16a34a;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    font-size: 12px;

    font-weight: 600;

    white-space: nowrap;

    transition: 0.3s;
}

.placement-btn:hover {
    background: #15803d;
}

/* ================= EMPTY ================= */

.empty {
    text-align: center;

    padding: 50px 20px;

    color: #6b7280;
}

.empty-icon {
    font-size: 45px;
    margin-bottom: 15px;
}

.empty h3 {
    color: #374151;
    margin-bottom: 8px;
}

.empty p {
    font-size: 14px;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 900px) {

    .sidebar {
        width: 200px;
    }

    .main {
        margin-left: 200px;
        padding: 20px;
    }
}

@media (max-width: 650px) {

    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
    }

    .main {
        margin-left: 0;
    }

}

</style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        <h2>OCMRS</h2>
        <p>Company Portal</p>
    </div>

    <div class="menu-title">
        Main Menu
    </div>

    <a href="<%= request.getContextPath() %>/company/dashboard.jsp">
        🏠 Dashboard
    </a>

    <a href="<%= request.getContextPath() %>/CompanyProfileServlet">
        👤 Company Profile
    </a>

    <div class="menu-title">
        Recruitment
    </div>

    <a href="<%= request.getContextPath() %>/CompanyJobServlet">
        ➕ Post Job
    </a>

    <a href="<%= request.getContextPath() %>/CompanyManageJobServlet">
        📋 Manage Jobs
    </a>

    <a href="<%= request.getContextPath() %>/CompanyApplicantsServlet"
       class="active">
        👥 Applicants
    </a>

    <a href="<%= request.getContextPath() %>/CompanyInterviewsServlet">
        📅 Interviews
    </a>

    <a href="<%= request.getContextPath() %>/CompanyPlacementServlet">
        🏆 Placements
    </a>

    <div class="menu-title">
        Account
    </div>

    <a href="<%= request.getContextPath() %>/LogoutServlet">
        🚪 Logout
    </a>

</div>


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- TOP BAR -->

    <div class="topbar">

        <div>

            <h1>Applicants</h1>

            <p>
                Manage students who applied for your jobs.
            </p>

        </div>

        <div>

            <% if (company != null) { %>

                <span class="company-name">
                    🏢 <%= company.getCompanyName() %>
                </span>

            <% } %>

        </div>

    </div>


    <!-- APPLICANTS CARD -->

    <div class="card">

        <div class="card-header">

            <h2>Job Applicants</h2>

            <span class="total">
                Total Applicants: <%= applications.size() %>
            </span>

        </div>


        <% if (applications.isEmpty()) { %>

            <!-- EMPTY STATE -->

            <div class="empty">

                <div class="empty-icon">
                    👥
                </div>

                <h3>No Applicants Found</h3>

                <p>
                    No students have applied for your jobs yet.
                </p>

            </div>

        <% } else { %>

            <!-- TABLE -->

            <div class="table-container">

                <table>

                    <thead>

                        <tr>

                            <th>Student</th>

                            <th>Email</th>

                            <th>Phone</th>

                            <th>Job Title</th>

                            <th>Application Date</th>

                            <th>Status</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>

                    <% for (Application app : applications) { %>

                        <tr>

                            <!-- STUDENT -->

                            <td>

                                <div class="student-name">

                                    <%= app.getStudentName() != null
                                        ? app.getStudentName()
                                        : "N/A" %>

                                </div>

                                <div class="student-id">

                                    Student ID:
                                    <%= app.getStudentId() %>

                                </div>

                            </td>


                            <!-- EMAIL -->

                            <td>

                                <%= app.getStudentEmail() != null
                                    ? app.getStudentEmail()
                                    : "N/A" %>

                            </td>


                            <!-- PHONE -->

                            <td>

                                <%= app.getStudentPhone() != null
                                    ? app.getStudentPhone()
                                    : "N/A" %>

                            </td>


                            <!-- JOB -->

                            <td>

                                <div class="job-title">

                                    <%= app.getJobTitle() != null
                                        ? app.getJobTitle()
                                        : "N/A" %>

                                </div>

                            </td>


                            <!-- APPLICATION DATE -->

                            <td>

                                <%= app.getApplicationDate() != null
                                    ? app.getApplicationDate()
                                    : "N/A" %>

                            </td>


                            <!-- STATUS -->

                            <td>

                                <%
                                    String status = app.getStatus();

                                    if (status == null ||
                                        status.trim().isEmpty()) {

                                        status = "Pending";
                                    }

                                    String statusClass =
                                        "status-pending";

                                    if ("Applied".equalsIgnoreCase(status)) {

                                        statusClass = "status-applied";

                                    } else if ("Selected".equalsIgnoreCase(status)) {

                                        statusClass = "status-selected";

                                    } else if ("Rejected".equalsIgnoreCase(status)) {

                                        statusClass = "status-rejected";
                                    }
                                %>

                                <span class="status <%= statusClass %>">

                                    <%= status %>

                                </span>

                            </td>


                            <!-- ACTION -->

                            <td>

                                <div class="action-container">

                                    <!-- SCHEDULE INTERVIEW -->

                                    <a
                                        href="<%= request.getContextPath() %>/CompanyInterviewServlet?applicationId=<%= app.getApplicationId() %>"
                                        class="schedule-btn">

                                        📅 Schedule Interview

                                    </a>


                                    <!-- CREATE PLACEMENT -->

                                    <% if ("Selected".equalsIgnoreCase(app.getStatus())) { %>

                                        <a
                                            href="<%= request.getContextPath() %>/CompanyPlacementServlet?applicationId=<%= app.getApplicationId() %>"
                                            class="placement-btn">

                                            🏆 Create Placement

                                        </a>

                                    <% } %>

                                </div>

                            </td>

                        </tr>

                    <% } %>

                    </tbody>

                </table>

            </div>

        <% } %>

    </div>

</div>

</body>
</html>