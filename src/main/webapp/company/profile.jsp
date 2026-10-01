<%@ page language="java"
    contentType="text/html; charset=UTF-8"
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

    <title>Company Profile - OCMRS</title>

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
            margin: 0;
            padding: 0;
        }

        .menu li {
            display: block;
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
            margin-bottom: 30px;
        }

        .topbar h1 {
            font-size: 28px;
            color: #172554;
        }

        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            max-width: 900px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding-bottom: 25px;
            margin-bottom: 25px;
            border-bottom: 1px solid #e2e8f0;
        }

        .company-icon {
            width: 75px;
            height: 75px;
            background: #2563eb;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
        }

        .profile-header h2 {
            color: #172554;
            margin-bottom: 5px;
        }

        .profile-header p {
            color: #64748b;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .detail-box {
            background: #f8fafc;
            padding: 18px;
            border-radius: 10px;
        }

        .detail-box label {
            display: block;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .detail-box span {
            color: #1e293b;
            font-weight: bold;
        }

        .website {
            color: #2563eb !important;
        }

        @media (max-width: 700px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                padding: 20px;
            }

            .details {
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
                <a href="<%= request.getContextPath() %>/company/dashboard.jsp">
                    🏠 Dashboard
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/company/profile.jsp"
                   class="active">
                    👤 Profile
                </a>
            </li>

            <li>
                <a href="#">
                    💼 Post Job
                </a>
            </li>

            <li>
                <a href="#">
                    📋 Manage Jobs
                </a>
            </li>

            <li>
                <a href="#">
                    👨‍🎓 Applicants
                </a>
            </li>

            <li>
                <a href="#">
                    🎤 Interviews
                </a>
            </li>

            <li>
                <a href="#">
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


    <!-- MAIN -->

    <div class="main">

        <div class="topbar">

            <h1>Company Profile</h1>

        </div>


        <div class="profile-card">

            <div class="profile-header">

                <div class="company-icon">
                    🏢
                </div>

                <div>

                    <h2>
                        <%= company.getCompanyName() %>
                    </h2>

                    <p>
                        <%= company.getIndustry() != null
                            ? company.getIndustry()
                            : "Industry not available" %>
                    </p>

                </div>

            </div>


            <div class="details">

                <div class="detail-box">

                    <label>Company ID</label>

                    <span>
                        <%= company.getCompanyId() %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Company Name</label>

                    <span>
                        <%= company.getCompanyName() %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Industry</label>

                    <span>
                        <%= company.getIndustry() != null
                            ? company.getIndustry()
                            : "Not Available" %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Email</label>

                    <span>
                        <%= company.getEmail() != null
                            ? company.getEmail()
                            : "Not Available" %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Phone</label>

                    <span>
                        <%= company.getPhone() != null
                            ? company.getPhone()
                            : "Not Available" %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Address</label>

                    <span>
                        <%= company.getAddress() != null
                            ? company.getAddress()
                            : "Not Available" %>
                    </span>

                </div>


                <div class="detail-box">

                    <label>Website</label>

                    <span class="website">
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