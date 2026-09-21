<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.College" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>College Management - OCMRS</title>

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

        <h2>College Management</h2>

    </div>


    <div class="container">

        <a href="dashboard.jsp" class="back-btn">
            ← Back to Dashboard
        </a>


        <!-- ADD COLLEGE -->

        <div class="form-box">

            <h2>Add New College</h2>

            <form action="<%= request.getContextPath() %>/CollegeServlet"
                  method="post">

                <div class="form-grid">

                    <div>

                        <label>College Name</label>

                        <input type="text"
                               name="collegeName"
                               required>

                    </div>


                    <div>

                        <label>Email</label>

                        <input type="email"
                               name="email">

                    </div>


                    <div>

                        <label>Phone</label>

                        <input type="text"
                               name="phone">

                    </div>


                    <div>

                        <label>Address</label>

                        <input type="text"
                               name="address">

                    </div>

                </div>


                <button type="submit"
                        class="add-btn">
                    Add College
                </button>

            </form>

        </div>


        <!-- COLLEGE LIST -->

        <div class="table-box">

            <h2>College Records</h2>

            <table>

                <tr>

                    <th>ID</th>
                    <th>College Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Action</th>

                </tr>


                <%

                    List<College> colleges =
                        (List<College>) request.getAttribute("colleges");

                    if (colleges != null) {

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
                    
      <a href="<%= request.getContextPath() %>/CollegeServlet?action=edit&collegeId=<%= college.getCollegeId() %>"
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
                           href="<%= request.getContextPath() %>/CollegeServlet?action=delete&collegeId=<%= college.getCollegeId() %>"
                           onclick="return confirm('Are you sure you want to delete this college?');">
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