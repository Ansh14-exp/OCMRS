<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");

    if (student == null) {
        response.sendRedirect(
            request.getContextPath() + "/StudentServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Student | OCMRS</title>

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
            max-width: 1000px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            color: #172554;
            margin-bottom: 25px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
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
            grid-column: span 2;
        }

        .buttons {
            margin-top: 25px;
            display: flex;
            gap: 12px;
        }

        .update-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 15px;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        .cancel-btn {
            background: #64748b;
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-weight: bold;
        }

        .cancel-btn:hover {
            background: #475569;
        }

        .student-id {
            background: #eef2ff;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            color: #172554;
            font-weight: bold;
        }

        @media (max-width: 700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: span 1;
            }

            .header {
                padding: 15px;
            }

            .container {
                margin-top: 20px;
            }
        }

    </style>

</head>

<body>

    <!-- HEADER -->

    <div class="header">

        <h1>🎓 OCMRS</h1>

        <a href="<%= request.getContextPath() %>/StudentServlet"
           class="back-btn">

            ← Back to Students

        </a>

    </div>


    <!-- MAIN -->

    <div class="container">

        <div class="card">

            <h2>✏️ Edit Student</h2>

            <div class="student-id">

                Student ID:
                <%= student.getStudentId() %>

            </div>


            <form action="<%= request.getContextPath() %>/StudentServlet"
                  method="post">

                <!-- ACTION -->

                <input type="hidden"
                       name="action"
                       value="update">


                <!-- STUDENT ID -->

                <input type="hidden"
                       name="studentId"
                       value="<%= student.getStudentId() %>">


                <div class="form-grid">


                    <!-- USER ID -->

                    <div class="form-group">

                        <label>User ID</label>

                        <input type="number"
                               name="userId"
                               value="<%= student.getUserId() %>"
                               required>

                    </div>


                    <!-- COLLEGE ID -->

                    <div class="form-group">

                        <label>College ID</label>

                        <input type="number"
                               name="collegeId"
                               value="<%= student.getCollegeId() %>"
                               required>

                    </div>


                    <!-- COURSE ID -->

                    <div class="form-group">

                        <label>Course ID</label>

                        <input type="number"
                               name="courseId"
                               value="<%= student.getCourseId() %>"
                               required>

                    </div>


                    <!-- NAME -->

                    <div class="form-group">

                        <label>Student Name</label>

                        <input type="text"
                               name="name"
                               value="<%= student.getName() %>"
                               required>

                    </div>


                    <!-- EMAIL -->

                    <div class="form-group">

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               value="<%= student.getEmail() %>"
                               required>

                    </div>


                    <!-- PHONE -->

                    <div class="form-group">

                        <label>Phone</label>

                        <input type="text"
                               name="phone"
                               value="<%= student.getPhone() %>">

                    </div>


                    <!-- DOB -->

                    <div class="form-group">

                        <label>Date of Birth</label>

                        <input type="date"
                               name="dob"
                               value="<%= student.getDob() %>">

                    </div>


                    <!-- GENDER -->

                    <div class="form-group">

                        <label>Gender</label>

                        <select name="gender">

                            <option value="">
                                -- Select Gender --
                            </option>

                            <option value="Male"
                                <%= "Male".equals(student.getGender())
                                    ? "selected" : "" %>>
                                Male
                            </option>

                            <option value="Female"
                                <%= "Female".equals(student.getGender())
                                    ? "selected" : "" %>>
                                Female
                            </option>

                            <option value="Other"
                                <%= "Other".equals(student.getGender())
                                    ? "selected" : "" %>>
                                Other
                            </option>

                        </select>

                    </div>


                    <!-- ADDRESS -->

                    <div class="form-group full-width">

                        <label>Address</label>

                        <input type="text"
                               name="address"
                               value="<%= student.getAddress() %>">

                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="buttons">

                    <button type="submit"
                            class="update-btn">

                        💾 Update Student

                    </button>

                    <a href="<%= request.getContextPath() %>/StudentServlet"
                       class="cancel-btn">

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>