<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Course" %>
<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="java.util.List" %>

<%
    Course course =
        (Course) request.getAttribute("course");

    List<Department> departments =
        (List<Department>) request.getAttribute("departments");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Course - OCMRS</title>

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

        <h2>Edit Course</h2>

    </div>


    <div class="container">

        <div class="form-box">

            <a href="<%= request.getContextPath() %>/CourseServlet"
               class="back-btn">
                ← Back to Courses
            </a>


            <h2>Update Course Information</h2>


            <form action="<%= request.getContextPath() %>/CourseServlet"
                  method="post">


                <!-- Action -->

                <input type="hidden"
                       name="action"
                       value="update">


                <!-- Course ID -->

                <input type="hidden"
                       name="courseId"
                       value="<%= course.getCourseId() %>">


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

                                        boolean selected =
                                            department.getDepartmentId()
                                            == course.getDepartmentId();
                            %>

                            <option
                                value="<%= department.getDepartmentId() %>"
                                <%= selected ? "selected" : "" %>>

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
                               value="<%= course.getCourseName() %>"
                               required>

                    </div>


                    <!-- Duration -->

                    <div>

                        <label>Duration</label>

                        <input type="text"
                               name="duration"
                               value="<%= course.getDuration() %>"
                               required>

                    </div>


                    <!-- Level -->

                    <div>

                        <label>Level</label>

                        <select name="level" required>

                            <option value="Undergraduate"
                                <%= "Undergraduate".equals(course.getLevel())
                                    ? "selected" : "" %>>
                                Undergraduate
                            </option>

                            <option value="Postgraduate"
                                <%= "Postgraduate".equals(course.getLevel())
                                    ? "selected" : "" %>>
                                Postgraduate
                            </option>

                            <option value="Diploma"
                                <%= "Diploma".equals(course.getLevel())
                                    ? "selected" : "" %>>
                                Diploma
                            </option>

                            <option value="Doctorate"
                                <%= "Doctorate".equals(course.getLevel())
                                    ? "selected" : "" %>>
                                Doctorate
                            </option>

                        </select>

                    </div>

                </div>


                <button type="submit"
                        class="update-btn">

                    Update Course

                </button>

            </form>

        </div>

    </div>

</body>

</html>