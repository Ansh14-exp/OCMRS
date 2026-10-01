<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company =
        (Company) request.getAttribute("company");

    List<Interview> interviews =
        (List<Interview>) request.getAttribute("interviews");

    if (interviews == null) {
        interviews = new java.util.ArrayList<Interview>();
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Interviews - Company</title>

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
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    color: #60a5fa;
    font-size: 23px;
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

/* ================= TOPBAR ================= */

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

    min-width: 950px;
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

/* ================= MODE ================= */

.mode {
    display: inline-block;

    padding: 6px 10px;

    border-radius: 20px;

    background: #f1f5f9;

    color: #475569;

    font-size: 12px;

    font-weight: 600;
}

/* ================= RESULT ================= */

.result {
    display: inline-block;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: 600;
}

.result-pending {
    background: #fef3c7;

    color: #b45309;
}

.result-selected {
    background: #dcfce7;

    color: #15803d;
}

.result-rejected {
    background: #fee2e2;

    color: #dc2626;
}

/* ================= EMPTY ================= */

.empty {
    text-align: center;

    padding: 55px 20px;

    color: #6b7280;
}

.empty-icon {
    font-size: 50px;

    margin-bottom: 15px;
}

.empty h3 {
    color: #374151;

    margin-bottom: 8px;
}

.empty p {
    font-size: 14px;
}

/* ================= VIEW BUTTON ================= */

.view-btn {
    display: inline-block;

    padding: 8px 12px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    font-size: 12px;

    font-weight: 600;
}

.view-btn:hover {
    background: #1d4ed8;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 800px) {

    .sidebar {
        width: 200px;
    }

    .main {
        margin-left: 200px;

        padding: 20px;
    }
}

@media (max-width: 600px) {

    .sidebar {
        position: relative;

        width: 100%;

        height: auto;
    }

    .main {
        margin-left: 0;
    }

    .topbar {
        flex-direction: column;

        align-items: flex-start;

        gap: 10px;
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


    <a href="<%= request.getContextPath() %>/CompanyApplicantsServlet">
        👥 Applicants
    </a>


    <a href="<%= request.getContextPath() %>/CompanyInterviewsServlet"
       class="active">

        📅 Interviews

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


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>
                Interviews
            </h1>

            <p>
                View and manage all scheduled interviews.
            </p>

        </div>


        <div>

            <% if (company != null) { %>

                <span class="company-name">

                    🏢
                    <%= company.getCompanyName() %>

                </span>

            <% } %>

        </div>

    </div>


    <!-- INTERVIEW CARD -->

    <div class="card">


        <div class="card-header">

            <h2>
                📅 Scheduled Interviews
            </h2>

            <span class="total">

                Total:
                <%= interviews.size() %>

            </span>

        </div>


        <% if (interviews.isEmpty()) { %>


            <!-- EMPTY -->

            <div class="empty">

                <div class="empty-icon">
                    📭
                </div>

                <h3>
                    No Interviews Scheduled
                </h3>

                <p>
                    You have not scheduled any interviews yet.
                </p>

            </div>


        <% } else { %>


            <!-- TABLE -->

            <div class="table-container">

                <table>

                    <thead>

                        <tr>

                            <th>
                                Student
                            </th>

                            <th>
                                Email
                            </th>

                            <th>
                                Phone
                            </th>

                            <th>
                                Job
                            </th>

                            <th>
                                Interview Date
                            </th>

                            <th>
                                Mode
                            </th>

                            <th>
                                Result
                            </th>

                            <th>
                                Action
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                    <% for (Interview interview : interviews) { %>


                        <tr>


                            <!-- STUDENT -->

                            <td>

                                <div class="student-name">

                                    <%= interview.getStudentName() != null
                                        ? interview.getStudentName()
                                        : "N/A" %>

                                </div>

                                <div class="student-id">

                                    Interview ID:
                                    #<%= interview.getInterviewId() %>

                                </div>

                            </td>


                            <!-- EMAIL -->

                            <td>

                                <%= interview.getStudentEmail() != null
                                    ? interview.getStudentEmail()
                                    : "N/A" %>

                            </td>


                            <!-- PHONE -->

                            <td>

                                <%= interview.getStudentPhone() != null
                                    ? interview.getStudentPhone()
                                    : "N/A" %>

                            </td>


                            <!-- JOB -->

                            <td>

                                <div class="job-title">

                                    <%= interview.getJobTitle() != null
                                        ? interview.getJobTitle()
                                        : "N/A" %>

                                </div>

                            </td>


                            <!-- DATE -->

                            <td>

                                <%= interview.getInterviewDate() != null
                                    ? interview.getInterviewDate()
                                    : "N/A" %>

                            </td>


                            <!-- MODE -->

                            <td>

                                <span class="mode">

                                    <%= interview.getMode() != null
                                        ? interview.getMode()
                                        : "N/A" %>

                                </span>

                            </td>


                            <!-- RESULT -->

                            <td>

                                <%
                                    String result =
                                        interview.getResult();

                                    if (result == null ||
                                        result.trim().isEmpty()) {

                                        result = "Pending";
                                    }

                                    String resultClass =
                                        "result-pending";

                                    if ("Selected".equalsIgnoreCase(result)) {

                                        resultClass =
                                            "result-selected";

                                    } else if
                                      ("Rejected".equalsIgnoreCase(result)) {

                                        resultClass =
                                            "result-rejected";
                                    }
                                %>

                                <span class="result <%= resultClass %>">

                                    <%= result %>

                                </span>

                            </td>


                            <!-- ACTION -->

                            <td>

                                <a
                                    href="<%= request.getContextPath() %>/CompanyInterviewServlet?applicationId=<%= interview.getApplicationId() %>"
                                    class="view-btn">

                                    👁 View

                                </a>

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