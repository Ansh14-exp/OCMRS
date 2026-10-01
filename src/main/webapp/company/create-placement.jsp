
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Company" %>

<%
    Application app =
        (Application) request.getAttribute("application");

    Company company =
        (Company) request.getAttribute("company");

    if (application == null || company == null) {
        response.sendRedirect(
            request.getContextPath() + "/CompanyApplicantsServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Create Placement</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f6f9;
    min-height: 100vh;
}

/* Header */

.header {
    background: #1e293b;
    color: white;
    padding: 18px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h2 {
    font-size: 22px;
}

.header span {
    font-size: 14px;
    color: #cbd5e1;
}

/* Container */

.container {
    width: 90%;
    max-width: 850px;
    margin: 35px auto;
}

/* Card */

.card {
    background: white;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
}

.card h2 {
    color: #1e293b;
    margin-bottom: 8px;
}

.subtitle {
    color: #64748b;
    margin-bottom: 25px;
}

/* Applicant Info */

.info-box {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 25px;
}

.info-box h3 {
    margin-bottom: 15px;
    color: #334155;
}

.info-row {
    display: flex;
    justify-content: space-between;
    padding: 9px 0;
    border-bottom: 1px solid #e5e7eb;
}

.info-row:last-child {
    border-bottom: none;
}

.label {
    font-weight: bold;
    color: #475569;
}

.value {
    color: #1e293b;
}

/* Form */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    color: #334155;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 12px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 15px;
    outline: none;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #2563eb;
}

/* Buttons */

.buttons {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.btn {
    padding: 12px 22px;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    text-decoration: none;
    font-size: 15px;
}

.submit-btn {
    background: #2563eb;
    color: white;
}

.submit-btn:hover {
    background: #1d4ed8;
}

.cancel-btn {
    background: #64748b;
    color: white;
}

.cancel-btn:hover {
    background: #475569;
}

</style>

</head>

<body>

<!-- Header -->

<div class="header">

    <h2>🏆 Create Placement</h2>

    <span>
        <%= company.getCompanyName() %>
    </span>

</div>


<div class="container">

    <div class="card">

        <h2>Create Placement</h2>

        <p class="subtitle">
            Create a placement record for the selected applicant.
        </p>


        <!-- Applicant Information -->

        <div class="info-box">

            <h3>👨‍🎓 Applicant Information</h3>

            <div class="info-row">

                <span class="label">
                    Student ID
                </span>

                <span class="value">
                    <%= app.getStudentId() %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Job
                </span>

                <span class="value">
                    <%= app.getJobTitle() != null
                        ? app.getJobTitle()
                        : "N/A" %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Company
                </span>

                <span class="value">
                    <%= app.getCompanyName() != null
                        ? app.getCompanyName()
                        : company.getCompanyName() %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Application Status
                </span>

                <span class="value">
                    <%= app.getStatus() %>
                </span>

            </div>

        </div>


        <!-- Placement Form -->

        <form
            action="<%= request.getContextPath() %>/CompanyPlacementSaveServlet"
            method="post">


            <!-- Hidden IDs -->

            <input
                type="hidden"
                name="applicationId"
                value="<%= app.getApplicationId() %>">

            <input
                type="hidden"
                name="studentId"
                value="<%= app.getStudentId() %>">

            <input
                type="hidden"
                name="jobId"
                value="<%= app.getJobId() %>">


            <!-- Placement Date -->

            <div class="form-group">

                <label for="placementDate">
                    Placement Date
                </label>

                <input
                    type="date"
                    id="placementDate"
                    name="placementDate"
                    required>

            </div>


            <!-- Package -->

            <div class="form-group">

                <label for="packageAmount">
                    Package
                </label>

                <input
                    type="text"
                    id="packageAmount"
                    name="packageAmount"
                    placeholder="Example: 6 LPA"
                    required>

            </div>


            <!-- Status -->

            <div class="form-group">

                <label for="status">
                    Placement Status
                </label>

                <select
                    id="status"
                    name="status"
                    required>

                    <option value="Placed">
                        Placed
                    </option>

                    <option value="Pending">
                        Pending
                    </option>

                </select>

            </div>


            <!-- Buttons -->

            <div class="buttons">

                <button
                    type="submit"
                    class="btn submit-btn">
                    🏆 Create Placement
                </button>

                <a
                    href="<%= request.getContextPath() %>/CompanyApplicantsServlet"
                    class="btn cancel-btn">
                    ← Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>