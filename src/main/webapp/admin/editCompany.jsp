<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    List<Company> companies =
            (List<Company>) request.getAttribute("companies");

    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Company Management - OCMRS</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            color: #333;
        }

        .header {
            background: #1f2937;
            color: white;
            padding: 18px 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .container {
            padding: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .top-bar h2 {
            margin: 0;
            color: #1f2937;
        }

        .dashboard-btn {
            text-decoration: none;
            background: #374151;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
        }

        .dashboard-btn:hover {
            background: #111827;
        }

        .form-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .form-box h3 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #1f2937;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            grid-column: span 2;
        }

        label {
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #2563eb;
        }

        .add-btn {
            margin-top: 20px;
            background: #2563eb;
            color: white;
            border: none;
            padding: 11px 22px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }

        .add-btn:hover {
            background: #1d4ed8;
        }

        .message {
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            background: #dcfce7;
            color: #166534;
        }

        .error-message {
            background: #fee2e2;
            color: #991b1b;
        }

        .table-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1000px;
        }

        th {
            background: #1f2937;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .edit-btn {
            text-decoration: none;
            background: #f59e0b;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            margin-right: 5px;
        }

        .delete-btn {
            text-decoration: none;
            background: #dc2626;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
        }

        .edit-btn:hover {
            background: #d97706;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;
            padding: 25px;
            color: #6b7280;
        }

        @media (max-width: 700px) {

            .container {
                padding: 15px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: span 1;
            }

            .top-bar {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }

    </style>

</head>

<body>

<div class="header">
    🏢 OCMRS - Company Management
</div>

<div class="container">

    <div class="top-bar">

        <h2>Company Management</h2>

        <a href="<%= request.getContextPath() %>/AdminServlet"
           class="dashboard-btn">
            🏠 Dashboard
        </a>

    </div>


    <!-- ================= MESSAGE ================= -->

    <% if ("added".equals(message)) { %>

        <div class="message">
            ✅ Company added successfully!
        </div>

    <% } else if ("updated".equals(message)) { %>

        <div class="message">
            ✅ Company updated successfully!
        </div>

    <% } else if ("deleted".equals(message)) { %>

        <div class="message">
            ✅ Company deleted successfully!
        </div>

    <% } else if ("addFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to add company.
        </div>

    <% } else if ("updateFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to update company.
        </div>

    <% } else if ("deleteFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to delete company.
        </div>

    <% } else if ("nameRequired".equals(message)) { %>

        <div class="message error-message">
            ❌ Company name is required.
        </div>

    <% } else if ("invalidId".equals(message)) { %>

        <div class="message error-message">
            ❌ Invalid company ID.
        </div>

    <% } else if ("notFound".equals(message)) { %>

        <div class="message error-message">
            ❌ Company not found.
        </div>

    <% } %>


    <!-- ================= ADD COMPANY ================= -->

    <div class="form-box">

        <h3>➕ Add New Company</h3>

        <form action="<%= request.getContextPath() %>/CompanyServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">

            <div class="form-grid">

                <div class="form-group">

                    <label>Company Name *</label>

                    <input type="text"
                           name="companyName"
                           placeholder="Enter company name"
                           required>

                </div>


                <div class="form-group">

                    <label>Industry</label>

                    <input type="text"
                           name="industry"
                           placeholder="e.g. Information Technology">

                </div>


                <div class="form-group">

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           placeholder="company@example.com">

                </div>


                <div class="form-group">

                    <label>Phone</label>

                    <input type="text"
                           name="phone"
                           placeholder="Enter phone number">

                </div>


                <div class="form-group full">

                    <label>Address</label>

                    <input type="text"
                           name="address"
                           placeholder="Enter company address">

                </div>


                <div class="form-group full">

                    <label>Website</label>

                    <input type="text"
                           name="website"
                           placeholder="https://example.com">

                </div>

            </div>


            <button type="submit" class="add-btn">
                ➕ Add Company
            </button>

        </form>

    </div>


    <!-- ================= COMPANY LIST ================= -->

    <div class="table-box">

        <h3>📋 Company List</h3>

        <table>

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Company Name</th>
                    <th>Industry</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Website</th>
                    <th>Actions</th>
                </tr>

            </thead>


            <tbody>

            <% if (companies != null && !companies.isEmpty()) { %>

                <% for (Company company : companies) { %>

                    <tr>

                        <td>
                            <%= company.getCompanyId() %>
                        </td>

                        <td>
                            <strong>
                                <%= company.getCompanyName() %>
                            </strong>
                        </td>

                        <td>
                            <%= company.getIndustry() != null
                                ? company.getIndustry()
                                : "-" %>
                        </td>

                        <td>
                            <%= company.getEmail() != null
                                ? company.getEmail()
                                : "-" %>
                        </td>

                        <td>
                            <%= company.getPhone() != null
                                ? company.getPhone()
                                : "-" %>
                        </td>

                        <td>
                            <%= company.getAddress() != null
                                ? company.getAddress()
                                : "-" %>
                        </td>

                        <td>

                            <% if (company.getWebsite() != null
                                   && !company.getWebsite().trim().isEmpty()) { %>

                                <a href="<%= company.getWebsite() %>"
                                   target="_blank">
                                    Visit
                                </a>

                            <% } else { %>

                                -

                            <% } %>

                        </td>

                        <td>

                            <a class="edit-btn"
                               href="<%= request.getContextPath() %>/CompanyServlet?action=edit&companyId=<%= company.getCompanyId() %>">
                                ✏️ Edit
                            </a>

                            <a class="delete-btn"
                               href="<%= request.getContextPath() %>/CompanyServlet?action=delete&companyId=<%= company.getCompanyId() %>"
                               onclick="return confirm('Are you sure you want to delete this company?');">
                                🗑️ Delete
                            </a>

                        </td>

                    </tr>

                <% } %>

            <% } else { %>

                <tr>

                    <td colspan="8" class="empty">
                        No companies found.
                    </td>

                </tr>

            <% } %>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>