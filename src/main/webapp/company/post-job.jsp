<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company =
        (Company) request.getAttribute("company");

    if (company == null) {
        company =
            (Company) session.getAttribute("company");
    }

    if (company == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Post Job - OCMRS</title>

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
            margin-bottom: 25px;
        }

        .topbar h1 {
            color: #172554;
            font-size: 28px;
        }

        .topbar p {
            color: #64748b;
            margin-top: 6px;
        }

        .form-card {
            background: white;
            max-width: 850px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .company-info {
            background: #eff6ff;
            padding: 15px 18px;
            border-radius: 10px;
            margin-bottom: 25px;
            color: #1e3a8a;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full {
            grid-column: 1 / -1;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #334155;
            font-size: 14px;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            outline: none;
            font-size: 14px;
        }

        input:focus,
        textarea:focus {
            border-color: #2563eb;
        }

        textarea {
            min-height: 130px;
            resize: vertical;
        }

        .buttons {
            margin-top: 25px;
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
        }

        .submit-btn {
            background: #2563eb;
            color: white;
        }

        .submit-btn:hover {
            background: #1d4ed8;
        }

        .cancel-btn {
            background: #e2e8f0;
            color: #334155;
        }

        .message {
            padding: 13px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .success {
            background: #dcfce7;
            color: #166534;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
        }

        @media (max-width: 700px) {

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

            .full {
                grid-column: auto;
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
                <a href="<%= request.getContextPath() %>/CompanyProfileServlet">
                    👤 Profile
                </a>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/CompanyJobServlet"
                   class="active">
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

            <h1>Post New Job</h1>

            <p>
                Create a new job opportunity for students.
            </p>

        </div>


        <% if ("added".equals(success)) { %>

            <div class="message success">
                ✅ Job posted successfully!
            </div>

        <% } %>


        <% if ("failed".equals(error)) { %>

            <div class="message error">
                ❌ Failed to post job. Please try again.
            </div>

        <% } %>


        <% if ("title".equals(error)) { %>

            <div class="message error">
                ❌ Job title is required.
            </div>

        <% } %>


        <div class="form-card">


            <div class="company-info">

                <strong>Company:</strong>
                <%= company.getCompanyName() %>

            </div>


            <form action="<%= request.getContextPath() %>/CompanyJobServlet"
                  method="post">


                <div class="form-grid">


                    <!-- JOB TITLE -->

                    <div class="form-group">

                        <label for="title">
                            Job Title *
                        </label>

                        <input type="text"
                               id="title"
                               name="title"
                               placeholder="e.g. Java Developer"
                               required>

                    </div>


                    <!-- SALARY -->

                    <div class="form-group">

                        <label for="salaryRange">
                            Salary Range
                        </label>

                        <input type="text"
                               id="salaryRange"
                               name="salaryRange"
                               placeholder="e.g. 4 - 6 LPA">

                    </div>


                    <!-- LOCATION -->

                    <div class="form-group">

                        <label for="location">
                            Location
                        </label>

                        <input type="text"
                               id="location"
                               name="location"
                               placeholder="e.g. Kolkata, West Bengal">

                    </div>


                    <!-- LAST DATE -->

                    <div class="form-group">

                        <label for="lastDate">
                            Application Last Date
                        </label>

                        <input type="date"
                               id="lastDate"
                               name="lastDate">

                    </div>


                    <!-- DESCRIPTION -->

                    <div class="form-group full">

                        <label for="description">
                            Job Description
                        </label>

                        <textarea id="description"
                                  name="description"
                                  placeholder="Describe the job role, responsibilities, skills and requirements..."></textarea>

                    </div>


                </div>


                <div class="buttons">

                    <button type="submit"
                            class="btn submit-btn">
                        📤 Post Job
                    </button>

                    <a href="<%= request.getContextPath() %>/company/dashboard.jsp"
                       class="btn cancel-btn">
                        Cancel
                    </a>

                </div>


            </form>

        </div>

    </div>

</body>
</html>