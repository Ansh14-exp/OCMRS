<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Application" %>

<%
    List<Interview> interviews =
            (List<Interview>) request.getAttribute("interviews");

    List<Application> applications =
            (List<Application>) request.getAttribute("applications");

    if (interviews == null) {
        interviews = new java.util.ArrayList<>();
    }

    if (applications == null) {
        applications = new java.util.ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Interview Management</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        .container {
            width: 95%;
            max-width: 1400px;
            margin: 30px auto;
        }

        .header {
            background: linear-gradient(135deg, #182848, #4b6cb7);
            color: white;
            padding: 25px 30px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 8px;
        }

        .header p {
            opacity: 0.9;
        }

        .card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .card h2 {
            margin-bottom: 20px;
            color: #182848;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 7px;
        }

        .form-group input,
        .form-group select {
            padding: 11px 13px;
            border: 1px solid #ccd3df;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #4b6cb7;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .add-btn {
            margin-top: 20px;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            background: #4b6cb7;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-btn:hover {
            background: #182848;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }

        th {
            background: #182848;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 13px 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f8faff;
        }

        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #e8eefc;
            color: #294a9b;
            font-size: 13px;
            font-weight: bold;
        }

        .result-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #eaf7ee;
            color: #218838;
            font-size: 13px;
            font-weight: bold;
        }

        .edit-btn,
        .delete-btn {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
            margin-right: 5px;
        }

        .edit-btn {
            background: #e7f0ff;
            color: #2463c5;
        }

        .delete-btn {
            background: #ffe8e8;
            color: #d32f2f;
        }

        .empty {
            text-align: center;
            padding: 35px;
            color: #777;
        }

        @media (max-width: 700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                width: 92%;
            }

        }

    </style>

</head>

<body>

<div class="container">

    <!-- HEADER -->
    <div class="header">

        <h1>Interview Management</h1>

        <p>
            Schedule and manage student interviews
        </p>

    </div>


    <!-- ADD INTERVIEW -->
    <div class="card">

        <h2>Schedule New Interview</h2>

        <form action="<%= request.getContextPath() %>/InterviewServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">

            <div class="form-grid">

                <!-- APPLICATION -->
                <div class="form-group full-width">

                    <label>
                        Select Application
                    </label>

                    <select name="applicationId"
                            required>

                        <option value="">
                            -- Select Application --
                        </option>

                        <% for (Application app : applications) { %>

                            <option value="<%= app.getApplicationId() %>">

                                #APP<%= app.getApplicationId() %>
                                -
                                <%= app.getJobTitle() %>
                                -
                                <%= app.getCompanyName() %>

                            </option>

                        <% } %>

                    </select>

                </div>


                <!-- DATE -->
                <div class="form-group">

                    <label>
                        Interview Date & Time
                    </label>

                    <input type="datetime-local"
                           name="interviewDate"
                           required>

                </div>


                <!-- MODE -->
                <div class="form-group">

                    <label>
                        Interview Mode
                    </label>

                    <select name="mode"
                            required>

                        <option value="">
                            -- Select Mode --
                        </option>

                        <option value="Online">
                            Online
                        </option>

                        <option value="Offline">
                            Offline
                        </option>

                        <option value="Hybrid">
                            Hybrid
                        </option>

                    </select>

                </div>


                <!-- RESULT -->
                <div class="form-group">

                    <label>
                        Result
                    </label>

                    <select name="result">

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


            <button type="submit"
                    class="add-btn">

                + Schedule Interview

            </button>

        </form>

    </div>


    <!-- INTERVIEW LIST -->
    <div class="card">

        <h2>All Interviews</h2>

        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Application</th>

                        <th>Interview Date</th>

                        <th>Mode</th>

                        <th>Result</th>

                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

                <% if (interviews.isEmpty()) { %>

                    <tr>

                        <td colspan="6"
                            class="empty">

                            No interviews scheduled yet.

                        </td>

                    </tr>

                <% } else { %>


                    <% for (Interview interview : interviews) { %>

                        <tr>

                            <td>
                                #<%= interview.getInterviewId() %>
                            </td>


                            <td>

                                <span class="badge">

                                    #APP<%= interview.getApplicationId() %>

                                </span>

                            </td>


                            <td>

                                <%= interview.getInterviewDate() %>

                            </td>


                            <td>

                                <%= interview.getMode() %>

                            </td>


                            <td>

                                <span class="result-badge">

                                    <%= interview.getResult() %>

                                </span>

                            </td>


                            <td>

                                <a class="edit-btn"
                                   href="<%= request.getContextPath() %>/InterviewServlet?action=edit&interviewId=<%= interview.getInterviewId() %>">

                                    Edit

                                </a>


                                <a class="delete-btn"
                                   href="<%= request.getContextPath() %>/InterviewServlet?action=delete&interviewId=<%= interview.getInterviewId() %>"
                                   onclick="return confirm('Are you sure you want to delete this interview?');">

                                    Delete

                                </a>

                            </td>

                        </tr>

                    <% } %>

                <% } %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>