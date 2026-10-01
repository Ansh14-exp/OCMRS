<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.Job" %>

<%
    Placement placement =
            (Placement) request.getAttribute("placement");

    List<Application> applications =
            (List<Application>) request.getAttribute("applications");

    List<Student> students =
            (List<Student>) request.getAttribute("students");

    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    if (placement == null) {
        response.sendRedirect(
                request.getContextPath() + "/PlacementServlet");
        return;
    }

    if (applications == null) {
        applications = new java.util.ArrayList<Application>();
    }

    if (students == null) {
        students = new java.util.ArrayList<Student>();
    }

    if (jobs == null) {
        jobs = new java.util.ArrayList<Job>();
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Placement | OCMRS</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f4f7fb;
    color: #1f2937;
}

.container {
    width: 92%;
    max-width: 900px;
    margin: 40px auto;
}

.header {
    background: linear-gradient(135deg, #172554, #2563eb);
    color: white;
    padding: 27px 32px;
    border-radius: 15px 15px 0 0;
}

.header h1 {
    font-size: 27px;
    margin-bottom: 7px;
}

.header p {
    font-size: 14px;
    opacity: 0.9;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 0 0 15px 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.info {
    background: #eef4ff;
    border-left: 4px solid #2563eb;
    padding: 14px 16px;
    margin-bottom: 27px;
    border-radius: 6px;
    color: #304b80;
    font-size: 14px;
}

.info strong {
    color: #172554;
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 22px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

label {
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #374151;
}

input,
select {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #cbd5e1;
    border-radius: 8px;
    font-size: 14px;
    background: white;
    color: #1f2937;
    outline: none;
}

input:focus,
select:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
}

.button-area {
    display: flex;
    gap: 12px;
    margin-top: 28px;
}

.update-btn,
.cancel-btn {
    padding: 12px 22px;
    border-radius: 8px;
    border: none;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
}

.update-btn {
    background: #2563eb;
    color: white;
}

.update-btn:hover {
    background: #1d4ed8;
}

.cancel-btn {
    background: #e5e7eb;
    color: #374151;
}

.cancel-btn:hover {
    background: #d1d5db;
}

@media (max-width: 650px) {

    .container {
        width: 95%;
        margin: 20px auto;
    }

    .card {
        padding: 20px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .header {
        padding: 22px;
    }

    .header h1 {
        font-size: 23px;
    }

    .button-area {
        flex-direction: column;
    }

    .update-btn,
    .cancel-btn {
        text-align: center;
    }
}

</style>

</head>

<body>


<div class="container">


    <!-- HEADER -->

    <div class="header">

        <h1>Edit Placement</h1>

        <p>
            Update placement information
        </p>

    </div>


    <!-- FORM CARD -->

    <div class="card">


        <div class="info">

            Editing Placement

            <strong>
                #<%= placement.getPlacementId() %>
            </strong>

        </div>


        <form action="<%= request.getContextPath() %>/PlacementServlet"
              method="post">


            <input type="hidden"
                   name="action"
                   value="update">


            <input type="hidden"
                   name="placementId"
                   value="<%= placement.getPlacementId() %>">


            <div class="form-grid">


                <!-- STUDENT -->

                <div class="form-group">

                    <label for="studentId">
                        Student
                    </label>

                    <select id="studentId"
                            name="studentId"
                            required>

                        <option value="">
                            -- Select Student --
                        </option>


                        <% for (Student student : students) { %>

                            <option
                                value="<%= student.getStudentId() %>"
                                <%= student.getStudentId()
                                    == placement.getStudentId()
                                    ? "selected"
                                    : "" %>>

                                <%= student.getStudentId() %>
                                -
                                <%= student.getName() %>

                            </option>

                        <% } %>

                    </select>

                </div>


                <!-- APPLICATION -->

                <div class="form-group">

                    <label for="applicationId">
                        Application
                    </label>

                    <select id="applicationId"
                            name="applicationId"
                            required>

                        <option value="">
                            -- Select Application --
                        </option>


                        <% for (Application app : applications) { %>

                            <option
                                value="<%= app.getApplicationId() %>"
                                <%= app.getApplicationId()
                                    == placement.getApplicationId()
                                    ? "selected"
                                    : "" %>>

                                #APP<%= app.getApplicationId() %>
                                -
                                <%= app.getJobTitle() %>
                                -
                                <%= app.getCompanyName() %>

                            </option>

                        <% } %>

                    </select>

                </div>


                <!-- JOB -->

                <div class="form-group">

                    <label for="jobId">
                        Job
                    </label>

                    <select id="jobId"
                            name="jobId"
                            required>

                        <option value="">
                            -- Select Job --
                        </option>


                        <% for (Job job : jobs) { %>

                            <option
                                value="<%= job.getJobId() %>"
                                <%= job.getJobId()
                                    == placement.getJobId()
                                    ? "selected"
                                    : "" %>>

                                <%= job.getJobId() %>
                                -
                                <%= job.getTitle() %>

                            </option>

                        <% } %>

                    </select>

                </div>


                <!-- PLACEMENT DATE -->

                <div class="form-group">

                    <label for="placementDate">
                        Placement Date
                    </label>

                    <input type="date"
                           id="placementDate"
                           name="placementDate"
                           value="<%= placement.getPlacementDate() != null
                                   ? placement.getPlacementDate()
                                   : "" %>"
                           required>

                </div>


                <!-- PACKAGE -->

                <div class="form-group">

                    <label for="package">
                        Package
                    </label>

                    <input type="text"
                           id="package"
                           name="package"
                           value="<%= placement.getPackageAmount() != null
                                   ? placement.getPackageAmount()
                                   : "" %>"
                           placeholder="Example: 6 LPA"
                           maxlength="50">

                </div>


                <!-- STATUS -->

                <div class="form-group">

                    <label for="status">
                        Status
                    </label>

                    <select id="status"
                            name="status"
                            required>

                        <option value="">
                            -- Select Status --
                        </option>

                        <option value="Selected"
                            <%= "Selected".equalsIgnoreCase(
                                    placement.getStatus())
                                ? "selected"
                                : "" %>>

                            Selected

                        </option>

                        <option value="Pending"
                            <%= "Pending".equalsIgnoreCase(
                                    placement.getStatus())
                                ? "selected"
                                : "" %>>

                            Pending

                        </option>

                        <option value="Rejected"
                            <%= "Rejected".equalsIgnoreCase(
                                    placement.getStatus())
                                ? "selected"
                                : "" %>>

                            Rejected

                        </option>

                    </select>

                </div>

            </div>


            <!-- BUTTONS -->

            <div class="button-area">

                <button type="submit"
                        class="update-btn">

                    Update Placement

                </button>


                <a href="<%= request.getContextPath() %>/PlacementServlet"
                   class="cancel-btn">

                    Cancel

                </a>

            </div>


        </form>

    </div>

</div>

</body>
</html>