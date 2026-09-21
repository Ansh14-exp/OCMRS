<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Placement Management</title>

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

<h1>Placement Management</h1>


<!-- ADD PLACEMENT -->

<div class="form-container">

    <h2>Add Placement</h2>

    <form action="/OCMRS/PlacementServlet" method="post">

        <input type="hidden"
               name="action"
               value="add">


        <!-- STUDENT -->

        <label>Student:</label>

        <select name="studentId" required>

            <option value="">
                -- Select Student --
            </option>

            <%
                List<Student> students =
                    (List<Student>)
                    request.getAttribute("students");

                if (students != null) {

                    for (Student student :
                            students) {
            %>

            <option value="<%= student.getStudentId() %>">

                <%= student.getName() %>

                (ID: <%= student.getStudentId() %>)

            </option>

            <%
                    }
                }
            %>

        </select>


        <!-- APPLICATION -->

        <label>Application:</label>

        <select name="applicationId" required>

            <option value="">
                -- Select Application --
            </option>

            <%
                List<Application> applications =
                    (List<Application>)
                    request.getAttribute("applications");

                if (applications != null) {

                    for (Application app :
                            applications) {
            %>

            <option value="<%= app.getApplicationId() %>">

                Application #<%= app.getApplicationId() %>

            </option>

            <%
                    }
                }
            %>

        </select>


        <!-- JOB -->

        <label>Job:</label>

        <select name="jobId" required>

            <option value="">
                -- Select Job --
            </option>

            <%
                List<Job> jobs =
                    (List<Job>)
                    request.getAttribute("jobs");

                if (jobs != null) {

                    for (Job job :
                            jobs) {
            %>

            <option value="<%= job.getJobId() %>">

                <%= job.getTitle() %>

                (ID: <%= job.getJobId() %>)

            </option>

            <%
                    }
                }
            %>

        </select>


        <!-- PLACEMENT DATE -->

        <label>Placement Date:</label>

        <input type="date"
               name="placementDate">


        <!-- PACKAGE -->

        <label>Package:</label>

        <input type="text"
               name="packageAmount"
               placeholder="Example: 6 LPA">


        <!-- STATUS -->

        <label>Status:</label>

        <select name="status">

            <option value="">
                -- Select Status --
            </option>

            <option value="Placed">
                Placed
            </option>

            <option value="Selected">
                Selected
            </option>

            <option value="Rejected">
                Rejected
            </option>

            <option value="Pending">
                Pending
            </option>

        </select>


        <button type="submit">
            Add Placement
        </button>

    </form>

</div>


<!-- PLACEMENT LIST -->

<h2 style="text-align:center;">
    Placement List
</h2>


<table>

    <tr>

        <th>ID</th>

        <th>Student</th>

        <th>Application</th>

        <th>Job</th>

        <th>Placement Date</th>

        <th>Package</th>

        <th>Status</th>

        <th>Actions</th>

    </tr>


<%

    List<Placement> placements =
        (List<Placement>)
        request.getAttribute("placements");


    if (placements != null
            && !placements.isEmpty()) {

        for (Placement placement :
                placements) {

%>

    <tr>

        <!-- ID -->

        <td>
            <%= placement.getPlacementId() %>
        </td>


        <!-- STUDENT -->

        <td>

            <%
                String studentName = "";

                if (students != null) {

                    for (Student student :
                            students) {

                        if (student.getStudentId()
                                == placement.getStudentId()) {

                            studentName =
                                student.getName();

                            break;
                        }
                    }
                }
            %>

            <%= studentName %>

        </td>


        <!-- APPLICATION -->

        <td>

            Application #
            <%= placement.getApplicationId() %>

        </td>


        <!-- JOB -->

        <td>

            <%
                String jobTitle = "";

                if (jobs != null) {

                    for (Job job :
                            jobs) {

                        if (job.getJobId()
                                == placement.getJobId()) {

                            jobTitle =
                                job.getTitle();

                            break;
                        }
                    }
                }
            %>

            <%= jobTitle %>

        </td>


        <!-- DATE -->

        <td>

            <%= placement.getPlacementDate()
                    != null
                    ? placement.getPlacementDate()
                    : "" %>

        </td>


        <!-- PACKAGE -->

        <td>

            <%= placement.getPackageAmount()
                    != null
                    ? placement.getPackageAmount()
                    : "" %>

        </td>


        <!-- STATUS -->

        <td>

            <%= placement.getStatus()
                    != null
                    ? placement.getStatus()
                    : "" %>

        </td>


        <!-- ACTIONS -->

        <td>

            <a class="edit"
               href="/OCMRS/PlacementServlet?action=edit&id=<%= placement.getPlacementId() %>">

                Edit

            </a>


            <a class="delete"
               href="/OCMRS/PlacementServlet?action=delete&id=<%= placement.getPlacementId() %>"
               onclick="return confirm('Are you sure you want to delete this placement?');">

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

            No placements found.

        </td>

    </tr>

<%

    }

%>

</table>


</body>

</html>