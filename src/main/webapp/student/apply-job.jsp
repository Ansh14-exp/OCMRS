<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");

    Job selectedJob =
        (Job) request.getAttribute("job");

    Student student =
        (Student) request.getAttribute("student");

    if (jobs == null) {
        jobs = new java.util.ArrayList<Job>();
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Apply for Job - OCMRS</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f7fc;
    color: #222;
    display: flex;
    min-height: 100vh;
}

/* ================= SIDEBAR ================= */

.sidebar {
    width: 250px;
    min-height: 100vh;

    background: #4f46e5;

    color: white;

    padding: 25px 15px;

    flex-shrink: 0;
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    font-size: 25px;
    margin-bottom: 5px;
}

.logo p {
    font-size: 13px;
    opacity: 0.85;
}

/* IMPORTANT */

.menu {
    list-style: none !important;
    margin: 0 !important;
    padding: 0 !important;
    display: block !important;
    width: 100% !important;
}

.menu li {
    display: block !important;
    list-style: none !important;
    width: 100% !important;
    margin: 0 0 8px 0 !important;
    padding: 0 !important;
}

.menu a {
    display: flex !important;

    flex-direction: row !important;

    align-items: center;

    gap: 12px;

    width: 100% !important;

    padding: 13px 15px;

    color: white;

    text-decoration: none;

    border-radius: 8px;

    font-size: 14px;

    transition: 0.3s;
}

.menu a:hover {
    background: rgba(255,255,255,0.15);
}

.menu a.active {
    background: rgba(255,255,255,0.22);
    font-weight: bold;
}

/* ================= MAIN ================= */

.main {
    flex: 1;

    padding: 30px;

    overflow-x: auto;
}

/* ================= HEADER ================= */

.header {
    background:
        linear-gradient(
            135deg,
            #2563eb,
            #7c3aed
        );

    color: white;

    padding: 25px;

    border-radius: 15px;

    margin-bottom: 25px;
}

.header h1 {
    font-size: 28px;
}

.header p {
    margin-top: 8px;
    color: #e0e7ff;
}

/* ================= FORM ================= */

.form-container {
    max-width: 950px;

    background: white;

    padding: 30px;

    border-radius: 18px;

    box-shadow:
        0 8px 25px rgba(0,0,0,0.08);
}

.form-title {
    font-size: 22px;

    color: #1e293b;

    margin-bottom: 25px;

    border-left:
        5px solid #2563eb;

    padding-left: 12px;
}

/* ================= JOB SELECT ================= */

.job-select-box {
    background: #eff6ff;

    border: 1px solid #bfdbfe;

    padding: 20px;

    border-radius: 12px;

    margin-bottom: 25px;
}

.job-select-box label {
    display: block;

    margin-bottom: 10px;

    font-weight: bold;

    color: #1e3a8a;
}

.job-select-box select {
    width: 100%;

    padding: 13px;

    border:
        1px solid #93c5fd;

    border-radius: 8px;

    background: white;

    font-size: 14px;
}

/* ================= JOB BOX ================= */

.job-box {
    background: #f8fafc;

    border:
        1px solid #e2e8f0;

    padding: 18px;

    border-radius: 12px;

    margin-bottom: 25px;
}

.job-box h3 {
    color: #1d4ed8;

    margin-bottom: 10px;
}

.job-box p {
    color: #475569;

    margin: 6px 0;

    font-size: 14px;
}

/* ================= FORM ================= */

.form-row {
    display: flex;

    gap: 20px;
}

.form-group {
    flex: 1;

    margin-bottom: 20px;
}

label {
    display: block;

    margin-bottom: 8px;

    font-weight: bold;

    color: #334155;
}

input,
select,
textarea {
    width: 100%;

    padding: 12px 14px;

    border:
        1px solid #cbd5e1;

    border-radius: 9px;

    font-size: 14px;

    outline: none;
}

input:focus,
select:focus,
textarea:focus {
    border-color: #2563eb;

    box-shadow:
        0 0 0 3px rgba(37,99,235,0.1);
}

textarea {
    height: 130px;

    resize: vertical;
}

input[readonly] {
    background: #f8fafc;
}

/* ================= BUTTONS ================= */

.buttons {
    display: flex;

    gap: 15px;

    margin-top: 10px;
}

.btn {
    padding: 13px 28px;

    border: none;

    border-radius: 9px;

    font-size: 15px;

    cursor: pointer;

    text-decoration: none;

    display: inline-block;
}

.apply-btn {
    background:
        linear-gradient(
            90deg,
            #2563eb,
            #7c3aed
        );

    color: white;
}

.apply-btn:hover {
    opacity: 0.9;
}

.cancel-btn {
    background: #e2e8f0;

    color: #334155;
}

.cancel-btn:hover {
    background: #cbd5e1;
}

/* ================= EMPTY ================= */

.empty-box {
    background: white;

    padding: 45px 20px;

    text-align: center;

    border-radius: 15px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);
}

.empty-box h3 {
    margin-bottom: 10px;
}

.empty-box p {
    color: #64748b;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 800px) {

    body {
        flex-direction: column;
    }

    .sidebar {
        width: 100%;
        min-height: auto;
    }

    .main {
        padding: 20px;
    }

    .form-row {
        flex-direction: column;
        gap: 0;
    }
}

</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">

        <h2>OCMRS</h2>

        <p>Student Portal</p>

    </div>


    <ul class="menu">

        <li>
            <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                🏠 Dashboard
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/StudentServlet">
                👤 Profile
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/EnrollmentServlet">
                📚 Enrollment
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/SubjectServlet">
                📖 Subjects
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ExamServlet">
                📝 Exams
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ResultServlet">
                📊 Results
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/JobServlet">
                💼 Jobs
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ApplicationServlet?action=apply"
   class="active">
    📨 Apply Job
</a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/ApplicationServlet">
                📄 Applications
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/PlacementServlet">
                🎓 Placement
            </a>
        </li>

        <li>
            <a href="<%= request.getContextPath() %>/LogoutServlet">
                🚪 Logout
            </a>
        </li>

    </ul>

</div>


<!-- ================= MAIN ================= -->

<div class="main">

    <div class="header">

        <h1>📨 Apply for Job</h1>

        <p>
            Apply for available placement opportunities.
        </p>

    </div>


    <div class="form-container">

        <h2 class="form-title">
            Job Application Form
        </h2>


        <% if (jobs.isEmpty()) { %>

            <div class="empty-box">

                <h3>📭 No Jobs Available</h3>

                <p>
                    Currently there are no jobs available
                    for application.
                </p>

            </div>

        <% } else { %>


            <!-- ================= JOB SELECTION ================= -->

            <div class="job-select-box">

                <label for="jobSelect">
                    Select Job
                </label>

                <select id="jobSelect"
                        onchange="changeJob(this.value)"
                        required>

                    <option value="">
                        -- Select a Job --
                    </option>

                    <%
                        for (Job job : jobs) {
                    %>

                        <option
                            value="<%= job.getJobId() %>"
                            <%= selectedJob != null &&
                                selectedJob.getJobId()
                                == job.getJobId()
                                ? "selected"
                                : "" %>>

                            <%= job.getTitle() %>

                        </option>

                    <%
                        }
                    %>

                </select>

            </div>


            <!-- ================= SELECTED JOB ================= -->

            <%
                if (selectedJob != null) {
            %>

                <div class="job-box">

                    <h3>
                        <%= selectedJob.getTitle() %>
                    </h3>

                    <p>
                        <strong>Company ID:</strong>
                        <%= selectedJob.getCompanyId() %>
                    </p>

                    <p>
                        <strong>Location:</strong>
                        <%= selectedJob.getLocation() %>
                    </p>

                    <p>
                        <strong>Salary:</strong>
                        <%= selectedJob.getSalaryRange() %>
                    </p>

                    <p>
                        <strong>Last Date:</strong>
                        <%= selectedJob.getLastDate() %>
                    </p>

                    <p>
                        <strong>Description:</strong>
                        <%= selectedJob.getDescription() %>
                    </p>

                </div>

            <%
                }
            %>


            <!-- ================= APPLICATION FORM ================= -->

            <form action="<%= request.getContextPath() %>/ApplicationServlet"
                  method="post">

                <input type="hidden"
                       name="jobId"
                       value="<%= selectedJob != null
                               ? selectedJob.getJobId()
                               : "" %>">


                <!-- Student Information -->

                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Student Name
                        </label>

                        <input
                            type="text"
                            name="studentName"
                            value="<%= student != null
                                    ? student.getName()
                                    : "" %>"
                            readonly>

                    </div>


                    <div class="form-group">

                        <label>
                            Student ID
                        </label>

                        <input
                            type="text"
                            name="studentIdDisplay"
                            value="<%= student != null
                                    ? student.getStudentId()
                                    : "" %>"
                            readonly>

                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Email
                        </label>

                        <input
                            type="email"
                            name="email"
                            value="<%= student != null
                                    ? student.getEmail()
                                    : "" %>"
                            readonly>

                    </div>


                    <div class="form-group">

                        <label>
                            Phone Number
                        </label>

                        <input
                            type="text"
                            name="phone"
                            value="<%= student != null
                                    ? student.getPhone()
                                    : "" %>"
                            readonly>

                    </div>

                </div>


                <!-- Application Message -->

                <div class="form-group">

                    <label>
                        Application Message
                    </label>

                    <textarea
                        name="message"
                        placeholder="Write a short message about why you are applying..."
                        required></textarea>

                </div>


                <!-- Buttons -->

                <div class="buttons">

                    <button
                        type="submit"
                        class="btn apply-btn"
                        <%= selectedJob == null
                            ? "disabled"
                            : "" %>>

                        Submit Application

                    </button>


                    <a
                        href="<%= request.getContextPath() %>/JobServlet"
                        class="btn cancel-btn">

                        Cancel

                    </a>

                </div>

            </form>

        <% } %>

    </div>

</div>


<script>

function changeJob(jobId) {

    if (jobId !== "") {

        window.location.href =
            "<%= request.getContextPath() %>/ApplicationServlet?jobId="
            + jobId;

    }

}

</script>

</body>

</html>