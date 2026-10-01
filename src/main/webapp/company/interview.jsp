<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company =
        (Company) request.getAttribute("company");

    Application app =
        (Application) request.getAttribute("application");

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

/* SIDEBAR */

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

/* MAIN */

.main {
    margin-left: 240px;
    padding: 30px;
}

/* TOPBAR */

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

/* CARD */

.card {
    background: white;

    border-radius: 12px;

    padding: 25px;

    margin-bottom: 25px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.06);
}

.card h2 {
    font-size: 20px;
    color: #111827;

    margin-bottom: 20px;
}

/* MESSAGE */

.message {
    padding: 40px 20px;

    text-align: center;
}

.message-icon {
    font-size: 50px;
    margin-bottom: 15px;
}

.message h2 {
    margin-bottom: 10px;
}

.message p {
    color: #6b7280;
    margin-bottom: 20px;
}

/* BUTTON */

.back-btn {
    display: inline-block;

    padding: 10px 16px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: 600;
}

.back-btn:hover {
    background: #1d4ed8;
}

/* STUDENT DETAILS */

.details-grid {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 15px;

    margin-bottom: 25px;
}

.detail-box {
    background: #f8fafc;

    padding: 15px;

    border-radius: 8px;

    border: 1px solid #e5e7eb;
}

.detail-box strong {
    display: block;

    color: #64748b;

    font-size: 12px;

    margin-bottom: 7px;
}

.detail-box span {
    color: #111827;

    font-size: 14px;

    font-weight: 600;
}

/* FORM */

.form-grid {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group label {
    font-size: 13px;

    font-weight: 600;

    color: #374151;

    margin-bottom: 7px;
}

.form-group input,
.form-group select {
    padding: 11px 12px;

    border: 1px solid #d1d5db;

    border-radius: 7px;

    outline: none;

    font-size: 14px;

    background: white;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #2563eb;
}

/* SCHEDULE BUTTON */

.schedule-btn {
    margin-top: 22px;

    padding: 11px 20px;

    background: #2563eb;

    color: white;

    border: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: 600;

    cursor: pointer;
}

.schedule-btn:hover {
    background: #1d4ed8;
}

/* TABLE */

.table-container {
    overflow-x: auto;
}

table {
    width: 100%;

    border-collapse: collapse;

    min-width: 600px;
}

thead {
    background: #f8fafc;
}

th {
    text-align: left;

    padding: 13px;

    color: #475569;

    font-size: 13px;

    border-bottom: 2px solid #e5e7eb;
}

td {
    padding: 14px 13px;

    font-size: 14px;

    border-bottom: 1px solid #e5e7eb;
}

.status {
    display: inline-block;

    padding: 6px 10px;

    border-radius: 20px;

    background: #fef3c7;

    color: #b45309;

    font-size: 12px;

    font-weight: 600;
}

/* SUCCESS */

.success {
    background: #dcfce7;

    color: #166534;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 20px;

    font-size: 14px;
}

/* RESPONSIVE */

@media(max-width: 900px) {

    .details-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }

    .form-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }
}

@media(max-width: 650px) {

    .sidebar {
        position: relative;

        width: 100%;

        height: auto;
    }

    .main {
        margin-left: 0;
    }

    .details-grid,
    .form-grid {
        grid-template-columns: 1fr;
    }
}

</style>

</head>

<body>

<!-- SIDEBAR -->

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


    <a href="<%= request.getContextPath() %>/CompanyInterviewServlet"
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


<!-- MAIN -->

<div class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>Interview Management</h1>

            <p>
                Schedule and manage student interviews.
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


    <!-- SUCCESS MESSAGE -->

    <%
        String success =
            request.getParameter("success");

        if ("scheduled".equals(success)) {
    %>

        <div class="success">

            ✅ Interview scheduled successfully!

        </div>

    <%
        }
    %>


    <!-- APPLICATION NOT SELECTED -->

    <% if (app == null) { %>

        <div class="card">

            <div class="message">

                <div class="message-icon">
                    📅
                </div>

                <h2>
                    Select an Applicant
                </h2>

                <p>
                    Please select an applicant from the
                    Applicants page to schedule an interview.
                </p>


                <a
                    href="<%= request.getContextPath() %>/CompanyApplicantsServlet"
                    class="back-btn">

                    👥 View Applicants

                </a>

            </div>

        </div>


    <% } else { %>


        <!-- APPLICATION DETAILS -->

        <div class="card">

            <h2>
                👤 Applicant Details
            </h2>


            <div class="details-grid">


                <div class="detail-box">

                    <strong>
                        Student Name
                    </strong>

                    <span>

                        <%= app.getStudentName() != null
                            ? app.getStudentName()
                            : "N/A" %>

                    </span>

                </div>


                <div class="detail-box">

                    <strong>
                        Email
                    </strong>

                    <span>

                        <%= app.getStudentEmail() != null
                            ? app.getStudentEmail()
                            : "N/A" %>

                    </span>

                </div>


                <div class="detail-box">

                    <strong>
                        Phone
                    </strong>

                    <span>

                        <%= app.getStudentPhone() != null
                            ? app.getStudentPhone()
                            : "N/A" %>

                    </span>

                </div>


                <div class="detail-box">

                    <strong>
                        Job Title
                    </strong>

                    <span>

                        <%= app.getJobTitle() != null
                            ? app.getJobTitle()
                            : "N/A" %>

                    </span>

                </div>

            </div>

        </div>


        <!-- SCHEDULE FORM -->

        <div class="card">

            <h2>
                📅 Schedule Interview
            </h2>


            <form
                action="<%= request.getContextPath() %>/CompanyInterviewScheduleServlet"
                method="post">


                <input
                    type="hidden"
                    name="applicationId"
                    value="<%= app.getApplicationId() %>">


                <div class="form-grid">


                    <!-- DATE -->

                    <div class="form-group">

                        <label>
                            Interview Date & Time
                        </label>

                        <input
                            type="datetime-local"
                            name="interviewDate"
                            required>

                    </div>


                    <!-- MODE -->

                    <div class="form-group">

                        <label>
                            Interview Mode
                        </label>

                        <select
                            name="mode"
                            required>

                            <option value="">
                                Select Mode
                            </option>

                            <option value="Online">
                                Online
                            </option>

                            <option value="Offline">
                                Offline
                            </option>

                            <option value="Phone">
                                Phone
                            </option>

                        </select>

                    </div>


                    <!-- RESULT -->

                    <div class="form-group">

                        <label>
                            Result
                        </label>

                        <select
                            name="result">

                            <option value="Pending">
                                Pending
                            </option>

                            <option value="Selected">
                                Selected
                            </option>

                            <option value="Rejected">
                                Rejected
                            </option>

                        </select>

                    </div>


                </div>


                <button
                    type="submit"
                    class="schedule-btn">

                    📅 Schedule Interview

                </button>

            </form>

        </div>


        <!-- INTERVIEW HISTORY -->

        <div class="card">

            <h2>
                📋 Interview History
            </h2>


            <% if (interviews.isEmpty()) { %>

                <div class="message">

                    <div class="message-icon">
                        📭
                    </div>

                    <p>
                        No interview has been scheduled
                        for this application yet.
                    </p>

                </div>


            <% } else { %>


                <div class="table-container">

                    <table>

                        <thead>

                            <tr>

                                <th>
                                    Interview ID
                                </th>

                                <th>
                                    Date & Time
                                </th>

                                <th>
                                    Mode
                                </th>

                                <th>
                                    Result
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                        <% for (Interview interview : interviews) { %>

                            <tr>

                                <td>
                                    #<%= interview.getInterviewId() %>
                                </td>

                                <td>
                                    <%= interview.getInterviewDate() != null
                                        ? interview.getInterviewDate()
                                        : "N/A" %>
                                </td>

                                <td>
                                    <%= interview.getMode() != null
                                        ? interview.getMode()
                                        : "N/A" %>
                                </td>

                                <td>

                                    <span class="status">

                                        <%= interview.getResult() != null
                                            ? interview.getResult()
                                            : "Pending" %>

                                    </span>

                                </td>

                            </tr>

                        <% } %>

                        </tbody>

                    </table>

                </div>


            <% } %>

        </div>


    <% } %>


</div>

</body>

</html>