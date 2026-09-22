<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Job job = (Job) request.getAttribute("job");

    List<Company> companies =
        (List<Company>) request.getAttribute("companies");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Job</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: white;
            width: 90%;
            max-width: 650px;
            margin: 30px auto;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
        }

        button {
            margin-top: 20px;
            padding: 10px 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .back {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Job</h1>

    <form action="/OCMRS/JobServlet" method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="jobId"
               value="<%= job.getJobId() %>">


        <label>Company:</label>

        <select name="companyId" required>

            <option value="">
                -- Select Company --
            </option>

            <%
                if (companies != null) {

                    for (Company company : companies) {

                        if (company.getCompanyId()
                                == job.getCompanyId()) {
            %>

            <option value="<%= company.getCompanyId() %>"
                    selected>
                <%= company.getCompanyName() %>
            </option>

            <%
                        } else {
            %>

            <option value="<%= company.getCompanyId() %>">
                <%= company.getCompanyName() %>
            </option>

            <%
                        }
                    }
                }
            %>

        </select>


        <label>Job Title:</label>

        <input type="text"
               name="title"
               value="<%= job.getTitle() %>"
               required>


        <label>Description:</label>

        <textarea name="description"
                  rows="4"><%= job.getDescription() != null
                    ? job.getDescription()
                    : "" %></textarea>


        <label>Salary Range:</label>

        <input type="text"
               name="salaryRange"
               value="<%= job.getSalaryRange() != null
                    ? job.getSalaryRange()
                    : "" %>">


        <label>Location:</label>

        <input type="text"
               name="location"
               value="<%= job.getLocation() != null
                    ? job.getLocation()
                    : "" %>">


        <label>Last Date:</label>

        <input type="date"
               name="lastDate"
               value="<%= job.getLastDate() != null
                    ? job.getLastDate()
                    : "" %>">


        <button type="submit">
            Update Job
        </button>

    </form>


   

</div>

</body>
</html>