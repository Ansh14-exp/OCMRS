<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company = (Company) request.getAttribute("company");
    List<Placement> placements =
            (List<Placement>) request.getAttribute("placements");

    if (company == null) {
        response.sendRedirect(request.getContextPath() + "/CompanyProfileServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Placements - <%= company.getCompanyName() %></title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        .container {
            width: 95%;
            margin: 30px auto;
        }

        .header {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .header h1 {
            margin-bottom: 8px;
        }

        .header p {
            opacity: 0.9;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        .card h2 {
            margin-bottom: 20px;
        }

        .count {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            background: #667eea;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f8f9ff;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            display: inline-block;
        }

        .selected {
            background: #d4edda;
            color: #155724;
        }

        .pending {
            background: #fff3cd;
            color: #856404;
        }

        .rejected {
            background: #f8d7da;
            color: #721c24;
        }

        .empty {
            text-align: center;
            padding: 50px;
            color: #777;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #5568d9;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>🏆 Placement Records</h1>
        <p>
            Placement records for
            <strong><%= company.getCompanyName() %></strong>
        </p>
    </div>

    <div class="card">

        <h2>Student Placements</h2>

        <%
            int total = placements != null ? placements.size() : 0;
        %>

        <div class="count">
            Total Placements: <%= total %>
        </div>

        <% if (placements == null || placements.isEmpty()) { %>

            <div class="empty">
                <h3>📭 No Placement Records</h3>
                <p>No students have been placed through your company yet.</p>
            </div>

        <% } else { %>

            <table>

                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Job</th>
                        <th>Placement Date</th>
                        <th>Package</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                <% for (Placement placement : placements) { %>

                    <tr>

                        <td>
                            <strong>
                                <%= placement.getStudentName() %>
                            </strong>
                        </td>

                        <td>
                            <%= placement.getStudentEmail() %>
                        </td>

                        <td>
                            <%= placement.getStudentPhone() %>
                        </td>

                        <td>
                            <%= placement.getJobTitle() %>
                        </td>

                        <td>
                            <%= placement.getPlacementDate() %>
                        </td>

                        <td>
                            <strong>
                                <%= placement.getPackageAmount() %>
                            </strong>
                        </td>

                        <td>

                            <%
                                String status = placement.getStatus();

                                if (status == null) {
                                    status = "Pending";
                                }

                                String statusClass = "";

                                if ("Selected".equalsIgnoreCase(status)
                                        || "Placed".equalsIgnoreCase(status)) {

                                    statusClass = "selected";

                                } else if ("Rejected".equalsIgnoreCase(status)) {

                                    statusClass = "rejected";

                                } else {

                                    statusClass = "pending";
                                }
                            %>

                            <span class="status <%= statusClass %>">
                                <%= status %>
                            </span>

                        </td>

                    </tr>

                <% } %>

                </tbody>

            </table>

        <% } %>

        <a href="<%= request.getContextPath() %>/company/dashboard.jsp"
           class="back-btn">
            ← Back to Dashboard
        </a>

    </div>

</div>

</body>
</html>