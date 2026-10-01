<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Course" %>
<%@ page import="com.ocmrs.model.Department" %>

<%
List<Course> courses =
(List<Course>) request.getAttribute("courses");

List<Department> departments =
    (List<Department>) request.getAttribute("departments");

%>

<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>OCMRS - Courses</title><style>

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

/* SIDEBAR */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 240px;
    height: 100vh;
    background: #172554;
    color: white;
    padding: 25px 15px;
}

.logo {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 35px;
}

.logo span {
    color: #60a5fa;
}

.menu a {
    display: block;
    text-decoration: none;
    color: #dbeafe;
    padding: 13px 15px;
    margin: 6px 0;
    border-radius: 8px;
    transition: 0.3s;
}

.menu a:hover,
.menu .active {
    background: #2563eb;
    color: white;
}

.logout {
    position: absolute;
    bottom: 25px;
    left: 15px;
    right: 15px;
}

.logout a {
    display: block;
    text-align: center;
    background: #dc2626;
    color: white;
    padding: 12px;
    border-radius: 8px;
    text-decoration: none;
}

/* MAIN */

.main {
    margin-left: 240px;
    padding: 30px;
}

.topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.topbar h1 {
    color: #172554;
}

.back-btn {
    background: #172554;
    color: white;
    padding: 10px 18px;
    border-radius: 7px;
    text-decoration: none;
}

/* CARD */

.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    margin-bottom: 25px;
}

.card h2 {
    color: #172554;
    margin-bottom: 20px;
}

/* FORM */

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 7px;
    font-weight: bold;
    color: #374151;
}

input,
select {
    width: 100%;
    padding: 12px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    outline: none;
    background: white;
}

input:focus,
select:focus {
    border-color: #2563eb;
}

.add-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 7px;
    cursor: pointer;
    font-size: 15px;
    margin-top: 24px;
}

.add-btn:hover {
    background: #1d4ed8;
}

/* TABLE */

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #172554;
    color: white;
    padding: 14px;
    text-align: left;
}

td {
    padding: 13px;
    border-bottom: 1px solid #e5e7eb;
}

tr:hover {
    background: #f8fafc;
}

/* BUTTONS */

.edit {
    background: #f59e0b;
    color: white;
    padding: 7px 12px;
    border-radius: 5px;
    text-decoration: none;
    margin-right: 5px;
}

.delete {
    background: #dc2626;
    color: white;
    padding: 7px 12px;
    border-radius: 5px;
    text-decoration: none;
}

.empty {
    text-align: center;
    padding: 25px;
    color: #6b7280;
}

@media(max-width: 800px) {

    .sidebar {
        width: 190px;
    }

    .main {
        margin-left: 190px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

}

</style></head><body><!-- SIDEBAR --><div class="sidebar"><div class="logo">
    OCM<span>RS</span>
</div>

<div class="menu">

    <a href="<%= request.getContextPath() %>/AdminServlet">
        🏠 Dashboard
    </a>

    <a href="<%= request.getContextPath() %>/CollegeServlet">
        🏫 Colleges
    </a>

    <a href="<%= request.getContextPath() %>/DepartmentServlet">
        🏢 Departments
    </a>

    <a href="<%= request.getContextPath() %>/CourseServlet"
       class="active">
        📚 Courses
    </a>

    <a href="#">
        👨‍🏫 Faculty
    </a>

    <a href="#">
        🎓 Students
    </a>

    <a href="#">
        🏢 Companies
    </a>

    <a href="#">
        💼 Jobs
    </a>

    <a href="#">
        📄 Applications
    </a>

    <a href="#">
        🎯 Placements
    </a>

</div>

<div class="logout">

    <a href="<%= request.getContextPath() %>/LogoutServlet">
        🚪 Logout
    </a>

</div>

</div><!-- MAIN --><div class="main"><div class="topbar">

    <h1>Course Management</h1>

    <a class="back-btn"
       href="<%= request.getContextPath() %>/AdminServlet">
        ← Dashboard
    </a>

</div>


<!-- ADD COURSE -->

<div class="card">

    <h2>➕ Add New Course</h2>

    <form action="<%= request.getContextPath() %>/CourseServlet"
          method="post">

        <input type="hidden"
               name="action"
               value="add">

        <div class="form-grid">


            <!-- DEPARTMENT -->

            <div class="form-group">

                <label>Select Department</label>

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


            <!-- COURSE NAME -->

            <div class="form-group">

                <label>Course Name</label>

                <input type="text"
                       name="courseName"
                       placeholder="Enter course name"
                       required>

            </div>


            <!-- DURATION -->

            <div class="form-group">

                <label>Duration</label>

                <input type="text"
                       name="duration"
                       placeholder="Example: 4 Years">

            </div>


            <!-- LEVEL -->

            <div class="form-group">

                <label>Level</label>

                <select name="level">

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

                </select>

            </div>

        </div>


        <button type="submit"
                class="add-btn">
            Add Course
        </button>

    </form>

</div>


<!-- COURSE LIST -->

<div class="card">

    <h2>📚 Course List</h2>

    <table>

        <thead>

            <tr>
                <th>ID</th>
                <th>Department ID</th>
                <th>Course Name</th>
                <th>Duration</th>
                <th>Level</th>
                <th>Action</th>
            </tr>

        </thead>

        <tbody>

        <%
            if (courses != null &&
                !courses.isEmpty()) {

                for (Course course : courses) {
        %>

            <tr>

                <td>
                    <%= course.getCourseId() %>
                </td>

                <td>
                    <%= course.getDepartmentId() %>
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

                    <a class="edit"
                       href="<%= request.getContextPath() %>/CourseServlet?action=edit&courseId=<%= course.getCourseId() %>">
                        Edit
                    </a>

                    <a class="delete"
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
                    class="empty">

                    No courses found.

                </td>

            </tr>

        <%
            }
        %>

        </tbody>

    </table>

</div>

</div></body>
</html>