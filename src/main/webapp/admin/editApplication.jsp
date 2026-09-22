<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    Application app =
        (Application) request.getAttribute("application");

    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");

    List<Student> students =
        (List<Student>) request.getAttribute("students");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Application</title>

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

    <h1>Edit Application</h1>

    <form action="/OCMRS/ApplicationServlet" method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="applicationId"
               value="<%= app.getApplicationId() %>">


        <label>Job:</label>

        <select name="jobId" required>

            <option value="">
                -- Select Job --
            </option>

            <%
                if (jobs != null) {

                    for (Job job : jobs) {

                        if (job.getJobId() == app.getJobId()) {
            %>

            <option value="<%= job.getJobId() %>"
                    selected>
                <%= job.getTitle() %>
            </option>

            <%
                        } else {
            %>

            <option value="<%= job.getJobId() %>">
                <%= job.getTitle() %>
            </option>

            <%
                        }
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
                if (students != null) {

                    for (Student student : students) {

                        if (student.getStudentId()
                                == app.getStudentId()) {
            %>

            <option value="<%= student.getStudentId() %>"
                    selected>
                <%= student.getName() %>
            </option>

            <%
                        } else {
            %>

            <option value="<%= student.getStudentId() %>">
                <%= student.getName() %>
            </option>

            <%
                        }
                    }
                }
            %>

        </select>


        <label>Application Date:</label>

        <input type="date"
               name="applicationDate"
               value="<%= app.getApplicationDate() != null
                    ? app.getApplicationDate()
                    : "" %>">


        <label>Status:</label>

        <select name="status">

            <option value="Pending"
                <%= "Pending".equals(app.getStatus())
                    ? "selected"
                    : "" %>>
                Pending
            </option>

            <option value="Approved"
                <%= "Approved".equals(app.getStatus())
                    ? "selected"
                    : "" %>>
                Approved
            </option>

            <option value="Rejected"
                <%= "Rejected".equals(app.getStatus())
                    ? "selected"
                    : "" %>>
                Rejected
            </option>

            <option value="Selected"
                <%= "Selected".equals(app.getStatus())
                    ? "selected"
                    : "" %>>
                Selected
            </option>

        </select>


        <button type="submit">
            Update Application
        </button>

    </form>


    

</div>

</body>

</html>