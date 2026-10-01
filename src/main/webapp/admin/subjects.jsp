<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Subject" %>

<%
    List<Subject> subjects =
            (List<Subject>) request.getAttribute("subjects");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Subject Management | OCMRS</title>

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

        .header {
            background: #172554;
            color: white;
            padding: 20px 30px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
        }

        .back-btn {
            background: white;
            color: #172554;
            text-decoration: none;

            padding: 10px 18px;

            border-radius: 6px;

            font-weight: bold;
        }

        .container {
            padding: 30px;
        }

        .page-title {
            margin-bottom: 20px;
        }

        .page-title h2 {
            color: #172554;
            margin-bottom: 5px;
        }

        .page-title p {
            color: #666;
        }

        .card {
            background: white;
            border-radius: 12px;

            padding: 25px;
            margin-bottom: 25px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h3 {
            color: #172554;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;

            margin-bottom: 7px;

            color: #444;
        }

        .form-group input {
            padding: 11px;

            border: 1px solid #ccc;

            border-radius: 6px;

            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;

            border-color: #2563eb;
        }

        .add-btn {
            margin-top: 20px;

            background: #2563eb;

            color: white;

            border: none;

            padding: 12px 25px;

            border-radius: 6px;

            cursor: pointer;

            font-size: 15px;

            font-weight: bold;
        }

        .add-btn:hover {
            background: #1d4ed8;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;

            border-collapse: collapse;

            min-width: 700px;
        }

        th {
            background: #172554;

            color: white;

            padding: 13px;

            text-align: left;

            font-size: 14px;
        }

        td {
            padding: 12px;

            border-bottom: 1px solid #ddd;

            font-size: 14px;
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

            font-size: 13px;
        }

        .delete-btn {
            background: #dc2626;

            color: white;

            padding: 7px 12px;

            border-radius: 5px;

            text-decoration: none;

            font-size: 13px;
        }

        .edit-btn:hover {
            background: #d97706;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;

            padding: 30px;

            color: #777;
        }

        .info-box {
            background: #eef2ff;

            border-left: 4px solid #2563eb;

            padding: 12px 15px;

            margin-bottom: 20px;

            color: #374151;
        }

        @media (max-width: 900px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 15px;
            }
        }

    </style>

</head>

<body>


    <!-- HEADER -->

    <div class="header">

        <h1>
            📚 OCMRS - Subject Management
        </h1>

        <a href="<%= request.getContextPath() %>/AdminServlet"
           class="back-btn">

            ← Dashboard

        </a>

    </div>


    <div class="container">

    <%
        String success = (String) request.getAttribute("success");
        String error = (String) request.getAttribute("error");
    %>

    <% if (success != null) { %>

        <div style="
            background:#dcfce7;
            color:#166534;
            padding:12px 15px;
            border-left:4px solid #16a34a;
            border-radius:6px;
            margin-bottom:20px;
            font-weight:bold;
        ">
            ✅ <%= success %>
        </div>

    <% } %>

    <% if (error != null) { %>

        <div style="
            background:#fee2e2;
            color:#991b1b;
            padding:12px 15px;
            border-left:4px solid #dc2626;
            border-radius:6px;
            margin-bottom:20px;
            font-weight:bold;
        ">
            ❌ <%= error %>
        </div>

    <% } %>
    
        <!-- PAGE TITLE -->

        <div class="page-title">

            <h2>
                Subject Management
            </h2>

            <p>
                Add, view, edit and manage course subjects.
            </p>

        </div>


        <!-- ADD SUBJECT -->

        <div class="card">

            <h3>
                ➕ Add New Subject
            </h3>


            <div class="info-box">

                Enter the <b>Course ID</b> for which this
                subject belongs.

            </div>


            <form action="<%= request.getContextPath() %>/SubjectServlet"
                  method="post">


                <input type="hidden"
                       name="action"
                       value="add">


                <div class="form-grid">


                    <!-- COURSE ID -->

                    <div class="form-group">

                        <label>
                            Course ID
                        </label>

                        <input type="number"
                               name="courseId"
                               placeholder="Enter Course ID"
                               required>

                    </div>


                    <!-- SUBJECT NAME -->

                    <div class="form-group">

                        <label>
                            Subject Name
                        </label>

                        <input type="text"
                               name="subjectName"
                               placeholder="Enter subject name"
                               required>

                    </div>


                    <!-- CREDITS -->

                    <div class="form-group">

                        <label>
                            Credits
                        </label>

                        <input type="number"
                               name="credits"
                               placeholder="Enter credits"
                               min="1"
                               max="10"
                               required>

                    </div>


                </div>


                <button type="submit"
                        class="add-btn">

                    ➕ Add Subject

                </button>


            </form>

        </div>


        <!-- SUBJECT LIST -->

        <div class="card">

            <h3>
                📋 All Subjects
            </h3>


            <div class="table-container">

                <table>


                    <thead>

                        <tr>

                            <th>
                                Subject ID
                            </th>

                            <th>
                                Course ID
                            </th>

                            <th>
                                Subject Name
                            </th>

                            <th>
                                Credits
                            </th>

                            <th>
                                Actions
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                    <%
                        if (subjects != null &&
                            !subjects.isEmpty()) {

                            for (Subject subject : subjects) {
                    %>


                        <tr>


                            <td>
                                <%= subject.getSubjectId() %>
                            </td>


                            <td>
                                <%= subject.getCourseId() %>
                            </td>


                            <td>
                                <%= subject.getSubjectName() %>
                            </td>


                            <td>
                                <%= subject.getCredits() %>
                            </td>


                            <td>


                                <a class="edit-btn"
                                   href="<%= request.getContextPath() %>/SubjectServlet?action=edit&subjectId=<%= subject.getSubjectId() %>">

                                    Edit

                                </a>


                                <a class="delete-btn"
                                   href="<%= request.getContextPath() %>/SubjectServlet?action=delete&subjectId=<%= subject.getSubjectId() %>"
                                   onclick="return confirm('Are you sure you want to delete this subject?');">

                                    Delete

                                </a>


                            </td>


                        </tr>


                    <%
                            }

                        } else {
                    %>


                        <tr>

                            <td colspan="5"
                                class="empty">

                                No subjects found.

                            </td>

                        </tr>


                    <%
                        }
                    %>


                    </tbody>


                </table>

            </div>

        </div>


    </div>

</body>

</html>