<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>

<%
    Placement placement =
        (Placement) request.getAttribute("placement");

    List<Student> students =
        (List<Student>) request.getAttribute("students");

    List<Application> applications =
        (List<Application>) request.getAttribute("applications");

    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Placement</title>

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
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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

    <h1>Edit Placement</h1>

    <form action="/OCMRS/PlacementServlet" method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="placementId"
               value="<%= placement.getPlacementId() %>">


        <!-- STUDENT -->

        <label>Student:</label>

        <select name="studentId" required>

            <option value="">
                -- Select Student --
            </option>

            <%
                if (students != null) {

                    for (Student student :
                            students) {

                        if (student.getStudentId()
                                == placement.getStudentId()) {
            %>

            <option value="<%= student.getStudentId() %>"
                    selected>

                <%= student.getName() %>
                (ID: <%= student.getStudentId() %>)

            </option>

            <%
                        } else {
            %>

            <option value="<%= student.getStudentId() %>">

                <%= student.getName() %>
                (ID: <%= student.getStudentId() %>)

            </option>

            <%
                        }
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
                if (applications != null) {

                    for (Application app :
                            applications) {

                        if (app.getApplicationId()
                                == placement.getApplicationId()) {
            %>

            <option value="<%= app.getApplicationId() %>"
                    selected>

                Application #<%= app.getApplicationId() %>

            </option>

            <%
                        } else {
            %>

            <option value="<%= app.getApplicationId() %>">

                Application #<%= app.getApplicationId() %>

            </option>

            <%
                        }
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
                if (jobs != null) {

                    for (Job job :
                            jobs) {

                        if (job.getJobId()
                                == placement.getJobId()) {
            %>

            <option value="<%= job.getJobId() %>"
                    selected>

                <%= job.getTitle() %>
                (ID: <%= job.getJobId() %>)

            </option>

            <%
                        } else {
            %>

            <option value="<%= job.getJobId() %>">

                <%= job.getTitle() %>
                (ID: <%= job.getJobId() %>)

            </option>

            <%
                        }
                    }
                }
            %>

        </select>


        <!-- PLACEMENT DATE -->

        <label>Placement Date:</label>

        <input type="date"
               name="placementDate"
               value="<%= placement.getPlacementDate()
                    != null
                    ? placement.getPlacementDate()
                    : "" %>">


        <!-- PACKAGE -->

        <label>Package:</label>

        <input type="text"
               name="packageAmount"
               value="<%= placement.getPackageAmount()
                    != null
                    ? placement.getPackageAmount()
                    : "" %>"
               placeholder="Example: 6 LPA">


        <!-- STATUS -->

        <label>Status:</label>

        <select name="status">

            <option value="">
                -- Select Status --
            </option>

            <option value="Placed"
                <%= "Placed".equals(
                        placement.getStatus())
                        ? "selected"
                        : "" %>>

                Placed

            </option>

            <option value="Selected"
                <%= "Selected".equals(
                        placement.getStatus())
                        ? "selected"
                        : "" %>>

                Selected

            </option>

            <option value="Rejected"
                <%= "Rejected".equals(
                        placement.getStatus())
                        ? "selected"
                        : "" %>>

                Rejected

            </option>

            <option value="Pending"
                <%= "Pending".equals(
                        placement.getStatus())
                        ? "selected"
                        : "" %>>

                Pending

            </option>

        </select>


        <button type="submit">
            Update Placement
        </button>

    </form>



</div>

</body>

</html>