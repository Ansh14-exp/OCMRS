<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Course" %>
<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="java.util.List" %>

<%
    List<Course> courses =
        (List<Course>) request.getAttribute("courses");

    List<Department> departments =
        (List<Department>) request.getAttribute("departments");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Course Management - OCMRS</title>

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

        <h2>Course Management</h2>

    </div>


    <div class="container">

        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp"
           class="back-btn">
            ← Back to Dashboard
        </a>


        <!-- Add Course -->

        <div class="form-box">

            <h2>Add New Course</h2>

            <form action="<%= request.getContextPath() %>/CourseServlet"
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


                    <!-- Course Name -->

                    <div>

                        <label>Course Name</label>

                        <input type="text"
                               name="courseName"
                               placeholder="Enter course name"
                               required>

                    </div>


                    <!-- Duration -->

                    <div>

                        <label>Duration</label>

                        <input type="text"
                               name="duration"
                               placeholder="Example: 4 Years"
                               required>

                    </div>


                    <!-- Level -->

                    <div>

                        <label>Level</label>

                        <select name="level" required>

                            <option value="">
                                -- Select Level --
                            </option>

                            <option value="Undergraduate">
                                Undergraduate
                            </option>

                            <option value="Postgraduate">
                                Postgraduate
                            </option>

                            <option value="Diploma">
                                Diploma
                            </option>

                            <option value="Doctorate">
                                Doctorate
                            </option>

                        </select>

                    </div>

                </div>


                <button type="submit"
                        class="add-btn">

                    Add Course

                </button>

            </form>

        </div>


        <!-- Course List -->

        <div class="table-box">

            <h2>Course List</h2>

            <table>

                <tr>

                    <th>Course ID</th>
                    <th>Department</th>
                    <th>Course Name</th>
                    <th>Duration</th>
                    <th>Level</th>
                    <th>Actions</th>

                </tr>


                <%
                    if (courses != null && !courses.isEmpty()) {

                        for (Course course : courses) {

                            String departmentName = "Unknown";

                            if (departments != null) {

                                for (Department dept :
                                     departments) {

                                    if (dept.getDepartmentId()
                                        == course.getDepartmentId()) {

                                        departmentName =
                                            dept.getDepartmentName();

                                        break;
                                    }
                                }
                            }
                %>

                <tr>

                    <td>
                        <%= course.getCourseId() %>
                    </td>

                    <td>
                        <%= departmentName %>
                    </td>

                    <td>
                        <%= course.getCourseName() %>
                    </td>

                    <td>
                        <%= course.getDuration() %>
                    </td>

                    <td>
                        <%= course.getLevel() %>
                    </td>

                    <td>

                        <a href="<%= request.getContextPath() %>/CourseServlet?action=edit&courseId=<%= course.getCourseId() %>"
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
                           href="<%= request.getContextPath() %>/CourseServlet?action=delete&courseId=<%= course.getCourseId() %>"
                           onclick="return confirm('Are you sure you want to delete this course?');">
                            Delete
                        </a>

                    </td>

                </tr>

                <%
                        }

                    } else {
                %>

                <tr>

                    <td colspan="6"
                        style="text-align:center;">

                        No courses found.

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