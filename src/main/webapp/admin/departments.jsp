<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="com.ocmrs.model.College" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Department Management - OCMRS</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .header {
            background-color: #1f2937;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            padding: 30px;
        }

        .form-box,
        .table-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .add-btn {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #1f2937;
            color: white;
        }

        .delete-btn {
            color: white;
            background-color: #dc2626;
            padding: 7px 12px;
            text-decoration: none;
            border-radius: 4px;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #4b5563;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

    </style>

</head>

<body>

    <div class="header">

        <h1>Online College Management and Recruitment System</h1>

        <h2>Department Management</h2>

    </div>


    <div class="container">

        <a href="dashboard.jsp" class="back-btn">
            ← Back to Dashboard
        </a>


        <!-- ADD DEPARTMENT -->

        <div class="form-box">

            <h2>Add New Department</h2>

            <form action="<%= request.getContextPath() %>/DepartmentServlet"
                  method="post">

                <div class="form-grid">


                    <!-- College -->

<div>

    <label>College</label>

    <select name="collegeId" required
            style="width:100%;
                   padding:10px;
                   box-sizing:border-box;
                   border:1px solid #ccc;
                   border-radius:5px;">

        <option value="">-- Select College --</option>

        <%
            List<com.ocmrs.model.College> colleges =
                (List<com.ocmrs.model.College>)
                request.getAttribute("colleges");

            if (colleges != null) {

                for (com.ocmrs.model.College college : colleges) {
        %>

        <option value="<%= college.getCollegeId() %>">
            <%= college.getCollegeName() %>
        </option>

        <%
                }
            }
        %>

    </select>

</div>


                    <!-- Department Name -->

                    <div>

                        <label>Department Name</label>

                        <input type="text"
                               name="departmentName"
                               required>

                    </div>


                    <!-- HOD -->

                    <div>

                        <label>HOD Name</label>

                        <input type="text"
                               name="hodName">

                    </div>

                </div>


                <button type="submit"
                        class="add-btn">
                    Add Department
                </button>

            </form>

        </div>


        <!-- DEPARTMENT LIST -->

        <div class="table-box">

            <h2>Department Records</h2>

            <table>

                <tr>

                    <th>ID</th>
                    <th>College </th>
                    <th>Department Name</th>
                    <th>HOD Name</th>
                    <th>Action</th>

                </tr>


                <%
                List<College> college =
                (List<College>)
                request.getAttribute("colleges");
                    List<Department> departments =
                        (List<Department>)
                        request.getAttribute("departments");

                    if (departments != null) {

                        for (Department department :
                             departments) {

                %>

                <tr>

                    <td>
                        <%= department.getDepartmentId() %>
                    </td>

                    <td>

             <%
    String collegeName = "Unknown";

    if (colleges != null) {

        for (College deptCollege : colleges) {

            if (deptCollege.getCollegeId()
                    == department.getCollegeId()) {

                collegeName =
                        deptCollege.getCollegeName();

                break;
            }
        }
    }
%>

<%= collegeName %>

</td>

                    <td>
                        <%= department.getDepartmentName() %>
                    </td>

                    <td>
                        <%= department.getHodName() %>
                    </td>

                    <td>
                         
       <a href="<%= request.getContextPath() %>/DepartmentServlet?action=edit&departmentId=<%= department.getDepartmentId() %>"
       style="display:inline-block;
              padding:7px 12px;
              background:#2563eb;
              color:white;
              text-decoration:none;
              border-radius:4px;
              margin-right:5px;">
        Edit
    </a>
                        <a class="delete-btn"
                           href="<%= request.getContextPath() %>/DepartmentServlet?action=delete&departmentId=<%= department.getDepartmentId() %>"
                           onclick="return confirm('Are you sure you want to delete this department?');">
                            Delete
                        </a>

                    </td>

                </tr>

                <%

                        }

                    }

                %>

            </table>

        </div>

    </div>

</body>

</html>