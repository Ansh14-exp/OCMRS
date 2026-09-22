<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Student" %>
<%@ page import="com.ocmrs.model.College" %>
<%@ page import="com.ocmrs.model.Company" %>
<%@ page import="com.ocmrs.model.Job" %>
<%@ page import="com.ocmrs.model.Application" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Placement" %>

<%
    List<Student> students =
        (List<Student>) request.getAttribute("students");

    List<College> colleges =
        (List<College>) request.getAttribute("colleges");

    List<Company> companies =
        (List<Company>) request.getAttribute("companies");

    List<Job> jobs =
        (List<Job>) request.getAttribute("jobs");

    List<Application> applications =
        (List<Application>) request.getAttribute("applications");

    List<Interview> interviews =
        (List<Interview>) request.getAttribute("interviews");

    List<Placement> placements =
        (List<Placement>) request.getAttribute("placements");


    int studentCount =
        students != null ? students.size() : 0;

    int collegeCount =
        colleges != null ? colleges.size() : 0;

    int companyCount =
        companies != null ? companies.size() : 0;

    int jobCount =
        jobs != null ? jobs.size() : 0;

    int applicationCount =
        applications != null ? applications.size() : 0;

    int interviewCount =
        interviews != null ? interviews.size() : 0;

    int placementCount =
        placements != null ? placements.size() : 0;
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Reports</title>

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
            margin-bottom: 30px;
        }

        .report-container {
            width: 95%;
            max-width: 1100px;
            margin: auto;
        }

        .cards {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(220px, 1fr));

            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow:
                0 2px 8px rgba(0,0,0,0.1);

            text-align: center;
        }

        .card h2 {
            margin: 0;
            font-size: 18px;
            color: #555;
        }

        .number {
            font-size: 38px;
            font-weight: bold;
            color: #007bff;
            margin-top: 15px;
        }

        .section {
            background: white;
            margin-top: 30px;
            padding: 25px;
            border-radius: 10px;
            box-shadow:
                0 2px 8px rgba(0,0,0,0.1);
        }

        .section h2 {
            margin-top: 0;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
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

        .back {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 18px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .back:hover {
            background-color: #0056b3;
        }

    </style>

</head>

<body>

<div class="report-container">

    <h1>📊 Admin Reports</h1>


    <!-- SUMMARY CARDS -->

    <div class="cards">

        <div class="card">

            <h2>Total Students</h2>

            <div class="number">
                <%= studentCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Colleges</h2>

            <div class="number">
                <%= collegeCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Companies</h2>

            <div class="number">
                <%= companyCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Jobs</h2>

            <div class="number">
                <%= jobCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Applications</h2>

            <div class="number">
                <%= applicationCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Interviews</h2>

            <div class="number">
                <%= interviewCount %>
            </div>

        </div>


        <div class="card">

            <h2>Total Placements</h2>

            <div class="number">
                <%= placementCount %>
            </div>

        </div>

    </div>


    <!-- PLACEMENT REPORT -->

    <div class="section">

        <h2>Placement Report</h2>

        <table>

            <tr>

                <th>Placement ID</th>
                <th>Student ID</th>
                <th>Application ID</th>
                <th>Job ID</th>
                <th>Placement Date</th>
                <th>Package</th>
                <th>Status</th>

            </tr>

            <%
                if (placements != null
                        && !placements.isEmpty()) {

                    for (Placement placement :
                            placements) {
            %>

            <tr>

                <td>
                    <%= placement.getPlacementId() %>
                </td>

                <td>
                    <%= placement.getStudentId() %>
                </td>

                <td>
                    <%= placement.getApplicationId() %>
                </td>

                <td>
                    <%= placement.getJobId() %>
                </td>

                <td>
                    <%= placement.getPlacementDate()
                            != null
                            ? placement.getPlacementDate()
                            : "" %>
                </td>

                <td>
                    <%= placement.getPackageAmount()
                            != null
                            ? placement.getPackageAmount()
                            : "" %>
                </td>

                <td>
                    <%= placement.getStatus()
                            != null
                            ? placement.getStatus()
                            : "" %>
                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="7">
                    No placement records found.
                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>


    <!-- APPLICATION REPORT -->

    <div class="section">

        <h2>Application Report</h2>

        <table>

            <tr>

                <th>Application ID</th>
                <th>Job ID</th>
                <th>Student ID</th>
                <th>Application Date</th>
                <th>Status</th>

            </tr>

            <%
                if (applications != null
                        && !applications.isEmpty()) {

                    for (Application app :
                            applications) {
            %>

            <tr>

                <td>
                    <%= app.getApplicationId() %>
                </td>

                <td>
                    <%= app.getJobId() %>
                </td>

                <td>
                    <%= app.getStudentId() %>
                </td>

                <td>
                    <%= app.getApplicationDate()
                            != null
                            ? app.getApplicationDate()
                            : "" %>
                </td>

                <td>
                    <%= app.getStatus()
                            != null
                            ? app.getStatus()
                            : "" %>
                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="5">
                    No application records found.
                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>


    <!-- INTERVIEW REPORT -->

    <div class="section">

        <h2>Interview Report</h2>

        <table>

            <tr>

                <th>Interview ID</th>
                <th>Application ID</th>
                <th>Interview Date</th>
                <th>Mode</th>
                <th>Result</th>

            </tr>

            <%
                if (interviews != null
                        && !interviews.isEmpty()) {

                    for (Interview interview :
                            interviews) {
            %>

            <tr>

                <td>
                    <%= interview.getInterviewId() %>
                </td>

                <td>
                    <%= interview.getApplicationId() %>
                </td>

                <td>
                    <%= interview.getInterviewDate()
                            != null
                            ? interview.getInterviewDate()
                            : "" %>
                </td>

                <td>
                    <%= interview.getMode()
                            != null
                            ? interview.getMode()
                            : "" %>
                </td>

                <td>
                    <%= interview.getResult()
                            != null
                            ? interview.getResult()
                            : "" %>
                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="5">
                    No interview records found.
                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>


</div>

</body>

</html>