<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    Application appData =
            (Application) request.getAttribute("application");

    List<Job> jobList =
            (List<Job>) request.getAttribute("jobs");

    List<Student> studentList =
            (List<Student>) request.getAttribute("students");

    if (appData == null) {
        response.sendRedirect(
                request.getContextPath()
                + "/ApplicationServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Application</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
        }

        .header {
            background: #1e3a8a;
            color: white;
            padding: 20px 30px;
        }

        .header h1 {
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 35px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            color: #1e3a8a;
            margin-top: 0;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 14px;
        }

        .buttons {
            margin-top: 25px;
        }

        .update-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 11px 20px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        .cancel-btn {
            background: #6b7280;
            color: white;
            padding: 11px 20px;
            border-radius: 7px;
            text-decoration: none;
            margin-left: 8px;
        }

        .cancel-btn:hover {
            background: #4b5563;
        }

    </style>

</head>

<body>

<div class="header">

    <h1>✏️ Edit Application</h1>

</div>


<div class="container">

    <div class="card">

        <h2>Update Application</h2>


        <form action="<%= request.getContextPath() %>/ApplicationServlet"
              method="post">


            <!-- ACTION -->

            <input type="hidden"
                   name="action"
                   value="update">


            <!-- APPLICATION ID -->

            <input type="hidden"
                   name="applicationId"
                   value="<%= appData.getApplicationId() %>">


            <!-- JOB -->

            <div class="form-group">

                <label>Job</label>

                <select name="jobId" required>

                    <option value="">
                        -- Select Job --
                    </option>

                    <%
                        if (jobList != null) {

                            for (Job jobItem : jobList) {
                    %>

                    <option
                        value="<%= jobItem.getJobId() %>"
                        <%= jobItem.getJobId()
                                == appData.getJobId()
                                ? "selected"
                                : "" %>>

                        <%= jobItem.getTitle() %>
                        (ID: <%= jobItem.getJobId() %>)

                    </option>

                    <%
                            }
                        }
                    %>

                </select>

            </div>


            <!-- STUDENT -->

            <div class="form-group">

                <label>Student</label>

                <select name="studentId" required>

                    <option value="">
                        -- Select Student --
                    </option>

                    <%
                        if (studentList != null) {

                            for (Student studentItem
                                    : studentList) {
                    %>

                    <option
                        value="<%= studentItem.getStudentId() %>"
                        <%= studentItem.getStudentId()
                                == appData.getStudentId()
                                ? "selected"
                                : "" %>>

                        <%= studentItem.getName() %>
                        (ID: <%= studentItem.getStudentId() %>)

                    </option>

                    <%
                            }
                        }
                    %>

                </select>

            </div>


            <!-- APPLICATION DATE -->

            <div class="form-group">

                <label>Application Date</label>

                <input type="date"
                       name="applicationDate"
                       value="<%= appData.getApplicationDate() != null
                               ? appData.getApplicationDate()
                               : "" %>"
                       required>

            </div>


            <!-- STATUS -->

            <div class="form-group">

                <label>Status</label>

                <select name="status" required>

                    <option value="Applied"
                        <%= "Applied".equals(appData.getStatus())
                                ? "selected"
                                : "" %>>
                        Applied
                    </option>

                    <option value="Under Review"
                        <%= "Under Review".equals(appData.getStatus())
                                ? "selected"
                                : "" %>>
                        Under Review
                    </option>

                    <option value="Shortlisted"
                        <%= "Shortlisted".equals(appData.getStatus())
                                ? "selected"
                                : "" %>>
                        Shortlisted
                    </option>

                    <option value="Rejected"
                        <%= "Rejected".equals(appData.getStatus())
                                ? "selected"
                                : "" %>>
                        Rejected
                    </option>

                    <option value="Selected"
                        <%= "Selected".equals(appData.getStatus())
                                ? "selected"
                                : "" %>>
                        Selected
                    </option>

                </select>

            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <button type="submit"
                        class="update-btn">
                    💾 Update Application
                </button>

                <a href="<%= request.getContextPath() %>/ApplicationServlet"
                   class="cancel-btn">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>