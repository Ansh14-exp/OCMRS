<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Job" %>

<%
    Job job = (Job) request.getAttribute("job");

    if (job == null) {
        response.sendRedirect(
            request.getContextPath()
            + "/CompanyManageJobServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Job - OCMRS</title>

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

        .header {
            background: white;
            padding: 20px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .header h1 {
            color: #172554;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            max-width: 850px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 15px;
        }

        textarea {
            min-height: 130px;
            resize: vertical;
        }

        input:focus,
        textarea:focus {
            outline: none;
            border-color: #2563eb;
        }

        .buttons {
            margin-top: 25px;
        }

        .update-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 15px;
        }

        .cancel-btn {
            background: #6b7280;
            color: white;
            padding: 12px 22px;
            border-radius: 7px;
            text-decoration: none;
            margin-left: 10px;
        }

        .update-btn:hover,
        .cancel-btn:hover {
            opacity: 0.85;
        }

        .error {
            background: #fee2e2;
            color: #b91c1c;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 20px;
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


<!-- MAIN -->

<div class="main">

    <div class="header">

        <h1>✏️ Edit Job</h1>

        <p>Update your job posting details.</p>

    </div>


    <div class="form-container">

        <%
            String error =
                request.getParameter("error");

            if ("title".equals(error)) {
        %>

            <div class="error">
                Job title is required.
            </div>

        <%
            } else if ("failed".equals(error)) {
        %>

            <div class="error">
                Failed to update job. Please try again.
            </div>

        <%
            }
        %>


        <form
            action="<%= request.getContextPath() %>/CompanyEditJobServlet"
            method="post">

            <input
                type="hidden"
                name="jobId"
                value="<%= job.getJobId() %>">


            <div class="form-group">

                <label>Job Title</label>

                <input
                    type="text"
                    name="title"
                    value="<%= job.getTitle() %>"
                    required>

            </div>


            <div class="form-group">

                <label>Description</label>

                <textarea
                    name="description"><%= job.getDescription() != null
                    ? job.getDescription() : "" %></textarea>

            </div>


            <div class="form-group">

                <label>Salary Range</label>

                <input
                    type="text"
                    name="salaryRange"
                    value="<%= job.getSalaryRange() != null
                    ? job.getSalaryRange() : "" %>">

            </div>


            <div class="form-group">

                <label>Location</label>

                <input
                    type="text"
                    name="location"
                    value="<%= job.getLocation() != null
                    ? job.getLocation() : "" %>">

            </div>


            <div class="form-group">

                <label>Last Date</label>

                <input
                    type="date"
                    name="lastDate"
                    value="<%= job.getLastDate() != null
                    ? job.getLastDate() : "" %>">

            </div>


            <div class="buttons">

                <button
                    type="submit"
                    class="update-btn">
                    💾 Update Job
                </button>

                <a
                    href="<%= request.getContextPath() %>/CompanyManageJobServlet"
                    class="cancel-btn">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>