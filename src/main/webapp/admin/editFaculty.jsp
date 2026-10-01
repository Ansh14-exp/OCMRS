<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Faculty" %>
<%@ page import="com.ocmrs.model.Department" %>

<%
    Faculty faculty = (Faculty) request.getAttribute("faculty");
    List<Department> departments =
        (List<Department>) request.getAttribute("departments");

    if (faculty == null) {
        response.sendRedirect(
            request.getContextPath() + "/FacultyServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Edit Faculty</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f6f9;
        }

        .container {
            width: 600px;
            max-width: 90%;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            margin-bottom: 25px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .buttons {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }

        button {
            padding: 11px 20px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .cancel {
            padding: 11px 20px;
            border-radius: 6px;
            background: #6b7280;
            color: white;
            text-decoration: none;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Faculty</h1>

    <form action="<%= request.getContextPath() %>/FacultyServlet"
          method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="facultyId"
               value="<%= faculty.getFacultyId() %>">


        <!-- Department -->

        <div class="form-group">

            <label>Department</label>

            <select name="departmentId" required>

                <%
                    if (departments != null) {

                        for (Department department : departments) {
                %>

                    <option
                        value="<%= department.getDepartmentId() %>"
                        <%= department.getDepartmentId() ==
                            faculty.getDepartmentId()
                            ? "selected" : "" %>>

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
                   value="<%= faculty.getName() %>"
                   required>

        </div>


        <!-- Email -->

        <div class="form-group">

            <label>Email</label>

            <input type="email"
                   name="email"
                   value="<%= faculty.getEmail() != null
                           ? faculty.getEmail() : "" %>">

        </div>


        <!-- Phone -->

        <div class="form-group">

            <label>Phone</label>

            <input type="text"
                   name="phone"
                   value="<%= faculty.getPhone() != null
                           ? faculty.getPhone() : "" %>">

        </div>


        <!-- Designation -->

        <div class="form-group">

            <label>Designation</label>

            <input type="text"
                   name="designation"
                   value="<%= faculty.getDesignation() != null
                           ? faculty.getDesignation() : "" %>">

        </div>


        <div class="buttons">

            <button type="submit">
                Update Faculty
            </button>

            <a class="cancel"
               href="<%= request.getContextPath() %>/FacultyServlet">
                Cancel
            </a>

        </div>

    </form>

</div>

</body>
</html>