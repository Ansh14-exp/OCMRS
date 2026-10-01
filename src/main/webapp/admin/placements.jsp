<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Placement" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.Job" %>

<%
    List<Placement> placements =
            (List<Placement>) request.getAttribute("placements");

    List<Application> applications =
            (List<Application>) request.getAttribute("applications");

    List<Student> students =
            (List<Student>) request.getAttribute("students");

    List<Job> jobs =
            (List<Job>) request.getAttribute("jobs");

    if (placements == null) {
        placements = new java.util.ArrayList<Placement>();
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

<title>Placement Management | OCMRS</title>

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


/* =========================
   HEADER
   ========================= */

.header {
    background: linear-gradient(135deg, #172554, #2563eb);
    color: white;
    padding: 25px 35px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.10);
}

.header-content {
    max-width: 1400px;
    margin: auto;
}

.header h1 {
    font-size: 28px;
    margin-bottom: 7px;
}

.header p {
    font-size: 14px;
    opacity: 0.9;
}


/* =========================
   MAIN CONTAINER
   ========================= */

.container {
    width: 94%;
    max-width: 1400px;
    margin: 30px auto;
}


/* =========================
   STATS
   ========================= */

.stats {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.stat-card {
    background: white;
    padding: 22px;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.07);
    border-left: 5px solid #2563eb;
}

.stat-card h3 {
    font-size: 13px;
    color: #64748b;
    margin-bottom: 8px;
    text-transform: uppercase;
}

.stat-card .number {
    font-size: 27px;
    font-weight: bold;
    color: #172554;
}


/* =========================
   CARD
   ========================= */

.card {
    background: white;
    border-radius: 15px;
    padding: 28px;
    margin-bottom: 28px;
    box-shadow: 0 7px 25px rgba(0,0,0,0.07);
}

.card-title {
    font-size: 21px;
    font-weight: bold;
    color: #172554;
    margin-bottom: 22px;
    padding-bottom: 14px;
    border-bottom: 1px solid #e5e7eb;
}


/* =========================
   FORM
   ========================= */

.form-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full {
    grid-column: 1 / -1;
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
    transition: 0.2s;
}

input:focus,
select:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
}


/* =========================
   BUTTON
   ========================= */

.form-actions {
    margin-top: 25px;
    display: flex;
    gap: 12px;
}

.btn {
    border: none;
    padding: 12px 22px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
}

.btn-primary {
    background: #2563eb;
    color: white;
}

.btn-primary:hover {
    background: #1d4ed8;
}

.btn-secondary {
    background: #e5e7eb;
    color: #374151;
}

.btn-secondary:hover {
    background: #d1d5db;
}


/* =========================
   TABLE
   ========================= */

.table-wrapper {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 1000px;
}

thead {
    background: #172554;
    color: white;
}

th {
    padding: 14px 12px;
    text-align: left;
    font-size: 13px;
    white-space: nowrap;
}

td {
    padding: 14px 12px;
    border-bottom: 1px solid #e5e7eb;
    font-size: 13px;
    vertical-align: middle;
}

tbody tr:hover {
    background: #f8fafc;
}


/* =========================
   BADGES
   ========================= */

.badge {
    display: inline-block;
    padding: 6px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

.badge-selected {
    background: #dcfce7;
    color: #166534;
}

.badge-pending {
    background: #fef3c7;
    color: #92400e;
}

.badge-rejected {
    background: #fee2e2;
    color: #991b1b;
}

.badge-other {
    background: #dbeafe;
    color: #1e40af;
}


/* =========================
   ACTION BUTTONS
   ========================= */

.action-buttons {
    display: flex;
    gap: 7px;
}

.edit-btn,
.delete-btn {
    text-decoration: none;
    padding: 7px 12px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: bold;
}

.edit-btn {
    background: #dbeafe;
    color: #1d4ed8;
}

.edit-btn:hover {
    background: #bfdbfe;
}

.delete-btn {
    background: #fee2e2;
    color: #b91c1c;
}

.delete-btn:hover {
    background: #fecaca;
}


/* =========================
   EMPTY STATE
   ========================= */

.empty {
    text-align: center;
    padding: 45px 20px;
    color: #64748b;
}

.empty-icon {
    font-size: 45px;
    margin-bottom: 12px;
}

.empty h3 {
    color: #374151;
    margin-bottom: 6px;
}


/* =========================
   RESPONSIVE
   ========================= */

@media (max-width: 1000px) {

    .stats {
        grid-template-columns: repeat(2, 1fr);
    }

    .form-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 650px) {

    .stats {
        grid-template-columns: 1fr;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .container {
        width: 96%;
    }

    .card {
        padding: 20px;
    }

    .header {
        padding: 22px;
    }

    .header h1 {
        font-size: 23px;
    }
}

</style>

</head>


<body>


<!-- =========================
     HEADER
     ========================= -->

<div class="header">

    <div class="header-content">

        <h1>Placement Management</h1>

        <p>
            Manage student placements, companies, jobs and placement records
        </p>

    </div>

</div>


<div class="container">


<!-- =========================
     STATISTICS
     ========================= -->

<%
    int totalPlacements = placements.size();

    int selectedCount = 0;
    int pendingCount = 0;
    int rejectedCount = 0;

    for (Placement p : placements) {

        String status = p.getStatus();

        if (status != null) {

            if ("Selected".equalsIgnoreCase(status)) {
                selectedCount++;
            }

            else if ("Pending".equalsIgnoreCase(status)) {
                pendingCount++;
            }

            else if ("Rejected".equalsIgnoreCase(status)) {
                rejectedCount++;
            }
        }
    }
%>

<div class="stats">

    <div class="stat-card">

        <h3>Total Placements</h3>

        <div class="number">
            <%= totalPlacements %>
        </div>

    </div>


    <div class="stat-card">

        <h3>Selected</h3>

        <div class="number">
            <%= selectedCount %>
        </div>

    </div>


    <div class="stat-card">

        <h3>Pending</h3>

        <div class="number">
            <%= pendingCount %>
        </div>

    </div>


    <div class="stat-card">

        <h3>Rejected</h3>

        <div class="number">
            <%= rejectedCount %>
        </div>

    </div>

</div>


<!-- =========================
     ADD PLACEMENT
     ========================= -->

<div class="card">

    <div class="card-title">
        Add New Placement
    </div>


    <form action="<%= request.getContextPath() %>/PlacementServlet"
          method="post">

        <input type="hidden"
               name="action"
               value="add">


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

                        <option value="<%= student.getStudentId() %>">

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

                        <option value="<%= app.getApplicationId() %>">

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

                        <option value="<%= job.getJobId() %>">

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
                       name="placementDate">

            </div>


            <!-- PACKAGE -->

            <div class="form-group">

                <label for="package">
                    Package
                </label>

                <input type="text"
                       id="package"
                       name="package"
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

                    <option value="Selected">
                        Selected
                    </option>

                    <option value="Pending">
                        Pending
                    </option>

                    <option value="Rejected">
                        Rejected
                    </option>

                </select>

            </div>

        </div>


        <div class="form-actions">

            <button type="submit"
                    class="btn btn-primary">

                + Add Placement

            </button>

            <button type="reset"
                    class="btn btn-secondary">

                Reset

            </button>

        </div>

    </form>

</div>


<!-- =========================
     PLACEMENT LIST
     ========================= -->

<div class="card">

    <div class="card-title">
        Placement Records
    </div>


    <% if (placements.isEmpty()) { %>

        <div class="empty">

            <div class="empty-icon">
                📋
            </div>

            <h3>No Placement Records Found</h3>

            <p>
                Add a placement record using the form above.
            </p>

        </div>

    <% } else { %>


        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Student</th>

                        <th>Application</th>

                        <th>Job</th>

                        <th>Company</th>

                        <th>Placement Date</th>

                        <th>Package</th>

                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                </thead>


                <tbody>

                <% for (Placement placement : placements) { %>

                    <tr>


                        <!-- ID -->

                        <td>

                            <strong>
                                #<%= placement.getPlacementId() %>
                            </strong>

                        </td>


                        <!-- STUDENT -->

                        <td>

                            <%
                                String studentName =
                                        "Student #" +
                                        placement.getStudentId();

                                for (Student student : students) {

                                    if (student.getStudentId()
                                            == placement.getStudentId()) {

                                        studentName =
                                                student.getName();

                                        break;
                                    }
                                }
                            %>

                            <strong>
                                <%= studentName %>
                            </strong>

                            <br>

                            <small style="color:#64748b;">
                                ID:
                                <%= placement.getStudentId() %>
                            </small>

                        </td>


                        <!-- APPLICATION -->

                        <td>

                            #APP<%= placement.getApplicationId() %>

                        </td>


                        <!-- JOB -->

                        <td>

                            <strong>
                                <%= placement.getJobTitle() != null
                                    ? placement.getJobTitle()
                                    : "Job #" + placement.getJobId() %>
                            </strong>

                        </td>


                        <!-- COMPANY -->

                        <td>

                            <%= placement.getCompanyName() != null
                                ? placement.getCompanyName()
                                : "—" %>

                        </td>


                        <!-- DATE -->

                        <td>

                            <%= placement.getPlacementDate() != null
                                ? placement.getPlacementDate()
                                : "—" %>

                        </td>


                        <!-- PACKAGE -->

                        <td>

                            <strong>

                                <%= placement.getPackageAmount() != null
                                    ? placement.getPackageAmount()
                                    : "—" %>

                            </strong>

                        </td>


                        <!-- STATUS -->

                        <td>

                            <%
                                String status =
                                        placement.getStatus();

                                String badgeClass =
                                        "badge-other";

                                if (status != null) {

                                    if ("Selected"
                                            .equalsIgnoreCase(status)) {

                                        badgeClass =
                                                "badge-selected";

                                    } else if ("Pending"
                                            .equalsIgnoreCase(status)) {

                                        badgeClass =
                                                "badge-pending";

                                    } else if ("Rejected"
                                            .equalsIgnoreCase(status)) {

                                        badgeClass =
                                                "badge-rejected";
                                    }
                                }
                            %>

                            <span class="badge <%= badgeClass %>">

                                <%= status != null
                                    ? status
                                    : "N/A" %>

                            </span>

                        </td>


                        <!-- ACTIONS -->

                        <td>

                            <div class="action-buttons">


                                <a class="edit-btn"
                                   href="<%= request.getContextPath() %>/PlacementServlet?action=edit&placementId=<%= placement.getPlacementId() %>">

                                    Edit

                                </a>


                                <a class="delete-btn"
                                   href="<%= request.getContextPath() %>/PlacementServlet?action=delete&placementId=<%= placement.getPlacementId() %>"
                                   onclick="return confirm('Are you sure you want to delete this placement?');">

                                    Delete

                                </a>


                            </div>

                        </td>


                    </tr>

                <% } %>

                </tbody>

            </table>

        </div>


    <% } %>

</div>


</div>

</body>
</html>