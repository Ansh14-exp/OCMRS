<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Company" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Management</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-container {
            background: white;
            padding: 20px;
            margin: 20px auto;
            width: 90%;
            max-width: 700px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            margin-top: 0;
            color: #444;
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 98%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .edit,
        .delete {
            display: inline-block;
            padding: 6px 12px;
            margin: 3px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .edit {
            background-color: #007bff;
        }

        .edit:hover {
            background-color: #0056b3;
        }

        .delete {
            background-color: #dc3545;
        }

        .delete:hover {
            background-color: #b02a37;
        }

    </style>
</head>

<body>

<h1>Job Management</h1>


<!-- ADD JOB FORM -->

<div class="form-container">

    <h2>Add Job</h2>

    <form action="/OCMRS/JobServlet" method="post">

        <input type="hidden"
               name="action"
               value="add">


        <label>Company:</label>

        <select name="companyId" required>

            <option value="">-- Select Company --</option>

            <%
                List<Company> companies =
                    (List<Company>) request.getAttribute("companies");

                if (companies != null) {

                    for (Company company : companies) {
            %>

                <option value="<%= company.getCompanyId() %>">
                    <%= company.getCompanyName() %>
                </option>

            <%
                    }
                }
            %>

        </select>


        <label>Job Title:</label>

        <input type="text"
               name="title"
               required>


        <label>Description:</label>

        <textarea name="description"
                  rows="4"></textarea>


        <label>Salary Range:</label>

        <input type="text"
               name="salaryRange"
               placeholder="Example: 4-6 LPA">


        <label>Location:</label>

        <input type="text"
               name="location">


        <label>Last Date:</label>

        <input type="date"
               name="lastDate">


        <button type="submit">
            Add Job
        </button>

    </form>

</div>


<!-- JOB LIST -->

<h2 style="text-align:center;">
    Job List
</h2>

<table>

    <tr>

        <th>ID</th>
        <th>Company</th>
        <th>Job Title</th>
        <th>Description</th>
        <th>Salary Range</th>
        <th>Location</th>
        <th>Last Date</th>
        <th>Actions</th>

    </tr>


<%
    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");

    if (jobs != null && !jobs.isEmpty()) {

        for (Job job : jobs) {

            String companyName = "";

            if (companies != null) {

                for (Company company : companies) {

                    if (company.getCompanyId() == job.getCompanyId()) {

                        companyName = company.getCompanyName();

                        break;
                    }
                }
            }
%>

    <tr>

        <td>
            <%= job.getJobId() %>
        </td>

        <td>
            <%= companyName %>
        </td>

        <td>
            <%= job.getTitle() %>
        </td>

        <td>
            <%= job.getDescription() != null
                ? job.getDescription()
                : "" %>
        </td>

        <td>
            <%= job.getSalaryRange() != null
                ? job.getSalaryRange()
                : "" %>
        </td>

        <td>
            <%= job.getLocation() != null
                ? job.getLocation()
                : "" %>
        </td>

        <td>
            <%= job.getLastDate() != null
                ? job.getLastDate()
                : "" %>
        </td>

        <td>

            <a class="edit"
               href="/OCMRS/JobServlet?action=edit&id=<%= job.getJobId() %>">
                Edit
            </a>

            <a class="delete"
               href="/OCMRS/JobServlet?action=delete&id=<%= job.getJobId() %>"
               onclick="return confirm('Are you sure you want to delete this job?');">
                Delete
            </a>

        </td>

    </tr>

<%
        }

    } else {
%>

    <tr>

        <td colspan="8">
            No jobs found.
        </td>

    </tr>

<%
    }
%>

</table>

</body>
</html>