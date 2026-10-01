<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Result" %>

<%
    List<Result> results =
        (List<Result>) request.getAttribute("results");

    if (results == null) {
        response.sendRedirect(
            request.getContextPath() + "/ResultServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>My Results - OCMRS</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;

            width: 240px;
            height: 100vh;

            background: linear-gradient(
                180deg,
                #667eea,
                #764ba2
            );

            padding-top: 25px;

            box-shadow: 3px 0 15px rgba(0,0,0,0.12);

            overflow-y: auto;
        }

        .logo {
            text-align: center;
            color: white;

            margin-bottom: 25px;
            padding-bottom: 20px;

            border-bottom:
                1px solid rgba(255,255,255,0.2);
        }

        .logo h2 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 13px;
            opacity: 0.85;
        }

        .sidebar a {
            display: block;

            color: white;
            text-decoration: none;

            padding: 14px 22px;
            margin: 5px 12px;

            border-radius: 8px;

            font-size: 15px;

            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255,255,255,0.18);
            transform: translateX(4px);
        }

        .sidebar a.active {
            background: rgba(255,255,255,0.25);
            font-weight: bold;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.12);
        }

        /* ================= MAIN CONTENT ================= */

        .main-content {
            margin-left: 240px;
            padding: 40px;

            min-height: 100vh;
        }

        .header {
            background: linear-gradient(
                135deg,
                #1e3c72,
                #2a5298
            );

            color: white;

            padding: 25px 35px;

            border-radius: 15px;

            margin-bottom: 30px;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.15);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 6px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        /* ================= CARD ================= */

        .card {
            background: white;

            border-radius: 12px;

            padding: 25px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            margin-bottom: 20px;

            color: #1e3c72;
        }

        /* ================= TABLE ================= */

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;

            border-collapse: collapse;

            min-width: 750px;
        }

        th {
            background: #1e3c72;

            color: white;

            padding: 14px;

            text-align: center;
        }

        td {
            padding: 13px;

            text-align: center;

            border-bottom:
                1px solid #ddd;
        }

        tr:hover {
            background: #f5f8ff;
        }

        .grade {
            font-weight: bold;
            color: #1e3c72;
        }

        .marks {
            font-weight: bold;
        }

        /* ================= NO RESULT ================= */

        .no-result {
            text-align: center;

            padding: 35px;

            color: #777;

            font-size: 17px;
        }

        /* ================= BACK BUTTON ================= */

        .back-btn {
            display: inline-block;

            margin-top: 20px;

            padding: 10px 18px;

            background: #1e3c72;

            color: white;

            text-decoration: none;

            border-radius: 6px;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #2a5298;

            transform: translateY(-2px);
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 25px;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;
                height: auto;
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .sidebar a {
                display: inline-block;
                width: auto;
            }
        }

    </style>

</head>

<body>


<!-- =====================================================
     SIDEBAR
     ===================================================== -->

<div class="sidebar">

    <div class="logo">

        <h2>OCMRS</h2>

        <p>Student Portal</p>

    </div>


    <a href="<%= request.getContextPath() %>/student/dashboard.jsp">

        🏠 Dashboard

    </a>


    <a href="<%= request.getContextPath() %>/StudentServlet">

        👤 Profile

    </a>


    <a href="<%= request.getContextPath() %>/EnrollmentServlet">

        📚 Enrollment

    </a>


    <a href="<%= request.getContextPath() %>/SubjectServlet">

        📖 Subjects

    </a>


    <a href="<%= request.getContextPath() %>/ExamServlet">

        📝 Exams

    </a>


    <a href="<%= request.getContextPath() %>/ResultServlet"
       class="active">

        📊 Results

    </a>


    <a href="<%= request.getContextPath() %>/JobServlet">

        💼 Jobs

    </a>


    <a href="<%= request.getContextPath() %>/ApplicationServlet">

        📨 Apply Job

    </a>


    <a href="<%= request.getContextPath() %>/ApplicationServlet">

        📄 Applications

    </a>


    <a href="<%= request.getContextPath() %>/PlacementServlet">

        🎓 Placement

    </a>


    <a href="<%= request.getContextPath() %>/LogoutServlet">

        🚪 Logout

    </a>

</div>


<!-- =====================================================
     MAIN CONTENT
     ===================================================== -->

<div class="main-content">


    <!-- HEADER -->

    <div class="header">

        <h1>📊 My Results</h1>

        <p>
            View your examination results
        </p>

    </div>


    <!-- RESULTS CARD -->

    <div class="card">

        <h2>Examination Results</h2>


        <% if (results.isEmpty()) { %>


            <div class="no-result">

                No results available yet.

            </div>


        <% } else { %>


            <div class="table-container">

                <table>

                    <thead>

                        <tr>

                            <th>Result ID</th>

                            <th>Exam ID</th>

                            <th>Student ID</th>

                            <th>Marks</th>

                            <th>Grade</th>

                        </tr>

                    </thead>


                    <tbody>

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

                                <td class="marks">
                                    <%= result.getMarks() %>
                                </td>

                                <td class="grade">
                                    <%= result.getGrade() %>
                                </td>

                            </tr>

                        <% } %>

                    </tbody>

                </table>

            </div>


        <% } %>


        <!-- BACK BUTTON -->

        <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
           class="back-btn">

            ← Back to Dashboard

        </a>


    </div>

</div>


</body>
</html>