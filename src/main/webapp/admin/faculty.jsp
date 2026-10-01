<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.Department" %>

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

    <title>Faculty Management</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
            color: #333;
        }

        .container {
            width: 92%;
            margin: 30px auto;
        }

        h1 {
            margin-bottom: 25px;
            color: #222;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 7px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .full-width {
            grid-column: span 2;
        }

        .btn {
            margin-top: 20px;
            padding: 11px 22px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            cursor: pointer;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th,
        td {
            padding: 13px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #f1f5f9;
        }

        tr:hover {
            background: #f8fafc;
        }

        .edit {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .delete {
            color: #dc2626;
            text-decoration: none;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 25px;
            color: #777;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #2563eb;
            font-weight: bold;
        }

        @media (max-width: 700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: span 1;
            }

            table {
                font-size: 13px;
            }

            th,
            td {
                padding: 8px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <a class="back"
       href="<%= request.getContextPath() %>/AdminServlet">
        ← Back to Dashboard
    </a>

    <h1>Faculty Management</h1>


    <!-- ========================= -->
    <!-- ADD FACULTY -->
    <!-- ========================= -->

    <div class="card">

        <h2>Add Faculty</h2>

        <form action="<%= request.getContextPath() %>/FacultyServlet"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">

            <div class="form-grid">

                <!-- Department -->

                <div class="form-group">

                    <label>Department</label>

                    <select name="departmentId" required>

                        <option value="">
                            -- Select Department --
                        </option>

                        <%
                            if (departments != null) {

                                for (Department department : departments) {
                        %>

                        <option value="<%= department.getDepartmentId() %>">

                            <%= department.getDepartmentName() %>

                        </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <!-- Name -->

                <div class="form-group">

                    <label>Faculty Name</label>

                    <input type="text"
                           name="name"
                           placeholder="Enter faculty name"
                           required>

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           placeholder="Enter email">

                </div>


                <!-- Phone -->

                <div class="form-group">

                    <label>Phone</label>

                    <input type="text"
                           name="phone"
                           placeholder="Enter phone number">

                </div>


                <!-- Designation -->

                <div class="form-group full-width">

                    <label>Designation</label>

                    <input type="text"
                           name="designation"
                           placeholder="Example: Assistant Professor">

                </div>

            </div>


            <button type="submit" class="btn">
                Add Faculty
            </button>

        </form>

    </div>


    <!-- ========================= -->
    <!-- FACULTY LIST -->
    <!-- ========================= -->

    <div class="card">

        <h2>Faculty List</h2>

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Department ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Designation</th>
                    <th>Action</th>

                </tr>

            </thead>

            <tbody>

            <%
                if (facultyList != null &&
                    !facultyList.isEmpty()) {

                    for (Faculty faculty : facultyList) {
            %>

                <tr>

                    <td>
                        <%= faculty.getFacultyId() %>
                    </td>

                    <td>
                        <%= faculty.getDepartmentId() %>
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

                        <a class="edit"
                           href="<%= request.getContextPath() %>/FacultyServlet?action=edit&facultyId=<%= faculty.getFacultyId() %>">
                            Edit
                        </a>

                        <a class="delete"
                           href="<%= request.getContextPath() %>/FacultyServlet?action=delete&facultyId=<%= faculty.getFacultyId() %>"
                           onclick="return confirm('Are you sure you want to delete this faculty?');">
                            Delete
                        </a>

                    </td>

                </tr>

            <%
                    }

                } else {
            %>

                <tr>

                    <td colspan="7" class="empty">
                        No faculty found.
                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>