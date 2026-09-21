<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Student" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Application Management</title>

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
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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

<h1>Application Management</h1>


<!-- ADD APPLICATION -->

<div class="form-container">

    <h2>Add Application</h2>

    <form action="/OCMRS/ApplicationServlet" method="post">

        <input type="hidden"
               name="action"
               value="add">


        <label>Job:</label>

        <select name="jobId" required>

            <option value="">
                -- Select Job --
            </option>

            <%
                List<Job> jobs =
                    (List<Job>) request.getAttribute("jobs");

                if (jobs != null) {

                    for (Job job : jobs) {
            %>

            <option value="<%= job.getJobId() %>">
                <%= job.getTitle() %>
            </option>

            <%
                    }
                }
            %>

        </select>


        <label>Student:</label>

        <select name="studentId" required>

            <option value="">
                -- Select Student --
            </option>

            <%
                List<Student> students =
                    (List<Student>) request.getAttribute("students");

                if (students != null) {

                    for (Student student : students) {
            %>

            <option value="<%= student.getStudentId() %>">
                <%= student.getName() %>
            </option>

            <%
                    }
                }
            %>

        </select>


        <label>Application Date:</label>

        <input type="date"
               name="applicationDate">


        <label>Status:</label>

        <select name="status">

            <option value="Pending">
                Pending
            </option>

            <option value="Approved">
                Approved
            </option>

            <option value="Rejected">
                Rejected
            </option>

            <option value="Selected">
                Selected
            </option>

        </select>


        <button type="submit">
            Add Application
        </button>

    </form>

</div>


<!-- APPLICATION LIST -->

<h2 style="text-align:center;">
    Application List
</h2>


<table>

    <tr>

        <th>ID</th>
        <th>Job</th>
        <th>Student</th>
        <th>Application Date</th>
        <th>Status</th>
        <th>Actions</th>

    </tr>


<%
    List<Application> applications =
        (List<Application>)
        request.getAttribute("applications");

    if (applications != null
            && !applications.isEmpty()) {

        for (Application app : applications) {

            String jobTitle = "";
            String studentName = "";


            // FIND JOB NAME
            if (jobs != null) {

                for (Job job : jobs) {

                    if (job.getJobId()
                            == app.getJobId()) {

                        jobTitle =
                            job.getTitle();

                        break;
                    }
                }
            }


            // FIND STUDENT NAME
            if (students != null) {

                for (Student student : students) {

                    if (student.getStudentId()
                            == app.getStudentId()) {

                        studentName =
                            student.getName();

                        break;
                    }
                }
            }
%>

    <tr>

        <td>
            <%= app.getApplicationId() %>
        </td>

        <td>
            <%= jobTitle %>
        </td>

        <td>
            <%= studentName %>
        </td>

        <td>
            <%= app.getApplicationDate() != null
                ? app.getApplicationDate()
                : "" %>
        </td>

        <td>
            <%= app.getStatus() != null
                ? app.getStatus()
                : "" %>
        </td>

        <td>

            <a class="edit"
               href="/OCMRS/ApplicationServlet?action=edit&id=<%= app.getApplicationId() %>">
                Edit
            </a>

            <a class="delete"
               href="/OCMRS/ApplicationServlet?action=delete&id=<%= app.getApplicationId() %>"
               onclick="return confirm('Are you sure you want to delete this application?');">
                Delete
            </a>

        </td>

    </tr>

<%
        }

    } else {
%>

    <tr>

        <td colspan="6">
            No applications found.
        </td>

    </tr>

<%
    }
%>

</table>

</body>
</html>