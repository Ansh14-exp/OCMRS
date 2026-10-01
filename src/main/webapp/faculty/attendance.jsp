<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Attendance" %>
<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.Subject" %>

<%
    Faculty faculty =
            (Faculty) session.getAttribute("faculty");

    if (faculty == null) {
        response.sendRedirect(
            request.getContextPath()
            + "/FacultyProfileServlet"
        );
        return;
    }

    List<Attendance> attendanceList =
            (List<Attendance>) request.getAttribute("attendanceList");

    List<Student> studentList =
            (List<Student>) request.getAttribute("studentList");

    List<Subject> subjectList =
            (List<Subject>) request.getAttribute("subjectList");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Faculty Attendance | OCMRS</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

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

        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 240px;
            height: 100vh;
            background: #172554;
            padding: 25px 15px;
            color: white;
        }

        .logo {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 35px;
        }

        .logo span {
            color: #38bdf8;
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: #dbeafe;
            padding: 13px 15px;
            margin: 7px 0;
            border-radius: 8px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #2563eb;
            color: white;
        }

        .sidebar a.active {
            background: #2563eb;
            color: white;
        }

        /* ================= MAIN ================= */

        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .header {
            background: white;
            padding: 22px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .header h1 {
            font-size: 26px;
            margin-bottom: 6px;
        }

        .header p {
            color: #64748b;
        }

        /* ================= FORM CARD ================= */

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card h2 {
            margin-bottom: 20px;
            color: #172554;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #334155;
        }

        .form-group select,
        .form-group input {
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        .form-group select:focus,
        .form-group input:focus {
            border-color: #2563eb;
        }

        .button-area {
            margin-top: 22px;
        }

        .btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 7px;
            font-size: 15px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        /* ================= MESSAGE ================= */

        .success {
            background: #dcfce7;
            color: #166534;
            padding: 13px 16px;
            border-radius: 7px;
            margin-bottom: 20px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 13px 16px;
            border-radius: 7px;
            margin-bottom: 20px;
        }

        /* ================= TABLE ================= */

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th {
            background: #172554;
            color: white;
            padding: 13px;
            text-align: left;
        }

        table td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
        }

        table tr:hover {
            background: #f8fafc;
        }

        .present {
            color: #15803d;
            font-weight: bold;
        }

        .absent {
            color: #dc2626;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width: 800px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        OCM<span>RS</span>
    </div>

    <a href="<%= request.getContextPath() %>/faculty/dashboard.jsp">
        Dashboard
    </a>

    <a href="<%= request.getContextPath() %>/FacultyProfileServlet">
        My Profile
    </a>

    <a href="<%= request.getContextPath() %>/FacultySubjectServlet">
        My Subjects
    </a>

    <a href="<%= request.getContextPath() %>/FacultyStudentServlet">
        Students
    </a>

    <a href="<%= request.getContextPath() %>/FacultyExamServlet">
        Exams
    </a>

    <a href="<%= request.getContextPath() %>/FacultyResultServlet">
        Results
    </a>

    <a class="active"
       href="<%= request.getContextPath() %>/FacultyAttendanceServlet">
        Attendance
    </a>

    <a href="<%= request.getContextPath() %>/LogoutServlet">
        Logout
    </a>

</div>


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- HEADER -->

    <div class="header">

        <h1>Attendance Management</h1>

        <p>
            Welcome, <strong><%= faculty.getName() %></strong>
            — Manage student attendance
        </p>

    </div>


    <!-- ================= MESSAGE ================= -->

    <%
        String success =
                request.getParameter("success");

        String error =
                request.getParameter("error");

        if ("added".equals(success)) {
    %>

        <div class="success">
            Attendance marked successfully!
        </div>

    <%
        }

        if ("missing".equals(error)) {
    %>

        <div class="error">
            Please fill all attendance fields.
        </div>

    <%
        }

        if ("invalid".equals(error)) {
    %>

        <div class="error">
            Invalid student or subject selected.
        </div>

    <%
        }

        if ("failed".equals(error)) {
    %>

        <div class="error">
            Failed to mark attendance. Please try again.
        </div>

    <%
        }
    %>


    <!-- ================= MARK ATTENDANCE ================= -->

    <div class="card">

        <h2>Mark Attendance</h2>

        <form method="post"
              action="<%= request.getContextPath() %>/FacultyAttendanceServlet">

            <div class="form-grid">

                <!-- STUDENT -->

                <div class="form-group">

                    <label for="studentId">
                        Select Student
                    </label>

                    <select id="studentId"
                            name="studentId"
                            required>

                        <option value="">
                            -- Select Student --
                        </option>

                        <%
                            if (studentList != null) {

                                for (Student student : studentList) {
                        %>

                        <option value="<%= student.getStudentId() %>">
                            <%= student.getName() %>
                        </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <!-- SUBJECT -->

                <div class="form-group">

                    <label for="subjectId">
                        Select Subject
                    </label>

                    <select id="subjectId"
                            name="subjectId"
                            required>

                        <option value="">
                            -- Select Subject --
                        </option>

                        <%
                            if (subjectList != null) {

                                for (Subject subject : subjectList) {
                        %>

                        <option value="<%= subject.getSubjectId() %>">
                            <%= subject.getSubjectName() %>
                        </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <!-- DATE -->

                <div class="form-group">

                    <label for="attendanceDate">
                        Attendance Date
                    </label>

                    <input type="date"
                           id="attendanceDate"
                           name="attendanceDate"
                           required>

                </div>


                <!-- STATUS -->

                <div class="form-group">

                    <label for="status">
                        Attendance Status
                    </label>

                    <select id="status"
                            name="status"
                            required>

                        <option value="">
                            -- Select Status --
                        </option>

                        <option value="Present">
                            Present
                        </option>

                        <option value="Absent">
                            Absent
                        </option>

                    </select>

                </div>

            </div>


            <div class="button-area">

                <button type="submit"
                        class="btn">
                    Mark Attendance
                </button>

            </div>

        </form>

    </div>


    <!-- ================= ATTENDANCE RECORDS ================= -->

    <div class="card">

        <h2>Attendance Records</h2>

        <div class="table-container">

            <table>

                <thead>

                    <tr>
                        <th>Student Name</th>
                        <th>Subject</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    if (attendanceList != null &&
                        !attendanceList.isEmpty()) {

                        for (Attendance attendance :
                                attendanceList) {
                %>

                    <tr>

                        <td>
                            <%= attendance.getStudentName() %>
                        </td>

                        <td>
                            <%= attendance.getSubjectName() %>
                        </td>

                        <td>
                            <%= attendance.getAttendanceDate() %>
                        </td>

                        <td>

                            <%
                                if ("Present".equalsIgnoreCase(
                                        attendance.getStatus())) {
                            %>

                                <span class="present">
                                    Present
                                </span>

                            <%
                                } else {
                            %>

                                <span class="absent">
                                    <%= attendance.getStatus() %>
                                </span>

                            <%
                                }
                            %>

                        </td>

                    </tr>

                <%
                        }

                    } else {
                %>

                    <tr>

                        <td colspan="4"
                            class="empty">

                            No Attendance Records Found

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