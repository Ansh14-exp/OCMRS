<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String username = user.getUsername();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - OCMRS</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
            color: #333;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: #172033;
            color: white;
            padding: 25px 15px;
            overflow-y: auto;
        }

        .logo {
            text-align: center;
            font-size: 23px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .admin-text {
            text-align: center;
            color: #b9c2d0;
            font-size: 13px;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 8px;
        }

        .sidebar ul li a {
            display: block;
            color: #dce3ed;
            text-decoration: none;
            padding: 13px 15px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .sidebar ul li a:hover,
        .sidebar ul li a.active {
            background: #2d3d5a;
            color: white;
        }

        .sidebar ul li a span {
            margin-left: 10px;
        }

        /* Main */
        .main {
            margin-left: 250px;
            padding: 30px;
        }

        .topbar {
            background: white;
            padding: 22px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .topbar h1 {
            font-size: 28px;
            margin-bottom: 7px;
        }

        .topbar p {
            color: #777;
        }

        /* Cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-4px);
        }

        .card-icon {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .card h3 {
            color: #666;
            font-size: 15px;
            margin-bottom: 8px;
        }

        .card .number {
            font-size: 32px;
            font-weight: bold;
            color: #172033;
        }

        /* Bottom section */
        .welcome {
            margin-top: 25px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .welcome h2 {
            margin-bottom: 10px;
        }

        .welcome p {
            color: #666;
            line-height: 1.6;
        }

        @media (max-width: 900px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                padding: 20px;
            }

            .cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">

        <div class="logo">
            🎓 OCMRS
        </div>

        <div class="admin-text">
            Admin Panel
        </div>

        <ul>

            <li>
                <a href="<%= request.getContextPath() %>/AdminServlet"
                   class="active">
                    🏠
                    <span>Dashboard</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CollegeServlet">
                    🏫
                    <span>Colleges</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/DepartmentServlet">
                    🏢
                    <span>Departments</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CourseServlet">
                    📚
                    <span>Courses</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/FacultyServlet">
                    👨‍🏫
                    <span>Faculty</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/StudentServlet">
                    🎓
                    <span>Students</span>
                </a>
            </li>

            <li>
               <a href="<%= request.getContextPath()%>/SubjectServlet">
                    📖
                    <span>Subjects</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/ExamServlet">
                    📝
                    <span>Exams</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/ResultServlet">
                    📊
                    <span>Results</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyServlet">
                    🏢
                    <span>Companies</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/JobServlet">
                    💼
                    <span>Jobs</span>
                </a>
            </li>

            <li>
               <a href="<%= request.getContextPath()%>/ApplicationServlet">
                    📄
                    <span>Applications</span>
                </a>
            </li>

            <li>
               <a href="<%= request.getContextPath()%>/InterviewServlet">
                    📅
                    <span>Interviews</span>
                </a>
            </li>

            <li>
               <a href="<%= request.getContextPath()%>/PlacementServlet">
                    🏆
                    <span>Placements</span>
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/LogoutServlet">
                    🚪
                    <span>Logout</span>
                </a>
            </li>

        </ul>
    </div>

    <!-- Main Content -->
    <div class="main">

        <div class="topbar">
            <h1>Admin Dashboard</h1>
            <p>Welcome back, <strong><%= username %></strong> 👋</p>
        </div>

        <!-- Statistics -->
        <div class="cards">

            <div class="card">
                <div class="card-icon">🎓</div>
                <h3>Total Students</h3>
                <div class="number">
                    <%= request.getAttribute("totalStudents") %>
                </div>
            </div>

            <div class="card">
                <div class="card-icon">👨‍🏫</div>
                <h3>Total Faculty</h3>
                <div class="number">
                    <%= request.getAttribute("totalFaculty") %>
                </div>
            </div>

            <div class="card">
                <div class="card-icon">📚</div>
                <h3>Total Courses</h3>
                <div class="number">
                    <%= request.getAttribute("totalCourses") %>
                </div>
            </div>

            <div class="card">
                <div class="card-icon">🏢</div>
                <h3>Total Companies</h3>
                <div class="number">
                    <%= request.getAttribute("totalCompanies") %>
                </div>
            </div>

            <div class="card">
                <div class="card-icon">💼</div>
                <h3>Total Jobs</h3>
                <div class="number">
                    <%= request.getAttribute("totalJobs") %>
                </div>
            </div>

            <div class="card">
                <div class="card-icon">📄</div>
                <h3>Total Applications</h3>
                <div class="number">
                    <%= request.getAttribute("totalApplications") %>
                </div>
            </div>

        </div>

        <div class="welcome">
            <h2>OCMRS Administration</h2>

            <p>
                Manage college information, departments, courses, faculty,
                students, examinations, companies, recruitment and placement
                activities from this administration panel.
            </p>
        </div>

    </div>

</body>
</html>