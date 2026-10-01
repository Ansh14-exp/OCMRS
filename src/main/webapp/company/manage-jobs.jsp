<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company =
        (Company) session.getAttribute("company");

    if (company == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Manage Jobs - OCMRS</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        .sidebar {
            position: fixed;
            width: 240px;
            height: 100vh;
            background: #172554;
            color: white;
            padding: 25px 15px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 14px 18px;
            margin: 6px 0;
            border-radius: 8px;
        }

        .sidebar a:hover,
        .sidebar .active {
            background: #2563eb;
        }

        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .topbar {
            background: white;
            padding: 20px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .topbar h1 {
            color: #172554;
            margin-bottom: 6px;
        }

        .topbar p {
            color: #666;
        }

        .job-container {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #172554;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #eee;
            vertical-align: top;
        }

        tr:hover {
            background: #f8fafc;
        }

        .job-title {
            font-weight: bold;
            color: #1d4ed8;
        }

        .description {
            max-width: 280px;
            color: #666;
        }

        .badge {
            background: #dbeafe;
            color: #1d4ed8;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 13px;
        }

        .edit-btn {
            background: #f59e0b;
            color: white;
            padding: 8px 13px;
            border-radius: 6px;
            text-decoration: none;
            margin-right: 5px;
        }

        .delete-btn {
            background: #dc2626;
            color: white;
            padding: 8px 13px;
            border-radius: 6px;
            text-decoration: none;
        }

        .edit-btn:hover,
        .delete-btn:hover {
            opacity: 0.85;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: #777;
        }

    </style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h2>🏢 OCMRS</h2>

    <a href="<%= request.getContextPath() %>/company/dashboard.jsp">
        🏠 Dashboard
    </a>

    <a href="<%= request.getContextPath() %>/CompanyProfileServlet">
        👤 Profile
    </a>

    <a href="<%= request.getContextPath() %>/CompanyJobServlet">
        💼 Post Job
    </a>

    <a href="<%= request.getContextPath() %>/CompanyManageJobServlet"
       class="active">
        📋 Manage Jobs
    </a>

    <a href="#">
        👥 Applicants
    </a>

    <a href="#">
        📅 Interviews
    </a>

    <a href="#">
        🎓 Placements
    </a>

    <a href="<%= request.getContextPath() %>/LogoutServlet">
        🚪 Logout
    </a>

</div>


<!-- MAIN CONTENT -->

<div class="main">

    <div class="topbar">

        <h1>Manage Jobs</h1>

        <p>
            Manage jobs posted by
            <strong><%= company.getCompanyName() %></strong>
        </p>

    </div>


    <div class="job-container">

        <%
            if (jobs == null || jobs.isEmpty()) {
        %>

            <div class="empty">

                <h2>No Jobs Found</h2>

                <p>
                    You have not posted any jobs yet.
                </p>

                <br>

                <a href="<%= request.getContextPath() %>/CompanyJobServlet"
                   class="edit-btn">
                    + Post New Job
                </a>

            </div>

        <%
            } else {
        %>

            <table>

                <thead>

                    <tr>
                        <th>ID</th>
                        <th>Job Title</th>
                        <th>Description</th>
                        <th>Salary</th>
                        <th>Location</th>
                        <th>Last Date</th>
                        <th>Action</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (Job job : jobs) {
                %>

                    <tr>

                        <td>
                            <%= job.getJobId() %>
                        </td>

                        <td class="job-title">
                            <%= job.getTitle() %>
                        </td>

                        <td class="description">
                            <%= job.getDescription() %>
                        </td>

                        <td>
                            <span class="badge">
                                <%= job.getSalaryRange() %>
                            </span>
                        </td>

                        <td>
                            <%= job.getLocation() %>
                        </td>

                        <td>
                            <%= job.getLastDate() %>
                        </td>

                        <td>

                            <a href="<%= request.getContextPath() %>/CompanyEditJobServlet?jobId=<%= job.getJobId() %>"
   class="edit-btn">
    ✏️ Edit
</a>

                            <a href="<%= request.getContextPath() %>/CompanyDeleteJobServlet?jobId=<%= job.getJobId() %>"
   class="delete-btn"
   onclick="return confirm('Are you sure you want to delete this job?');">
    🗑️ Delete
</a>

                        </td>

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        <%
            }
        %>

    </div>

</div>

</body>
</html>