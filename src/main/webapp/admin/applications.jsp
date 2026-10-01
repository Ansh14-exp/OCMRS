<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    List<Application> applications =
            (List<Application>) request.getAttribute("applications");

    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    List<Student> students =
            (List<Student>) request.getAttribute("students");

    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Application Management</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
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
            width: 95%;
            max-width: 1300px;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .card h2 {
            margin-top: 0;
            color: #1e3a8a;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 14px;
        }

        .btn {
            margin-top: 20px;
            padding: 11px 20px;
            border: none;
            border-radius: 7px;
            background: #2563eb;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th {
            background: #1e3a8a;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 11px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f8fafc;
        }

        .edit-btn {
            background: #f59e0b;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 5px;
        }

        .delete-btn {
            background: #dc2626;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
        }

        .dashboard-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 16px;
            background: #374151;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 15px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 15px;
        }

        @media (max-width: 800px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            table {
                font-size: 12px;
            }

            th,
            td {
                padding: 8px;
            }
        }

    </style>

</head>

<body>

<div class="header">

    <h1>📄 Application Management</h1>

</div>

<div class="container">

    <a class="dashboard-btn"
       href="<%= request.getContextPath() %>/AdminServlet">
        🏠 Back to Dashboard
    </a>


    <!-- Messages -->

    <% if ("added".equals(message)) { %>

        <div class="success">
            ✅ Application added successfully!
        </div>

    <% } else if ("updated".equals(message)) { %>

        <div class="success">
            ✅ Application updated successfully!
        </div>

    <% } else if ("deleted".equals(message)) { %>

        <div class="success">
            ✅ Application deleted successfully!
        </div>

    <% } else if ("addFailed".equals(message)) { %>

        <div class="error">
            ❌ Failed to add application.
        </div>

    <% } else if ("updateFailed".equals(message)) { %>

        <div class="error">
            ❌ Failed to update application.
        </div>

    <% } else if ("deleteFailed".equals(message)) { %>

        <div class="error">
            ❌ Failed to delete application.
        </div>

    <% } else if ("invalidId".equals(message)) { %>

        <div class="error">
            ❌ Invalid application ID.
        </div>

    <% } else if ("notFound".equals(message)) { %>

        <div class="error">
            ❌ Application not found.
        </div>

    <% } %>


    <!-- ADD APPLICATION -->

    <div class="card">

        <h2>➕ Add Application</h2>

        <form action="<%= request.getContextPath() %>/ApplicationServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">

            <div class="form-grid">

                <div>

                    <label>Job</label>

                    <select name="jobId" required>

                        <option value="">
                            -- Select Job --
                        </option>

                        <%
                            if (jobs != null) {

                                for (Job job : jobs) {
                        %>

                            <option value="<%= job.getJobId() %>">

                                <%= job.getTitle() %>
                                (ID: <%= job.getJobId() %>)

                            </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <div>

                    <label>Student</label>

                    <select name="studentId" required>

                        <option value="">
                            -- Select Student --
                        </option>

                        <%
                            if (students != null) {

                                for (Student student : students) {
                        %>

                            <option value="<%= student.getStudentId() %>">

                                <%= student.getName() %>
                                (ID: <%= student.getStudentId() %>)

                            </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <div>

                    <label>Application Date</label>

                    <input type="date"
                           name="applicationDate"
                           required>

                </div>


                <div>

                    <label>Status</label>

                    <select name="status" required>

                        <option value="Applied">
                            Applied
                        </option>

                        <option value="Under Review">
                            Under Review
                        </option>

                        <option value="Shortlisted">
                            Shortlisted
                        </option>

                        <option value="Rejected">
                            Rejected
                        </option>

                        <option value="Selected">
                            Selected
                        </option>

                    </select>

                </div>

            </div>

            <button class="btn" type="submit">
                Add Application
            </button>

        </form>

    </div>


    <!-- APPLICATION LIST -->

    <div class="card">

        <h2>📋 All Applications</h2>

        <table>

            <tr>

                <th>ID</th>
                <th>Job ID</th>
                <th>Student ID</th>
                <th>Application Date</th>
                <th>Status</th>
                <th>Actions</th>

            </tr>


            <%
                if (applications != null
                        && !applications.isEmpty()) {

                    for (Application app
                            : applications) {
            %>

            <tr>

                <td>
                    <%= app.getApplicationId() %>
                </td>

                <td>
                    <%= app.getJobId() %>
                </td>

                <td>
                    <%= app.getStudentId() %>
                </td>

                <td>
                    <%= app.getApplicationDate() %>
                </td>

                <td>
                    <%= app.getStatus() %>
                </td>

                <td>

                    <a class="edit-btn"
                       href="<%= request.getContextPath() %>/ApplicationServlet?action=edit&applicationId=<%= app.getApplicationId() %>">
                        Edit
                    </a>

                    <a class="delete-btn"
                       href="<%= request.getContextPath() %>/ApplicationServlet?action=delete&applicationId=<%= app.getApplicationId() %>"
                       onclick="return confirm('Are you sure you want to delete this application?');">
                        Delete
                    </a>

                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="6"
                    style="text-align:center; padding:25px;">

                    No applications found.

                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>

</div>

</body>
</html>