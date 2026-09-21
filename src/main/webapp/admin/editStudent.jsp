<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Student - OCMRS</title>

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
            max-width: 900px;
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

        <h2>Edit Student</h2>

    </div>


    <div class="container">

        <div class="form-box">

            <a href="<%= request.getContextPath() %>/StudentServlet"
               class="back-btn">
                ← Back to Students
            </a>


            <h2>Update Student Information</h2>


            <form action="<%= request.getContextPath() %>/StudentServlet"
                  method="post">

                <!-- Student ID -->

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="studentId"
                       value="<%= student.getStudentId() %>">


                <div class="form-grid">


                    <!-- College ID -->

                    <div>

                        <label>College ID</label>

                        <input type="number"
                               name="collegeId"
                               value="<%= student.getCollegeId() %>"
                               required>

                    </div>


                    <!-- Course ID -->

                    <div>

                        <label>Course ID</label>

                        <input type="number"
                               name="courseId"
                               value="<%= student.getCourseId() %>"
                               required>

                    </div>


                    <!-- Name -->

                    <div>

                        <label>Name</label>

                        <input type="text"
                               name="name"
                               value="<%= student.getName() %>"
                               required>

                    </div>


                    <!-- Email -->

                    <div>

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               value="<%= student.getEmail() %>">

                    </div>


                    <!-- Phone -->

                    <div>

                        <label>Phone</label>

                        <input type="text"
                               name="phone"
                               value="<%= student.getPhone() %>">

                    </div>


                    <!-- Date of Birth -->

                    <div>

                        <label>Date of Birth</label>

                        <input type="date"
                               name="dob"
                               value="<%= student.getDob() %>">

                    </div>


                    <!-- Gender -->

                    <div>

                        <label>Gender</label>

                        <select name="gender">

                            <option value="">Select Gender</option>

                            <option value="Male"
                                <%= "Male".equals(student.getGender()) ? "selected" : "" %>>
                                Male
                            </option>

                            <option value="Female"
                                <%= "Female".equals(student.getGender()) ? "selected" : "" %>>
                                Female
                            </option>

                            <option value="Other"
                                <%= "Other".equals(student.getGender()) ? "selected" : "" %>>
                                Other
                            </option>

                        </select>

                    </div>


                    <!-- Address -->

                    <div>

                        <label>Address</label>

                        <input type="text"
                               name="address"
                               value="<%= student.getAddress() %>">

                    </div>

                </div>


                <button type="submit"
                        class="update-btn">
                    Update Student
                </button>

            </form>

        </div>

    </div>

</body>

</html>