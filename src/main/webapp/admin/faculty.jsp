<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="java.util.List" %>

<%
    List<Faculty> facultyList =
        (List<Faculty>) request.getAttribute("facultyList");

    List<Department> departments =
        (List<Department>) request.getAttribute("departments");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Faculty Management - OCMRS</title>

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
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .add-btn {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #16a34a;
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

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .delete-btn {
            display: inline-block;
            padding: 7px 12px;
            background-color: #dc2626;
            color: white;
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

        <h2>Faculty Management</h2>

    </div>


    <div class="container">

        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp"
           class="back-btn">
            ← Back to Dashboard
        </a>


        <!-- Add Faculty -->

        <div class="form-box">

            <h2>Add New Faculty</h2>

            <form action="<%= request.getContextPath() %>/FacultyServlet"
                  method="post">

                <div class="form-grid">


                    <!-- Department -->

                    <div>

                        <label>Department</label>

                        <select name="departmentId" required>

                            <option value="">
                                -- Select Department --
                            </option>

                            <%
                                if (departments != null) {

                                    for (Department department :
                                         departments) {
                            %>

                            <option
                                value="<%= department.getDepartmentId() %>">

                                <%= department.getDepartmentName() %>

                            </option>

                            <%
                                    }
                                }
                            %>

                        </select>

                    </div>


                    <!-- Faculty Name -->

                    <div>

                        <label>Faculty Name</label>

                        <input type="text"
                               name="name"
                               placeholder="Enter faculty name"
                               required>

                    </div>


                    <!-- Email -->

                    <div>

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               placeholder="Enter email">

                    </div>


                    <!-- Phone -->

                    <div>

                        <label>Phone</label>

                        <input type="text"
                               name="phone"
                               placeholder="Enter phone number">

                    </div>


                    <!-- Designation -->

                    <div>

                        <label>Designation</label>

                        <input type="text"
                               name="designation"
                               placeholder="Example: Assistant Professor">

                    </div>

                </div>


                <button type="submit"
                        class="add-btn">

                    Add Faculty

                </button>

            </form>

        </div>


        <!-- Faculty List -->

        <div class="table-box">

            <h2>Faculty List</h2>

            <table>

                <tr>

                    <th>Faculty ID</th>
                    <th>Department</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Designation</th>
                    <th>Actions</th>

                </tr>


                <%
                    if (facultyList != null &&
                        !facultyList.isEmpty()) {

                        for (Faculty faculty :
                             facultyList) {

                            String departmentName =
                                "Unknown";

                            if (departments != null) {

                                for (Department dept :
                                     departments) {

                                    if (dept.getDepartmentId()
                                        == faculty.getDepartmentId()) {

                                        departmentName =
                                            dept.getDepartmentName();

                                        break;
                                    }
                                }
                            }
                %>

                <tr>

                    <td>
                        <%= faculty.getFacultyId() %>
                    </td>

                    <td>
                        <%= departmentName %>
                    </td>

                    <td>
                        <%= faculty.getName() %>
                    </td>

                    <td>
                        <%= faculty.getEmail() %>
                    </td>

                    <td>
                        <%= faculty.getPhone() %>
                    </td>

                    <td>
                        <%= faculty.getDesignation() %>
                    </td>

                    <td>

                        <a href="<%= request.getContextPath() %>/FacultyServlet?action=edit&facultyId=<%= faculty.getFacultyId() %>"
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
                           href="<%= request.getContextPath() %>/FacultyServlet?action=delete&facultyId=<%= faculty.getFacultyId() %>"
                           onclick="return confirm('Are you sure you want to delete this faculty member?');">
                            Delete
                        </a>

                    </td>

                </tr>

                <%
                        }

                    } else {
                %>

                <tr>

                    <td colspan="7"
                        style="text-align:center;">

                        No faculty found.

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