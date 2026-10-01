<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Student" %>

<%
    List<Student> students =
            (List<Student>) request.getAttribute("students");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Student Management | OCMRS</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        .header {
            background: #172554;
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
        }

        .back-btn {
            background: white;
            color: #172554;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-weight: bold;
        }

        .container {
            padding: 30px;
        }

        .page-title {
            margin-bottom: 20px;
        }

        .page-title h2 {
            color: #172554;
            margin-bottom: 5px;
        }

        .page-title p {
            color: #666;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h3 {
            color: #172554;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 7px;
            color: #444;
        }

        .form-group input,
        .form-group select {
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #2563eb;
        }

        .full-width {
            grid-column: span 3;
        }

        .add-btn {
            margin-top: 20px;
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
        }

        .add-btn:hover {
            background: #1d4ed8;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }

        th {
            background: #172554;
            color: white;
            padding: 13px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        tr:hover {
            background: #f8fafc;
        }

        .edit-btn {
            background: #f59e0b;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 5px;
            font-size: 13px;
        }

        .delete-btn {
            background: #dc2626;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 13px;
        }

        .edit-btn:hover {
            background: #d97706;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #777;
        }

        @media (max-width: 900px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: span 1;
            }

            .container {
                padding: 15px;
            }

        }

    </style>

</head>

<body>

    <!-- HEADER -->

    <div class="header">

        <h1>🎓 OCMRS - Student Management</h1>

        <a href="<%= request.getContextPath() %>/AdminServlet"
           class="back-btn">
            ← Dashboard
        </a>

    </div>


    <div class="container">

        <!-- PAGE TITLE -->

        <div class="page-title">

            <h2>Student Management</h2>

            <p>
                Add, view, edit and manage college students.
            </p>

        </div>


        <!-- ADD STUDENT -->

        <div class="card">

            <h3>➕ Add New Student</h3>

            <form action="<%= request.getContextPath() %>/StudentServlet"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="add">

                <div class="form-grid">

                    <!-- USER ID -->

                    <div class="form-group">

                        <label>User ID</label>

                        <input type="number"
                               name="userId"
                               placeholder="Enter User ID"
                               required>

                    </div>


                    <!-- COLLEGE ID -->

                    <div class="form-group">

                        <label>College ID</label>

                        <input type="number"
                               name="collegeId"
                               placeholder="Enter College ID"
                               required>

                    </div>


                    <!-- COURSE ID -->

                    <div class="form-group">

                        <label>Course ID</label>

                        <input type="number"
                               name="courseId"
                               placeholder="Enter Course ID"
                               required>

                    </div>


                    <!-- NAME -->

                    <div class="form-group">

                        <label>Student Name</label>

                        <input type="text"
                               name="name"
                               placeholder="Enter student name"
                               required>

                    </div>


                    <!-- EMAIL -->

                    <div class="form-group">

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               placeholder="Enter email"
                               required>

                    </div>


                    <!-- PHONE -->

                    <div class="form-group">

                        <label>Phone</label>

                        <input type="text"
                               name="phone"
                               placeholder="Enter phone number">

                    </div>


                    <!-- DOB -->

                    <div class="form-group">

                        <label>Date of Birth</label>

                        <input type="date"
                               name="dob">

                    </div>


                    <!-- GENDER -->

                    <div class="form-group">

                        <label>Gender</label>

                        <select name="gender">

                            <option value="">-- Select Gender --</option>

                            <option value="Male">Male</option>

                            <option value="Female">Female</option>

                            <option value="Other">Other</option>

                        </select>

                    </div>


                    <!-- ADDRESS -->

                    <div class="form-group full-width">

                        <label>Address</label>

                        <input type="text"
                               name="address"
                               placeholder="Enter address">

                    </div>

                </div>


                <button type="submit"
                        class="add-btn">

                    ➕ Add Student

                </button>

            </form>

        </div>


        <!-- STUDENT LIST -->

        <div class="card">

            <h3>📋 All Students</h3>

            <div class="table-container">

                <table>

                    <thead>

                        <tr>

                            <th>ID</th>

                            <th>User ID</th>

                            <th>College ID</th>

                            <th>Course ID</th>

                            <th>Name</th>

                            <th>Email</th>

                            <th>Phone</th>

                            <th>Date of Birth</th>

                            <th>Gender</th>

                            <th>Address</th>

                            <th>Actions</th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        if (students != null &&
                            !students.isEmpty()) {

                            for (Student student : students) {
                    %>

                        <tr>

                            <td>
                                <%= student.getStudentId() %>
                            </td>

                            <td>
                                <%= student.getUserId() %>
                            </td>

                            <td>
                                <%= student.getCollegeId() %>
                            </td>

                            <td>
                                <%= student.getCourseId() %>
                            </td>

                            <td>
                                <%= student.getName() %>
                            </td>

                            <td>
                                <%= student.getEmail() %>
                            </td>

                            <td>
                                <%= student.getPhone() %>
                            </td>

                            <td>
                                <%= student.getDob() %>
                            </td>

                            <td>
                                <%= student.getGender() %>
                            </td>

                            <td>
                                <%= student.getAddress() %>
                            </td>

                            <td>

                                <a class="edit-btn"
                                   href="<%= request.getContextPath() %>/StudentServlet?action=edit&studentId=<%= student.getStudentId() %>">

                                    Edit

                                </a>

                                <a class="delete-btn"
                                   href="<%= request.getContextPath() %>/StudentServlet?action=delete&studentId=<%= student.getStudentId() %>"
                                   onclick="return confirm('Are you sure you want to delete this student?');">

                                    Delete

                                </a>

                            </td>

                        </tr>

                    <%
                            }

                        } else {
                    %>

                        <tr>

                            <td colspan="11"
                                class="empty">

                                No students found.

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</body>
</html>