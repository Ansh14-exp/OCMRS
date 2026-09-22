<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="com.ocmrs.model.College" %>
<%@ page import="java.util.List" %>

<%
    Department department =
        (Department) request.getAttribute("department");

    List<College> colleges =
        (List<College>) request.getAttribute("colleges");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Department - OCMRS</title>

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

        .form-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
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

        .update-btn {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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

        <h2>Edit Department</h2>

    </div>


    <div class="container">

        <div class="form-box">

            <a href="<%= request.getContextPath() %>/DepartmentServlet"
               class="back-btn">
                ← Back to Departments
            </a>


            <h2>Update Department Information</h2>


            <form action="<%= request.getContextPath() %>/DepartmentServlet"
                  method="post">


                <!-- Action -->

                <input type="hidden"
                       name="action"
                       value="update">


                <!-- Department ID -->

                <input type="hidden"
                       name="departmentId"
                       value="<%= department.getDepartmentId() %>">


                <div class="form-grid">


                    <!-- College -->

                    <div>

                        <label>College</label>

                        <select name="collegeId" required>

                            <option value="">
                                -- Select College --
                            </option>

                            <%
                                if (colleges != null) {

                                    for (College college :
                                         colleges) {

                                        boolean selected =
                                            college.getCollegeId()
                                            == department.getCollegeId();
                            %>

                            <option
                                value="<%= college.getCollegeId() %>"
                                <%= selected ? "selected" : "" %>>

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
                               value="<%= department.getDepartmentName() %>"
                               required>

                    </div>


                    <!-- HOD Name -->

                    <div>

                        <label>HOD Name</label>

                        <input type="text"
                               name="hodName"
                               value="<%= department.getHodName() %>">

                    </div>

                </div>


                <button type="submit"
                        class="update-btn">

                    Update Department

                </button>

            </form>

        </div>

    </div>

</body>

</html>