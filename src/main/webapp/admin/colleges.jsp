<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.College" %>

<%
List<College> colleges =
(List<College>) request.getAttribute("colleges");
%>

<!DOCTYPE html><html>
<head>
    <meta charset="UTF-8">
    <title>OCMRS - Colleges</title><style>
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

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px;
    }

    input {
        width: 100%;
        padding: 12px;
        border: 1px solid #d1d5db;
        border-radius: 7px;
        outline: none;
    }

    input:focus {
        border-color: #2563eb;
    }

    .full {
        grid-column: 1 / 3;
    }

    .add-btn {
        background: #2563eb;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 7px;
        cursor: pointer;
        font-size: 15px;
    }

    .add-btn:hover {
        background: #1d4ed8;
    }

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

        .full {
            grid-column: 1;
        }
    }
</style>

</head><body><!-- SIDEBAR --><div class="sidebar"><div class="logo">
    OCM<span>RS</span>
</div>

<div class="menu">

    <a href="<%= request.getContextPath() %>/AdminServlet">
        🏠 Dashboard
    </a>

    <a href="<%= request.getContextPath() %>/CollegeServlet"
       class="active">
        🏫 Colleges
    </a>

    <a href="<%= request.getContextPath() %>/DepartmentServlet">
        🏢 Departments
    </a>

    <a href="<%= request.getContextPath() %>/CourseServlet">
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

</div><!-- MAIN CONTENT --><div class="main"><div class="topbar">
    <h1>College Management</h1>

    <a class="back-btn"
       href="<%= request.getContextPath() %>/AdminServlet">
        ← Dashboard
    </a>
</div>


<!-- ADD COLLEGE -->
<div class="card">

    <h2>➕ Add New College</h2>

    <form action="<%= request.getContextPath() %>/CollegeServlet"
          method="post">

        <input type="hidden" name="action" value="add">

        <div class="form-grid">

            <input type="text"
                   name="collegeName"
                   placeholder="College Name"
                   required>

            <input type="text"
                   name="address"
                   placeholder="Address">

            <input type="email"
                   name="email"
                   placeholder="College Email">

            <input type="text"
                   name="phone"
                   placeholder="Phone Number">

            <div class="full">
                <button type="submit" class="add-btn">
                    Add College
                </button>
            </div>

        </div>

    </form>

</div>


<!-- COLLEGE LIST -->
<div class="card">

    <h2>🏫 College List</h2>

    <table>

        <thead>
            <tr>
                <th>ID</th>
                <th>College Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <%
            if (colleges != null && !colleges.isEmpty()) {

                for (College college : colleges) {
        %>

            <tr>

                <td>
                    <%= college.getCollegeId() %>
                </td>

                <td>
                    <%= college.getCollegeName() %>
                </td>

                <td>
                    <%= college.getAddress() %>
                </td>

                <td>
                    <%= college.getEmail() %>
                </td>

                <td>
                    <%= college.getPhone() %>
                </td>

                <td>

                    <a class="edit"
                       href="<%= request.getContextPath() %>/CollegeServlet?action=edit&collegeId=<%= college.getCollegeId() %>">
                        Edit
                    </a>

                    <a class="delete"
                       href="<%= request.getContextPath() %>/CollegeServlet?action=delete&collegeId=<%= college.getCollegeId() %>"
                       onclick="return confirm('Are you sure you want to delete this college?');">
                        Delete
                    </a>

                </td>

            </tr>

        <%
                }

            } else {
        %>

            <tr>
                <td colspan="6" class="empty">
                    No colleges found.
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