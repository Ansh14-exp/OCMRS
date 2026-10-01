<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Company" %>
<%@ page import="java.util.List" %>

<%
    Job job = (Job) request.getAttribute("job");

    List<Company> companies =
            (List<Company>) request.getAttribute("companies");

    if (job == null) {
        response.sendRedirect(
            request.getContextPath() + "/JobServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Job - OCMRS</title>

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
            max-width: 850px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            color: #1f2937;
            margin-bottom: 25px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full {
            grid-column: span 2;
        }

        label {
            font-weight: bold;
            margin-bottom: 7px;
        }

        input,
        select,
        textarea {
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        input:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #2563eb;
        }

        .job-id {
            background: #f3f4f6;
            color: #6b7280;
            cursor: not-allowed;
        }

        .buttons {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }

        .update-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 11px 22px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        .cancel-btn {
            text-decoration: none;
            background: #6b7280;
            color: white;
            padding: 11px 22px;
            border-radius: 6px;
        }

        .cancel-btn:hover {
            background: #4b5563;
        }

        @media (max-width: 700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full {
                grid-column: span 1;
            }

            .container {
                margin-top: 20px;
            }
        }

    </style>

</head>

<body>

<div class="header">
    💼 OCMRS - Edit Job
</div>

<div class="container">

    <div class="box">

        <h2>✏️ Edit Job</h2>

        <form action="<%= request.getContextPath() %>/JobServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="update">

            <input type="hidden"
                   name="jobId"
                   value="<%= job.getJobId() %>">


            <div class="form-grid">

                <!-- Job ID -->

                <div class="form-group">

                    <label>Job ID</label>

                    <input type="text"
                           class="job-id"
                           value="<%= job.getJobId() %>"
                           readonly>

                </div>


                <!-- Company -->

                <div class="form-group">

                    <label>Company *</label>

                    <select name="companyId" required>

                        <option value="">
                            -- Select Company --
                        </option>

                        <% if (companies != null) { %>

                            <% for (Company company : companies) { %>

                                <option
                                    value="<%= company.getCompanyId() %>"
                                    <%= company.getCompanyId() == job.getCompanyId()
                                        ? "selected"
                                        : "" %>>

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
                           value="<%= job.getTitle() != null
                                   ? job.getTitle()
                                   : "" %>"
                           required>

                </div>


                <!-- Salary -->

                <div class="form-group">

                    <label>Salary Range</label>

                    <input type="text"
                           name="salaryRange"
                           value="<%= job.getSalaryRange() != null
                                   ? job.getSalaryRange()
                                   : "" %>">

                </div>


                <!-- Location -->

                <div class="form-group">

                    <label>Location</label>

                    <input type="text"
                           name="location"
                           value="<%= job.getLocation() != null
                                   ? job.getLocation()
                                   : "" %>">

                </div>


                <!-- Last Date -->

                <div class="form-group">

                    <label>Application Last Date</label>

                    <input type="date"
                           name="lastDate"
                           value="<%= job.getLastDate() != null
                                   ? job.getLastDate()
                                   : "" %>">

                </div>


                <!-- Description -->

                <div class="form-group full">

                    <label>Job Description</label>

                    <textarea name="description"
                              placeholder="Enter job description"><%= job.getDescription() != null
                                ? job.getDescription()
                                : "" %></textarea>

                </div>

            </div>


            <div class="buttons">

                <button type="submit"
                        class="update-btn">
                    💾 Update Job
                </button>

                <a href="<%= request.getContextPath() %>/JobServlet"
                   class="cancel-btn">
                    ↩ Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>