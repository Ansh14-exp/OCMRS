<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.College" %>

<%
    College college = (College) request.getAttribute("college");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit College - OCMRS</title>

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

        input {
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

        <h2>Edit College</h2>

    </div>


    <div class="container">

        <div class="form-box">

            <a href="<%= request.getContextPath() %>/CollegeServlet"
               class="back-btn">
                ← Back to Colleges
            </a>


            <h2>Update College Information</h2>


            <form action="<%= request.getContextPath() %>/CollegeServlet"
                  method="post">

                <!-- Action -->

                <input type="hidden"
                       name="action"
                       value="update">


                <!-- College ID -->

                <input type="hidden"
                       name="collegeId"
                       value="<%= college.getCollegeId() %>">


                <div class="form-grid">


                    <!-- College Name -->

                    <div>

                        <label>College Name</label>

                        <input type="text"
                               name="collegeName"
                               value="<%= college.getCollegeName() %>"
                               required>

                    </div>


                    <!-- Email -->

                    <div>

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               value="<%= college.getEmail() %>">

                    </div>


                    <!-- Phone -->

                    <div>

                        <label>Phone</label>

                        <input type="text"
                               name="phone"
                               value="<%= college.getPhone() %>">

                    </div>


                    <!-- Address -->

                    <div>

                        <label>Address</label>

                        <input type="text"
                               name="address"
                               value="<%= college.getAddress() %>">

                    </div>

                </div>


                <button type="submit"
                        class="update-btn">
                    Update College
                </button>

            </form>

        </div>

    </div>

</body>

</html>