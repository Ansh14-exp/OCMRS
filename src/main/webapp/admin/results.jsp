<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="com.ocmrs.model.Result" %>
<%@ page import="com.ocmrs.model.Exam" %>
<%@ page import="com.ocmrs.model.Student" %>


<%
    List<Result> results =
        (List<Result>) request.getAttribute("results");

    List<Exam> exams =
        (List<Exam>) request.getAttribute("exams");

    List<Student> students =
        (List<Student>) request.getAttribute("students");


    String success =
        (String) request.getAttribute("success");

    String error =
        (String) request.getAttribute("error");
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Result Management | OCMRS</title>


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


.dashboard-btn {
    background: white;
    color: #172554;

    text-decoration: none;

    padding: 10px 18px;

    border-radius: 6px;

    font-weight: bold;
}


.container {
    max-width: 1200px;

    margin: 35px auto;

    padding: 0 20px;
}


.message {
    padding: 13px 16px;

    border-radius: 7px;

    margin-bottom: 20px;

    font-weight: bold;
}


.success {
    background: #dcfce7;

    color: #166534;

    border-left: 5px solid #22c55e;
}


.error {
    background: #fee2e2;

    color: #991b1b;

    border-left: 5px solid #ef4444;
}


.card {
    background: white;

    padding: 25px;

    border-radius: 12px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.08);

    margin-bottom: 30px;
}


.card h2 {
    color: #172554;

    margin-bottom: 20px;
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

    color: #444;
}


.form-group input,
.form-group select {

    padding: 11px;

    border: 1px solid #ccc;

    border-radius: 6px;

    font-size: 14px;

    background: white;
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

    font-weight: bold;
}


.add-btn:hover {
    background: #1d4ed8;
}


.table-wrapper {
    overflow-x: auto;
}


table {
    width: 100%;

    border-collapse: collapse;
}


th {

    background: #172554;

    color: white;

    padding: 13px;

    text-align: center;
}


td {

    padding: 12px;

    border-bottom: 1px solid #ddd;

    text-align: center;
}


tr:hover {
    background: #f8fafc;
}


.edit-btn {

    display: inline-block;

    background: #f59e0b;

    color: white;

    text-decoration: none;

    padding: 7px 12px;

    border-radius: 5px;

    font-size: 13px;

    margin-right: 5px;
}


.edit-btn:hover {
    background: #d97706;
}


.delete-btn {

    display: inline-block;

    background: #dc2626;

    color: white;

    text-decoration: none;

    padding: 7px 12px;

    border-radius: 5px;

    font-size: 13px;
}


.delete-btn:hover {
    background: #b91c1c;
}


.no-data {

    text-align: center;

    padding: 25px;

    color: #777;
}


@media (max-width: 700px) {

    .form-grid {
        grid-template-columns: 1fr;
    }

    .header {
        padding: 15px;
    }

    .header h1 {
        font-size: 18px;
    }

    .container {
        margin: 20px auto;
    }

}

</style>

</head>


<body>


<!-- HEADER -->

<div class="header">

    <h1>📊 OCMRS - Result Management</h1>

    <a href="<%= request.getContextPath() %>/AdminServlet"
       class="dashboard-btn">

        🏠 Dashboard

    </a>

</div>


<div class="container">


<!-- SUCCESS -->

<% if (success != null) { %>

    <div class="message success">

        ✅ <%= success %>

    </div>

<% } %>


<!-- ERROR -->

<% if (error != null) { %>

    <div class="message error">

        ❌ <%= error %>

    </div>

<% } %>


<!-- ADD RESULT -->

<div class="card">

    <h2>➕ Add New Result</h2>


    <form action="<%= request.getContextPath() %>/ResultServlet"
          method="post">


        <input type="hidden"
               name="action"
               value="add">


        <div class="form-grid">


            <!-- EXAM -->

            <div class="form-group">

                <label>Exam</label>

                <select name="examId" required>

                    <option value="">
                        -- Select Exam --
                    </option>


                    <% if (exams != null) { %>

                        <% for (Exam exam : exams) { %>

                            <option value="<%= exam.getExamId() %>">

                                Exam <%= exam.getExamId() %>
                                -
                                <%= exam.getExamType() %>
                                -
                                <%= exam.getExamDate() %>

                            </option>

                        <% } %>

                    <% } %>

                </select>

            </div>


            <!-- STUDENT -->

            <div class="form-group">

                <label>Student</label>

                <select name="studentId" required>

                    <option value="">
                        -- Select Student --
                    </option>


                    <% if (students != null) { %>

                        <% for (Student student : students) { %>

                            <option value="<%= student.getStudentId() %>">

                                <%= student.getName() %>
                                -
                                ID:
                                <%= student.getStudentId() %>

                            </option>

                        <% } %>

                    <% } %>

                </select>

            </div>


            <!-- MARKS -->

            <div class="form-group">

                <label>Marks</label>

                <input type="number"
                       name="marks"
                       min="0"
                       step="0.01"
                       placeholder="Enter Marks"
                       required>

            </div>


            <!-- GRADE -->

            <div class="form-group">

                <label>Grade</label>

                <select name="grade" required>

                    <option value="">
                        -- Select Grade --
                    </option>

                    <option value="A+">A+</option>

                    <option value="A">A</option>

                    <option value="B+">B+</option>

                    <option value="B">B</option>

                    <option value="C">C</option>

                    <option value="D">D</option>

                    <option value="F">F</option>

                </select>

            </div>


        </div>


        <button type="submit"
                class="add-btn">

            ➕ Add Result

        </button>


    </form>

</div>


<!-- ALL RESULTS -->

<div class="card">

    <h2>📋 All Student Results</h2>


    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>Result ID</th>

                    <th>Exam ID</th>

                    <th>Student ID</th>

                    <th>Marks</th>

                    <th>Grade</th>

                    <th>Actions</th>

                </tr>

            </thead>


            <tbody>


            <% if (results != null &&
                   !results.isEmpty()) { %>


                <% for (Result result : results) { %>


                    <tr>


                        <td>
                            <%= result.getResultId() %>
                        </td>


                        <td>
                            <%= result.getExamId() %>
                        </td>


                        <td>
                            <%= result.getStudentId() %>
                        </td>


                        <td>
                            <%= result.getMarks() %>
                        </td>


                        <td>
                            <%= result.getGrade() %>
                        </td>


                        <td>


                            <a href="<%= request.getContextPath() %>/ResultServlet?action=edit&resultId=<%= result.getResultId() %>"
                               class="edit-btn">

                                ✏️ Edit

                            </a>


                            <a href="<%= request.getContextPath() %>/ResultServlet?action=delete&resultId=<%= result.getResultId() %>"
                               class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this result?');">

                                🗑️ Delete

                            </a>


                        </td>


                    </tr>


                <% } %>


            <% } else { %>


                <tr>

                    <td colspan="6"
                        class="no-data">

                        No results found.

                    </td>

                </tr>


            <% } %>


            </tbody>

        </table>

    </div>

</div>


</div>

</body>

</html>