<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Subject" %>
<%@ page import="com.ocmrs.model.Faculty" %>

<%
    Faculty faculty =
        (Faculty) request.getAttribute("faculty");

    List<Subject> subjectList =
        (List<Subject>) request.getAttribute("subjectList");

    if (faculty == null) {
        response.sendRedirect(
            request.getContextPath()
            + "/FacultyProfileServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>My Subjects | OCMRS</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: #172033;
            padding: 25px 15px;
        }

        .logo {
            color: white;
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 35px;
        }

        .logo span {
            color: #4facfe;
        }

        .menu a {
            display: block;
            text-decoration: none;
            color: #cbd5e1;
            padding: 13px 16px;
            margin: 6px 0;
            border-radius: 8px;
            transition: 0.3s;
        }

        .menu a:hover,
        .menu a.active {
            background: #2563eb;
            color: white;
        }

        .logout {
            margin-top: 25px;
            color: #ff8b8b !important;
        }

        .main {
            margin-left: 250px;
            padding: 35px;
        }

        .header {
            margin-bottom: 25px;
        }

        .header h1 {
            font-size: 28px;
            color: #172033;
        }

        .header p {
            color: #64748b;
            margin-top: 6px;
        }

        .faculty-info {
            background: white;
            padding: 18px 22px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            margin-bottom: 25px;
        }

        .faculty-info strong {
            color: #2563eb;
        }

        .subjects-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .subjects-container h2 {
            margin-bottom: 20px;
            color: #172033;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #172033;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f8fafc;
        }

        .credits {
            display: inline-block;
            background: #e0edff;
            color: #2563eb;
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 35px;
            color: #64748b;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 10px 18px;
            border-radius: 7px;
        }

        .back-btn:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            OC<span>MRS</span>
        </div>

        <div class="menu">

            <a href="<%=request.getContextPath()%>/faculty/dashboard.jsp">
                Dashboard
            </a>

            <a href="<%=request.getContextPath()%>/FacultyProfileServlet">
                My Profile
            </a>

            <a class="active"
               href="<%=request.getContextPath()%>/FacultySubjectServlet">
                My Subjects
            </a>

            <a href="<%=request.getContextPath()%>/FacultyStudentServlet">
                Students
            </a>

            <a href="<%=request.getContextPath()%>/FacultyExamServlet">
                Exams
            </a>

            <a href="<%=request.getContextPath()%>/FacultyResultServlet">
                Results
            </a>

            <a href="<%=request.getContextPath()%>/FacultyAttendanceServlet">
                Attendance
            </a>

            <a class="logout"
               href="<%=request.getContextPath()%>/LogoutServlet">
                Logout
            </a>

        </div>

    </div>


    <!-- MAIN -->

    <div class="main">

        <div class="header">

            <h1>My Subjects</h1>

            <p>
                Subjects assigned to your faculty account
            </p>

        </div>


        <!-- FACULTY INFO -->

        <div class="faculty-info">

            Faculty:
            <strong>
                <%= faculty.getName() %>
            </strong>

            &nbsp;&nbsp; | &nbsp;&nbsp;

            Designation:
            <strong>
                <%= faculty.getDesignation() %>
            </strong>

        </div>


        <!-- SUBJECTS -->

        <div class="subjects-container">

            <h2>Assigned Subjects</h2>

            <%
                if (subjectList != null &&
                    !subjectList.isEmpty()) {
            %>

            <table>

                <thead>

                    <tr>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Course ID</th>
                        <th>Credits</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (Subject subject : subjectList) {
                %>

                    <tr>

                        <td>
                            <%= subject.getSubjectId() %>
                        </td>

                        <td>
                            <strong>
                                <%= subject.getSubjectName() %>
                            </strong>
                        </td>

                        <td>
                            <%= subject.getCourseId() %>
                        </td>

                        <td>
                            <span class="credits">
                                <%= subject.getCredits() %>
                            </span>
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

                    <h3>No Subjects Assigned</h3>

                    <p>
                        No subjects are currently assigned
                        to your faculty account.
                    </p>

                </div>

            <%
                }
            %>

            <a class="back-btn"
               href="<%=request.getContextPath()%>/faculty/dashboard.jsp">
                ← Back to Dashboard
            </a>

        </div>

    </div>

</body>
</html>