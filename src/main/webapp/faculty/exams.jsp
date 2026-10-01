<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Exam" %>
<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null ||
        !"FACULTY".equalsIgnoreCase(user.getRole())) {

        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    Faculty faculty =
        (Faculty) session.getAttribute("faculty");

    if (faculty == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/FacultyProfileServlet"
        );

        return;
    }

    List<Exam> examList =
        (List<Exam>) request.getAttribute("examList");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Faculty Exams - OCMRS</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;

            background: #172554;
            color: white;

            padding: 25px 15px;
        }

        .logo {
            text-align: center;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .faculty-title {
            text-align: center;
            color: #cbd5e1;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;

            text-decoration: none;
            color: white;

            padding: 13px 15px;
            margin: 6px 0;

            border-radius: 8px;

            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #2563eb;
        }

        .sidebar a.active {
            background: #2563eb;
        }

        .logout {
            margin-top: 25px;
            background: #dc2626;
        }

        .logout:hover {
            background: #b91c1c !important;
        }


        /* ================= MAIN ================= */

        .main {
            margin-left: 250px;
            width: calc(100% - 250px);

            padding: 35px;
        }

        .header {
            margin-bottom: 25px;
        }

        .header h1 {
            color: #172554;
            font-size: 30px;
            margin-bottom: 8px;
        }

        .header p {
            color: #64748b;
        }


        /* ================= CARD ================= */

        .card {
            background: white;

            border-radius: 12px;

            padding: 25px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.08);

            overflow-x: auto;
        }


        /* ================= TABLE ================= */

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #172554;
            color: white;

            padding: 14px;

            text-align: left;
        }

        td {
            padding: 14px;

            border-bottom:
                1px solid #e5e7eb;

            color: #334155;
        }

        tr:hover {
            background: #f8fafc;
        }


        /* ================= BADGE ================= */

        .badge {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 15px;

            background: #dbeafe;
            color: #1d4ed8;

            font-size: 13px;
            font-weight: bold;
        }


        /* ================= EMPTY ================= */

        .empty {
            text-align: center;

            padding: 45px;

            color: #64748b;

            font-size: 16px;
        }

    </style>

</head>


<body>


    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar">

        <div class="logo">
            OCMRS
        </div>

        <div class="faculty-title">
            Faculty Panel
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


        <a href="<%= request.getContextPath() %>/FacultyExamServlet"
           class="active">
            Exams
        </a>


        <a href="<%= request.getContextPath() %>/FacultyResultServlet">
            Results
        </a>


        <a href="<%= request.getContextPath() %>/FacultyAttendanceServlet">
            Attendance
        </a>


        <a href="<%= request.getContextPath() %>/LogoutServlet"
           class="logout">
            Logout
        </a>

    </div>


    <!-- ================= MAIN CONTENT ================= -->

    <div class="main">

        <div class="header">

            <h1>My Exams</h1>

            <p>
                Exams scheduled for your assigned subjects
            </p>

        </div>


        <div class="card">

            <%
                if (examList != null &&
                    !examList.isEmpty()) {
            %>


            <table>

                <thead>

                    <tr>

                        <th>Exam ID</th>

                        <th>Subject ID</th>

                        <th>Exam Type</th>

                        <th>Exam Date</th>

                        <th>Total Marks</th>

                    </tr>

                </thead>


                <tbody>

                <%
                    for (Exam exam : examList) {
                %>

                    <tr>

                        <td>
                            <%= exam.getExamId() %>
                        </td>

                        <td>
                            <%= exam.getSubjectId() %>
                        </td>

                        <td>

                            <span class="badge">
                                <%= exam.getExamType() %>
                            </span>

                        </td>

                        <td>
                            <%= exam.getExamDate() %>
                        </td>

                        <td>
                            <%= exam.getTotalMarks() %>
                        </td>

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>


            <%
                } else {
            %>


                <div class="empty">

                    No exams found for your assigned subjects.

                </div>


            <%
                }
            %>

        </div>

    </div>


</body>

</html>