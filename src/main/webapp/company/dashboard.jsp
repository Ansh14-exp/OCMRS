<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company =
        (Company) session.getAttribute("company");

    if (company == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Company Dashboard - OCMRS</title>

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
            width: 240px;
            height: 100vh;
            background: #172554;
            padding: 25px 15px;
        }

        .logo {
            text-align: center;
            color: white;
            margin-bottom: 35px;
        }

        .logo h2 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 13px;
            color: #cbd5e1;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            margin-bottom: 10px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 13px 15px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        .menu a:hover,
        .menu a.active {
            background: #2563eb;
        }

        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .topbar h1 {
            font-size: 28px;
            color: #172554;
        }

        .company-name {
            background: white;
            padding: 10px 18px;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            font-weight: bold;
        }

        .welcome {
            background: linear-gradient(135deg, #2563eb, #172554);
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 30px;
        }

        .welcome h2 {
            margin-bottom: 10px;
        }

        .welcome p {
            color: #dbeafe;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card .icon {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .card h3 {
            font-size: 25px;
            color: #172554;
            margin-bottom: 5px;
        }

        .card p {
            color: #64748b;
            font-size: 14px;
        }

        .profile-box {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .profile-box h2 {
            color: #172554;
            margin-bottom: 20px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .info {
            padding: 15px;
            background: #f8fafc;
            border-radius: 8px;
        }

        .info label {
            display: block;
            font-size: 12px;
            color: #64748b;
            margin-bottom: 6px;
        }

        .info span {
            font-weight: bold;
            color: #1e293b;
        }

        @media (max-width: 1000px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                padding: 20px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            <h2>OCMRS</h2>
            <p>Company Portal</p>
        </div>

        <ul class="menu">

            <li>
                <a href="<%= request.getContextPath() %>/company/dashboard.jsp"
                   class="active">
                    🏠 Dashboard
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyProfileServlet">
                    👤 Profile
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyJobServlet">
                    💼 Post Job
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyManageJobServlet">
                    📋 Manage Jobs
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyApplicantsServlet">
                    👨‍🎓 Applicants
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyInterviewsServlet">
                    🎤View Interviews
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath()%>/CompanyPlacementServlet">
                    🏆 Placements
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/LogoutServlet">
                    🚪 Logout
                </a>
            </li>

        </ul>

    </div>


    <!-- MAIN CONTENT -->

    <div class="main">

        <div class="topbar">

            <h1>Company Dashboard</h1>

            <div class="company-name">
                <%= company.getCompanyName() %>
            </div>

        </div>


        <!-- WELCOME -->

        <div class="welcome">

            <h2>
                Welcome, <%= company.getCompanyName() %> 👋
            </h2>

            <p>
                Manage your recruitment activities from your company portal.
            </p>

        </div>


        <!-- DASHBOARD CARDS -->

        <div class="cards">

            <div class="card">

                <div class="icon">💼</div>

                <h3>0</h3>

                <p>Active Jobs</p>

            </div>


            <div class="card">

                <div class="icon">📋</div>

                <h3>0</h3>

                <p>Total Applications</p>

            </div>


            <div class="card">

                <div class="icon">🎤</div>

                <h3>0</h3>

                <p>Interviews</p>

            </div>


            <div class="card">

                <div class="icon">🏆</div>

                <h3>0</h3>

                <p>Selected Students</p>

            </div>

        </div>


        <!-- COMPANY INFORMATION -->

        <div class="profile-box">

            <h2>Company Information</h2>

            <div class="profile-grid">

                <div class="info">
                    <label>Company Name</label>
                    <span>
                        <%= company.getCompanyName() %>
                    </span>
                </div>

                <div class="info">
                    <label>Industry</label>
                    <span>
                        <%= company.getIndustry() != null
                            ? company.getIndustry()
                            : "Not Available" %>
                    </span>
                </div>

                <div class="info">
                    <label>Email</label>
                    <span>
                        <%= company.getEmail() != null
                            ? company.getEmail()
                            : "Not Available" %>
                    </span>
                </div>

                <div class="info">
                    <label>Phone</label>
                    <span>
                        <%= company.getPhone() != null
                            ? company.getPhone()
                            : "Not Available" %>
                    </span>
                </div>

                <div class="info">
                    <label>Address</label>
                    <span>
                        <%= company.getAddress() != null
                            ? company.getAddress()
                            : "Not Available" %>
                    </span>
                </div>

                <div class="info">
                    <label>Website</label>
                    <span>
                        <%= company.getWebsite() != null
                            ? company.getWebsite()
                            : "Not Available" %>
                    </span>
                </div>

            </div>

        </div>

    </div>

</body>
</html>