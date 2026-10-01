<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    List<Company> companies =
            (List<Company>) request.getAttribute("companies");

    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Job Management - OCMRS</title>

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

        .full {
            grid-column: span 2;
        }

        label {
            margin-bottom: 6px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        input:focus,
        select:focus,
        textarea:focus {
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
            min-width: 1100px;
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

        .no-company {
            padding: 12px;
            background: #fff7ed;
            color: #9a3412;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        @media (max-width: 700px) {

            .container {
                padding: 15px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full {
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
    💼 OCMRS - Job Management
</div>

<div class="container">

    <div class="top-bar">

        <h2>Job Management</h2>

        <a href="<%= request.getContextPath() %>/AdminServlet"
           class="dashboard-btn">
            🏠 Dashboard
        </a>

    </div>


    <!-- ================= MESSAGE ================= -->

    <% if ("added".equals(message)) { %>

        <div class="message">
            ✅ Job added successfully!
        </div>

    <% } else if ("updated".equals(message)) { %>

        <div class="message">
            ✅ Job updated successfully!
        </div>

    <% } else if ("deleted".equals(message)) { %>

        <div class="message">
            ✅ Job deleted successfully!
        </div>

    <% } else if ("addFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to add job.
        </div>

    <% } else if ("updateFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to update job.
        </div>

    <% } else if ("deleteFailed".equals(message)) { %>

        <div class="message error-message">
            ❌ Failed to delete job.
        </div>

    <% } else if ("titleRequired".equals(message)) { %>

        <div class="message error-message">
            ❌ Job title is required.
        </div>

    <% } else if ("invalidId".equals(message)) { %>

        <div class="message error-message">
            ❌ Invalid Job ID.
        </div>

    <% } else if ("notFound".equals(message)) { %>

        <div class="message error-message">
            ❌ Job not found.
        </div>

    <% } %>


    <!-- ================= ADD JOB ================= -->

    <div class="form-box">

        <h3>➕ Add New Job</h3>

        <% if (companies == null || companies.isEmpty()) { %>

            <div class="no-company">
                ⚠️ No companies available.
                Please add a company first.
            </div>

        <% } %>


        <form action="<%= request.getContextPath() %>/JobServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">


            <div class="form-grid">

                <!-- Company -->

                <div class="form-group">

                    <label>Company *</label>

                    <select name="companyId" required>

                        <option value="">
                            -- Select Company --
                        </option>

                        <% if (companies != null) { %>

                            <% for (Company company : companies) { %>

                                <option value="<%= company.getCompanyId() %>">

                                    <%= company.getCompanyName() %>

                                </option>

                            <% } %>

                        <% } %>

                    </select>

                </div>


                <!-- Job Title -->

                <div class="form-group">

                    <label>Job Title *</label>

                    <input type="text"
                           name="title"
                           placeholder="e.g. Java Developer"
                           required>

                </div>


                <!-- Salary -->

                <div class="form-group">

                    <label>Salary Range</label>

                    <input type="text"
                           name="salaryRange"
                           placeholder="e.g. 4-6 LPA">

                </div>


                <!-- Location -->

                <div class="form-group">

                    <label>Location</label>

                    <input type="text"
                           name="location"
                           placeholder="e.g. Kolkata">

                </div>


                <!-- Last Date -->

                <div class="form-group">

                    <label>Application Last Date</label>

                    <input type="date"
                           name="lastDate">

                </div>


                <!-- Description -->

                <div class="form-group full">

                    <label>Job Description</label>

                    <textarea name="description"
                              placeholder="Enter job description"></textarea>

                </div>

            </div>


            <button type="submit"
                    class="add-btn">
                ➕ Add Job
            </button>

        </form>

    </div>


    <!-- ================= JOB LIST ================= -->

    <div class="table-box">

        <h3>📋 Job List</h3>

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Company ID</th>
                    <th>Job Title</th>
                    <th>Description</th>
                    <th>Salary</th>
                    <th>Location</th>
                    <th>Last Date</th>
                    <th>Actions</th>

                </tr>

            </thead>


            <tbody>

            <% if (jobs != null && !jobs.isEmpty()) { %>

                <% for (Job job : jobs) { %>

                    <tr>

                        <td>
                            <%= job.getJobId() %>
                        </td>

                        <td>
                            <%= job.getCompanyId() %>
                        </td>

                        <td>
                            <strong>
                                <%= job.getTitle() %>
                            </strong>
                        </td>

                        <td>
                            <%= job.getDescription() != null
                                ? job.getDescription()
                                : "-" %>
                        </td>

                        <td>
                            <%= job.getSalaryRange() != null
                                ? job.getSalaryRange()
                                : "-" %>
                        </td>

                        <td>
                            <%= job.getLocation() != null
                                ? job.getLocation()
                                : "-" %>
                        </td>

                        <td>
                            <%= job.getLastDate() != null
                                ? job.getLastDate()
                                : "-" %>
                        </td>

                        <td>

                            <a class="edit-btn"
                               href="<%= request.getContextPath() %>/JobServlet?action=edit&jobId=<%= job.getJobId() %>">
                                ✏️ Edit
                            </a>

                            <a class="delete-btn"
                               href="<%= request.getContextPath() %>/JobServlet?action=delete&jobId=<%= job.getJobId() %>"
                               onclick="return confirm('Are you sure you want to delete this job?');">
                                🗑️ Delete
                            </a>

                        </td>

                    </tr>

                <% } %>

            <% } else { %>

                <tr>

                    <td colspan="8"
                        class="empty">

                        No jobs found.

                    </td>

                </tr>

            <% } %>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>