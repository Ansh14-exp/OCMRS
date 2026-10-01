<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Exam" %>

<%
    List<Exam> exams = (List<Exam>) request.getAttribute("exams");

    if (exams == null) {
        response.sendRedirect(
            request.getContextPath() + "/ExamServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>My Exams - OCMRS</title>

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
            border-bottom: 1px solid rgba(255,255,255,0.2);
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
            box-shadow: 0 3px 10px rgba(0,0,0,0.12);
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
                #667eea,
                #764ba2
            );

            color: white;
            padding: 25px;

            border-radius: 15px;
            margin-bottom: 30px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .header h1 {
            margin-bottom: 8px;
            font-size: 30px;
        }

        .header p {
            opacity: 0.9;
        }

        /* ================= EXAM CONTAINER ================= */

        .exam-container {
            background: white;
            padding: 25px;

            border-radius: 15px;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.08);

            overflow-x: auto;
        }

        .exam-container h2 {
            margin-bottom: 20px;
            color: #444;
        }

        /* ================= TABLE ================= */

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th {
            background: #667eea;
            color: white;

            padding: 14px;
            text-align: left;
        }

        td {
            padding: 14px;

            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f8f9ff;
        }

        .exam-type {
            font-weight: bold;
            color: #667eea;
        }

        .marks {
            font-weight: bold;
        }

        /* ================= NO EXAM ================= */

        .no-exam {
            text-align: center;

            padding: 40px;

            color: #777;

            font-size: 18px;
        }

        /* ================= BACK BUTTON ================= */

        .back-btn {
            display: inline-block;

            margin-top: 20px;

            padding: 10px 20px;

            background: #667eea;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #5568d9;
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


    <a href="<%= request.getContextPath() %>/ExamServlet"
       class="active">

        📝 Exams

    </a>


    <a href="<%= request.getContextPath() %>/ResultServlet">

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

        <h1>📚 My Exams</h1>

        <p>
            View your upcoming and scheduled examinations
        </p>

    </div>


    <!-- EXAM SECTION -->

    <div class="exam-container">

        <h2>Exam Schedule</h2>


        <% if (exams.isEmpty()) { %>


            <div class="no-exam">

                No exams scheduled yet.

            </div>


        <% } else { %>


            <table>

                <tr>

                    <th>Exam ID</th>

                    <th>Subject ID</th>

                    <th>Exam Type</th>

                    <th>Exam Date</th>

                    <th>Total Marks</th>

                </tr>


                <% for (Exam exam : exams) { %>


                    <tr>

                        <td>

                            <%= exam.getExamId() %>

                        </td>


                        <td>

                            <%= exam.getSubjectId() %>

                        </td>


                        <td class="exam-type">

                            <%= exam.getExamType() %>

                        </td>


                        <td>

                            <%= exam.getExamDate() %>

                        </td>


                        <td class="marks">

                            <%= exam.getTotalMarks() %>

                        </td>

                    </tr>


                <% } %>


            </table>


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