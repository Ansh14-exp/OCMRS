<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Result" %>
<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.User" %>

<%
    // ==========================================
    // SESSION CHECK
    // ==========================================

    User user =
            (User) session.getAttribute("user");

    if (user == null ||
        !"FACULTY".equalsIgnoreCase(user.getRole())) {

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
        );

        return;
    }


    // ==========================================
    // GET FACULTY
    // ==========================================

    Faculty faculty =
            (Faculty) session.getAttribute("faculty");

    if (faculty == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/FacultyProfileServlet"
        );

        return;
    }


    // ==========================================
    // GET RESULT LIST
    // ==========================================

    List<Result> resultList =
            (List<Result>) request.getAttribute("resultList");

    if (resultList == null) {
        resultList = new java.util.ArrayList<Result>();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Faculty Results | OCMRS</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            min-height: 100vh;
        }

        /* ==============================
           SIDEBAR
           ============================== */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: #172033;
            color: white;
            padding-top: 25px;
        }

        .logo {
            text-align: center;
            font-size: 23px;
            font-weight: bold;
            margin-bottom: 35px;
        }

        .logo span {
            color: #4f9cff;
        }

        .sidebar a {
            display: block;
            color: #d7dce5;
            text-decoration: none;
            padding: 15px 25px;
            margin: 5px 12px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #263650;
            color: white;
        }

        .sidebar a.active {
            background: #4f9cff;
            color: white;
        }

        .logout {
            position: absolute;
            bottom: 25px;
            left: 12px;
            right: 12px;
        }

        .logout a {
            background: #dc3545;
            color: white;
            text-align: center;
        }

        .logout a:hover {
            background: #bb2d3b;
        }


        /* ==============================
           MAIN CONTENT
           ============================== */

        .main {
            margin-left: 250px;
            padding: 30px;
        }


        /* ==============================
           HEADER
           ============================== */

        .header {
            background: white;
            padding: 22px 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .header h1 {
            color: #172033;
            margin-bottom: 7px;
        }

        .header p {
            color: #6c757d;
        }


        /* ==============================
           RESULT CARD
           ============================== */

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-header h2 {
            color: #172033;
        }

        .count {
            background: #e8f2ff;
            color: #2878d4;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: bold;
        }


        /* ==============================
           TABLE
           ============================== */

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

        thead {
            background: #172033;
            color: white;
        }

        th {
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e9ecef;
            color: #333;
            font-size: 14px;
        }

        tbody tr:hover {
            background: #f7faff;
        }


        /* ==============================
           BADGES
           ============================== */

        .grade {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            background: #e8f7ee;
            color: #198754;
            font-weight: bold;
        }

        .marks {
            font-weight: bold;
            color: #2878d4;
        }


        /* ==============================
           NO RESULT
           ============================== */

        .no-result {
            text-align: center;
            padding: 50px 20px;
            color: #6c757d;
        }

        .no-result .icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .no-result h3 {
            margin-bottom: 8px;
            color: #495057;
        }


        /* ==============================
           RESPONSIVE
           ============================== */

        @media (max-width: 768px) {

            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
                padding: 20px;
            }

            .sidebar a {
                padding: 12px 15px;
            }
        }

    </style>

</head>

<body>


<!-- ==========================================
     SIDEBAR
     ========================================== -->

<div class="sidebar">

    <div class="logo">
        <span>OCMRS</span> Faculty
    </div>


    <a href="<%=request.getContextPath()%>/faculty/dashboard.jsp">
        🏠 Dashboard
    </a>


    <a href="<%=request.getContextPath()%>/FacultyProfileServlet">
        👤 My Profile
    </a>


    <a href="<%=request.getContextPath()%>/FacultySubjectServlet">
        📚 My Subjects
    </a>


    <a href="<%=request.getContextPath()%>/FacultyStudentServlet">
        🎓 Students
    </a>


    <a href="<%=request.getContextPath()%>/FacultyExamServlet">
        📝 Exams
    </a>


    <a class="active"
       href="<%=request.getContextPath()%>/FacultyResultServlet">
        📊 Results
    </a>


    <a href="<%=request.getContextPath()%>/FacultyAttendanceServlet">
        📅 Attendance
    </a>


    <div class="logout">

        <a href="<%=request.getContextPath()%>/LogoutServlet">
            🚪 Logout
        </a>

    </div>

</div>


<!-- ==========================================
     MAIN CONTENT
     ========================================== -->

<div class="main">


    <!-- HEADER -->

    <div class="header">

        <h1>Faculty Results</h1>

        <p>
            View results of students for your assigned subjects.
        </p>

    </div>


    <!-- RESULT CARD -->

    <div class="card">

        <div class="card-header">

            <h2>Student Results</h2>

            <div class="count">
                <%= resultList.size() %> Results
            </div>

        </div>


        <% if (resultList.isEmpty()) { %>


            <!-- NO RESULT -->

            <div class="no-result">

                <div class="icon">
                    📊
                </div>

                <h3>No Results Found</h3>

                <p>
                    No student results are available
                    for your assigned subjects.
                </p>

            </div>


        <% } else { %>


            <!-- RESULT TABLE -->

            <div class="table-container">

                <table>

                    <thead>

    <tr>

        <th>Student Name</th>

        <th>Subject Name</th>

        <th>Exam Type</th>

        <th>Exam Date</th>

        <th>Marks</th>

        <th>Grade</th>

    </tr>

</thead>


<tbody>

<% for (Result result : resultList) { %>

    <tr>

        <td>
            <%= result.getStudentName() %>
        </td>

        <td>
            <%= result.getSubjectName() %>
        </td>

        <td>
            <%= result.getExamType() %>
        </td>

        <td>
            <%= result.getExamDate() %>
        </td>

        <td class="marks">
            <%= result.getMarks() %>
        </td>

        <td>

            <span class="grade">
                <%= result.getGrade() %>
            </span>

        </td>

    </tr>

<% } %>

</tbody>

                </table>

            </div>


        <% } %>

    </div>

</div>

</body>
</html>