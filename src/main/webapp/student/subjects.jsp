<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Subject" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    List<Subject> subjects =
        (List<Subject>) request.getAttribute("subjects");

    Student student =
        (Student) request.getAttribute("student");

    if (subjects == null) {
        response.sendRedirect(
            request.getContextPath() + "/SubjectServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>My Subjects - OCMRS</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6fb;
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            min-height: 100vh;
            background: #4f46e5;
            color: white;
            padding: 25px 15px;
            flex-shrink: 0;
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
            font-size: 13px;
            opacity: 0.85;
        }

        /* IMPORTANT:
           Sidebar menu vertical rahega
        */

        .menu {
            list-style: none !important;
            margin: 0 !important;
            padding: 0 !important;
            display: block !important;
            width: 100% !important;
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
            background: rgba(255,255,255,0.22);
            font-weight: bold;
        }

        /* ================= MAIN CONTENT ================= */

        .main-content {
            flex: 1;
            padding: 30px;
            overflow-x: auto;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            color: #222;
            font-size: 28px;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #666;
            font-size: 14px;
        }

        /* ================= STUDENT INFO ================= */

        .student-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.06);

            display: flex;
            justify-content: space-between;
            align-items: center;

            flex-wrap: wrap;
            gap: 15px;
        }

        .student-info h3 {
            color: #333;
            margin-bottom: 7px;
        }

        .student-info p {
            color: #666;
            font-size: 14px;
        }

        .subject-count {
            background: #eef2ff;
            color: #4f46e5;

            padding: 12px 18px;

            border-radius: 8px;

            font-weight: bold;
        }

        /* ================= SUBJECT GRID ================= */

        .subject-grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(260px, 1fr));

            gap: 20px;
        }

        .subject-card {
            background: white;

            border-radius: 12px;

            padding: 22px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.06);

            transition: 0.3s;

            border-left: 5px solid #4f46e5;
        }

        .subject-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 8px 20px rgba(0,0,0,0.10);
        }

        .subject-icon {
            width: 45px;
            height: 45px;

            background: #eef2ff;

            border-radius: 10px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 22px;

            margin-bottom: 15px;
        }

        .subject-card h3 {
            color: #222;

            font-size: 18px;

            margin-bottom: 12px;

            line-height: 1.4;
        }

        .subject-details {
            display: flex;
            justify-content: space-between;

            padding-top: 12px;

            border-top: 1px solid #eee;

            font-size: 13px;

            color: #666;
        }

        .credits {
            color: #4f46e5;
            font-weight: bold;
        }

        /* ================= EMPTY STATE ================= */

        .empty-box {
            background: white;

            padding: 50px 20px;

            text-align: center;

            border-radius: 12px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.06);
        }

        .empty-box .icon {
            font-size: 50px;
            margin-bottom: 15px;
        }

        .empty-box h3 {
            color: #333;
            margin-bottom: 8px;
        }

        .empty-box p {
            color: #777;
            font-size: 14px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 768px) {

            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                min-height: auto;
            }

            .menu a {
                padding: 12px 15px;
            }

            .main-content {
                padding: 20px;
            }

            .page-header h1 {
                font-size: 24px;
            }

            .student-card {
                align-items: flex-start;
            }
        }

    </style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        <h2>OCMRS</h2>
        <p>Student Portal</p>
    </div>

    <ul class="menu">

        <li>
            <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                🏠 Dashboard
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/StudentServlet">
                👤 Profile
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/EnrollmentServlet">
                📚 Enrollment
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/SubjectServlet"
               class="active">
                📖 Subjects
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ExamServlet">
                📝 Exams
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ResultServlet">
                📊 Results
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/JobServlet">
                💼 Jobs
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ApplicationServlet">
                📨 Apply Job
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ApplicationServlet">
                📄 Applications
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/PlacementServlet">
                🎓 Placement
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/LogoutServlet">
                🚪 Logout
            </a>
        </li>

    </ul>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="main-content">

    <div class="page-header">

        <h1>My Subjects</h1>

        <p>
            View all subjects assigned to your course.
        </p>

    </div>


    <!-- ================= STUDENT INFO ================= -->

    <%
        if (student != null) {
    %>

    <div class="student-card">

        <div class="student-info">

            <h3>
                👨‍🎓
                <%= student.getName() %>
            </h3>

            <p>
                Student ID:
                <strong><%= student.getStudentId() %></strong>
                &nbsp;&nbsp; | &nbsp;&nbsp;

                Course ID:
                <strong><%= student.getCourseId() %></strong>
            </p>

        </div>

        <div class="subject-count">

            📚
            <%= subjects.size() %>
            Subject<%= subjects.size() == 1 ? "" : "s" %>

        </div>

    </div>

    <%
        }
    %>


    <!-- ================= SUBJECTS ================= -->

    <%
        if (subjects.isEmpty()) {
    %>

        <div class="empty-box">

            <div class="icon">📚</div>

            <h3>No Subjects Found</h3>

            <p>
                No subjects are currently assigned to your course.
            </p>

        </div>

    <%
        } else {
    %>

        <div class="subject-grid">

            <%
                for (Subject subject : subjects) {
            %>

                <div class="subject-card">

                    <div class="subject-icon">
                        📖
                    </div>

                    <h3>
                        <%= subject.getSubjectName() %>
                    </h3>

                    <div class="subject-details">

                        <span>
                            Subject ID:
                            <strong>
                                <%= subject.getSubjectId() %>
                            </strong>
                        </span>

                        <span class="credits">
                            <%= subject.getCredits() %>
                            Credits
                        </span>

                    </div>

                </div>

            <%
                }
            %>

        </div>

    <%
        }
    %>

</div>

</body>
</html>