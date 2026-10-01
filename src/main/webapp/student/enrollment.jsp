<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Enrollment" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    List<Enrollment> enrollments =
        (List<Enrollment>) request.getAttribute("enrollments");

    Student student =
        (Student) request.getAttribute("student");

    if (enrollments == null) {
        enrollments = new java.util.ArrayList<Enrollment>();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Enrollment | OCMRS</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        /* ================= CONTAINER ================= */

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            height: 100vh;

            background: linear-gradient(
                180deg,
                #172554,
                #1e3a8a
            );

            color: white;

            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;

            padding: 25px 15px;

            overflow-y: auto;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h2 {
            font-size: 25px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 12px;
            opacity: 0.8;
        }

        /* IMPORTANT:
           Keep menu vertical
        */

        .menu {
            list-style: none !important;
            margin: 0 !important;
            padding: 0 !important;

            display: block !important;
            width: 100%;
        }

        .menu li {
            display: block !important;
            list-style: none !important;

            width: 100% !important;

            margin: 0 0 8px 0 !important;
            padding: 0 !important;
        }

        .menu a {
            display: flex !important;

            flex-direction: row !important;

            align-items: center;

            gap: 12px;

            width: 100% !important;

            padding: 13px 15px;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-size: 14px;

            transition: 0.3s;
        }

        .menu a:hover {
            background: rgba(255,255,255,0.15);
        }

        .menu a.active {
            background: rgba(255,255,255,0.20);
            font-weight: bold;
        }

        .menu a span {
            display: inline-block;
        }

        /* ================= MAIN ================= */

        .main {
            margin-left: 250px;

            width: calc(100% - 250px);

            min-height: 100vh;

            padding: 30px;
        }

        /* ================= HEADER ================= */

        .header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 30px;
        }

        .header h1 {
            color: #172554;

            font-size: 28px;

            margin-bottom: 5px;
        }

        .header p {
            color: #666;

            font-size: 14px;
        }

        .user-box {
            background: white;

            padding: 11px 18px;

            border-radius: 8px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.08);

            color: #333;
        }

        /* ================= STUDENT INFO ================= */

        .student-info {
            background: white;

            border-radius: 12px;

            padding: 25px;

            margin-bottom: 25px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);
        }

        .student-info h2 {
            color: #172554;

            font-size: 20px;

            margin-bottom: 20px;
        }

        .info-grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(200px, 1fr));

            gap: 18px;
        }

        .info-item {
            background: #f8fafc;

            border-radius: 8px;

            padding: 15px;
        }

        .info-item label {
            display: block;

            font-size: 12px;

            color: #777;

            margin-bottom: 6px;
        }

        .info-item strong {
            color: #172554;

            font-size: 14px;
        }

        /* ================= ENROLLMENT SECTION ================= */

        .enrollment-section {
            background: white;

            border-radius: 12px;

            padding: 25px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);
        }

        .section-header {
            margin-bottom: 20px;
        }

        .section-header h2 {
            color: #172554;

            font-size: 21px;

            margin-bottom: 5px;
        }

        .section-header p {
            color: #777;

            font-size: 14px;
        }

        /* ================= TABLE ================= */

        .table-container {
            width: 100%;

            overflow-x: auto;
        }

        table {
            width: 100%;

            border-collapse: collapse;

            min-width: 650px;
        }

        th {
            background: #eff6ff;

            color: #172554;

            padding: 14px;

            text-align: left;

            font-size: 14px;
        }

        td {
            padding: 14px;

            border-bottom:
                1px solid #eeeeee;

            font-size: 14px;

            color: #444;
        }

        tr:hover {
            background: #f8fafc;
        }

        /* ================= GRADE ================= */

        .grade {
            display: inline-block;

            padding: 5px 10px;

            border-radius: 15px;

            background: #dcfce7;

            color: #166534;

            font-size: 12px;

            font-weight: bold;
        }

        .no-grade {
            color: #888;
        }

        /* ================= EMPTY ================= */

        .empty {
            text-align: center;

            padding: 60px 20px;
        }

        .empty-icon {
            font-size: 55px;

            margin-bottom: 15px;
        }

        .empty h3 {
            color: #172554;

            margin-bottom: 8px;
        }

        .empty p {
            color: #777;

            font-size: 14px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;

                width: calc(100% - 210px);

                padding: 20px;
            }
        }

        @media (max-width: 700px) {

            .container {
                display: block;
            }

            .sidebar {
                position: relative;

                width: 100%;

                height: auto;

                min-height: auto;
            }

            .main {
                margin-left: 0;

                width: 100%;

                padding: 20px;
            }

            .header {
                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }

            .menu a {
                padding: 12px 15px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->

    <aside class="sidebar">

        <div class="logo">

            <h2>OCMRS</h2>

            <p>Student Portal</p>

        </div>


        <ul class="menu">

            <li>

                <a href="<%= request.getContextPath() %>/student/dashboard.jsp">

                    <span>🏠</span>

                    <span>Dashboard</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/StudentServlet">

                    <span>👤</span>

                    <span>Profile</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/EnrollmentServlet"
                   class="active">

                    <span>📚</span>

                    <span>Enrollment</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/SubjectServlet">

                    <span>📖</span>

                    <span>Subjects</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/ExamServlet">

                    <span>📝</span>

                    <span>Exams</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/ResultServlet">

                    <span>📊</span>

                    <span>Results</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/JobServlet">

                    <span>💼</span>

                    <span>Jobs</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/ApplicationServlet">

                    <span>📨</span>

                    <span>Apply Job</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/ApplicationServlet">

                    <span>📄</span>

                    <span>Applications</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/PlacementServlet">

                    <span>🎓</span>

                    <span>Placement</span>

                </a>

            </li>


            <li>

                <a href="<%= request.getContextPath() %>/LogoutServlet">

                    <span>🚪</span>

                    <span>Logout</span>

                </a>

            </li>

        </ul>

    </aside>


    <!-- =====================================================
         MAIN CONTENT
         ===================================================== -->

    <main class="main">


        <!-- ================= HEADER ================= -->

        <div class="header">

            <div>

                <h1>Enrollment</h1>

                <p>
                    View your course enrollment information.
                </p>

            </div>


            <div class="user-box">

                👨‍🎓 Student Portal

            </div>

        </div>


        <!-- =================================================
             STUDENT INFORMATION
             ================================================= -->

        <div class="student-info">

            <h2>Student Information</h2>


            <div class="info-grid">

                <div class="info-item">

                    <label>Student Name</label>

                    <strong>

                        <%= student != null
                            ? student.getName()
                            : "—" %>

                    </strong>

                </div>


                <div class="info-item">

                    <label>Student ID</label>

                    <strong>

                        <%= student != null
                            ? student.getStudentId()
                            : "—" %>

                    </strong>

                </div>


                <div class="info-item">

                    <label>Email</label>

                    <strong>

                        <%= student != null
                            ? student.getEmail()
                            : "—" %>

                    </strong>

                </div>


                <div class="info-item">

                    <label>Course ID</label>

                    <strong>

                        <%= student != null
                            ? student.getCourseId()
                            : "—" %>

                    </strong>

                </div>

            </div>

        </div>


        <!-- =================================================
             ENROLLMENT DETAILS
             ================================================= -->

        <div class="enrollment-section">


            <div class="section-header">

                <h2>
                    Enrollment Details
                </h2>

                <p>
                    Your course enrollment history.
                </p>

            </div>


            <%
                if (enrollments.isEmpty()) {
            %>


                <div class="empty">

                    <div class="empty-icon">
                        📚
                    </div>

                    <h3>
                        No Enrollment Records Found
                    </h3>

                    <p>
                        No enrollment information is currently
                        available for your account.
                    </p>

                </div>


            <%
                } else {
            %>


                <div class="table-container">

                    <table>

                        <thead>

                            <tr>

                                <th>
                                    Enrollment ID
                                </th>

                                <th>
                                    Student ID
                                </th>

                                <th>
                                    Course ID
                                </th>

                                <th>
                                    Enrollment Year
                                </th>

                                <th>
                                    Grade
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                        <%
                            for (Enrollment enrollment : enrollments) {
                        %>


                            <tr>

                                <td>

                                    #ENR<%= enrollment.getEnrollmentId() %>

                                </td>


                                <td>

                                    <%= enrollment.getStudentId() %>

                                </td>


                                <td>

                                    <%= enrollment.getCourseId() %>

                                </td>


                                <td>

                                    <%= enrollment.getEnrollmentYear() %>

                                </td>


                                <td>

                                    <%
                                        String grade =
                                            enrollment.getGrade();

                                        if (grade != null
                                                && !grade.trim().isEmpty()) {
                                    %>

                                        <span class="grade">

                                            <%= grade %>

                                        </span>

                                    <%
                                        } else {
                                    %>

                                        <span class="no-grade">
                                            Not Assigned
                                        </span>

                                    <%
                                        }
                                    %>

                                </td>

                            </tr>


                        <%
                            }
                        %>


                        </tbody>

                    </table>

                </div>


            <%
                }
            %>


        </div>


    </main>

</div>

</body>

</html>