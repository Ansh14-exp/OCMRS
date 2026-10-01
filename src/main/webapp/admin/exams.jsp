<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Exam" %>

<%
    List<Exam> exams =
            (List<Exam>) request.getAttribute("exams");

    String success =
            (String) request.getAttribute("success");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Exam Management | OCMRS</title>

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

        /* HEADER */

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

        /* PAGE TITLE */

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

        /* CARD */

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

        /* MESSAGE */

        .success {
            background: #dcfce7;

            color: #166534;

            padding: 12px 15px;

            border-left: 4px solid #16a34a;

            border-radius: 6px;

            margin-bottom: 20px;

            font-weight: bold;
        }

        .error {
            background: #fee2e2;

            color: #991b1b;

            padding: 12px 15px;

            border-left: 4px solid #dc2626;

            border-radius: 6px;

            margin-bottom: 20px;

            font-weight: bold;
        }

        /* INFO */

        .info-box {
            background: #eef2ff;

            border-left: 4px solid #2563eb;

            padding: 12px 15px;

            margin-bottom: 20px;

            color: #374151;
        }

        /* FORM */

        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

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

        .form-group input,
        .form-group select {

            padding: 11px;

            border: 1px solid #ccc;

            border-radius: 6px;

            font-size: 14px;
        }

        .form-group input:focus,
        .form-group select:focus {

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

        /* TABLE */

        .table-container {
            overflow-x: auto;
        }

        table {

            width: 100%;

            border-collapse: collapse;

            min-width: 750px;
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

        /* BUTTONS */

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

        /* RESPONSIVE */

        @media (max-width: 1000px) {

            .form-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 600px) {

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
        📝 OCMRS - Exam Management
    </h1>

    <a href="<%= request.getContextPath() %>/AdminServlet"
       class="back-btn">

        ← Dashboard

    </a>

</div>


<div class="container">


    <!-- SUCCESS MESSAGE -->

    <% if (success != null) { %>

        <div class="success">

            ✅ <%= success %>

        </div>

    <% } %>


    <!-- ERROR MESSAGE -->

    <% if (error != null) { %>

        <div class="error">

            ❌ <%= error %>

        </div>

    <% } %>


    <!-- PAGE TITLE -->

    <div class="page-title">

        <h2>
            Exam Management
        </h2>

        <p>
            Add, view, edit and manage examinations.
        </p>

    </div>


    <!-- ADD EXAM -->

    <div class="card">

        <h3>
            ➕ Add New Exam
        </h3>


        <div class="info-box">

            Enter the <b>Subject ID</b> for which this
            examination is scheduled.

        </div>


        <form action="<%= request.getContextPath() %>/ExamServlet"
              method="post">


            <input type="hidden"
                   name="action"
                   value="add">


            <div class="form-grid">


                <!-- SUBJECT ID -->

                <div class="form-group">

                    <label>
                        Subject ID
                    </label>

                    <input type="number"
                           name="subjectId"
                           placeholder="Enter Subject ID"
                           min="1"
                           required>

                </div>


                <!-- EXAM TYPE -->

                <div class="form-group">

                    <label>
                        Exam Type
                    </label>

                    <input type="text"
                           name="examType"
                           placeholder="e.g. Mid Semester"
                           required>

                </div>


                <!-- EXAM DATE -->

                <div class="form-group">

                    <label>
                        Exam Date
                    </label>

                    <input type="date"
                           name="examDate"
                           required>

                </div>


                <!-- TOTAL MARKS -->

                <div class="form-group">

                    <label>
                        Total Marks
                    </label>

                    <input type="number"
                           name="totalMarks"
                           placeholder="e.g. 50"
                           min="1"
                           required>

                </div>


            </div>


            <button type="submit"
                    class="add-btn">

                ➕ Add Exam

            </button>


        </form>

    </div>


    <!-- EXAM LIST -->

    <div class="card">

        <h3>
            📋 All Exams
        </h3>


        <div class="table-container">

            <table>

                <thead>

                    <tr>

                        <th>
                            Exam ID
                        </th>

                        <th>
                            Subject ID
                        </th>

                        <th>
                            Exam Type
                        </th>

                        <th>
                            Exam Date
                        </th>

                        <th>
                            Total Marks
                        </th>

                        <th>
                            Actions
                        </th>

                    </tr>

                </thead>


                <tbody>


                <%
                    if (exams != null &&
                        !exams.isEmpty()) {

                        for (Exam exam : exams) {
                %>


                    <tr>

                        <td>
                            <%= exam.getExamId() %>
                        </td>

                        <td>
                            <%= exam.getSubjectId() %>
                        </td>

                        <td>
                            <%= exam.getExamType() %>
                        </td>

                        <td>
                            <%= exam.getExamDate() %>
                        </td>

                        <td>
                            <%= exam.getTotalMarks() %>
                        </td>

                        <td>

                            <a class="edit-btn"
                               href="<%= request.getContextPath() %>/ExamServlet?action=edit&examId=<%= exam.getExamId() %>">

                                Edit

                            </a>


                            <a class="delete-btn"
                               href="<%= request.getContextPath() %>/ExamServlet?action=delete&examId=<%= exam.getExamId() %>"
                               onclick="return confirm('Are you sure you want to delete this exam?');">

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
                            class="empty">

                            No exams found.

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