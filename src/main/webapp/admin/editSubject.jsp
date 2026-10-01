<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.Subject" %>

<%
    Subject subject =
            (Subject) request.getAttribute("subject");

    if (subject == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/SubjectServlet"
        );

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Subject | OCMRS</title>

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
            max-width: 800px;

            margin: 40px auto;

            padding: 0 20px;
        }

        .card {
            background: white;

            padding: 30px;

            border-radius: 12px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            color: #172554;

            margin-bottom: 25px;
        }

        .subject-id {
            background: #eef2ff;

            padding: 12px;

            border-radius: 6px;

            margin-bottom: 25px;

            color: #172554;

            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            font-weight: bold;

            margin-bottom: 7px;

            color: #444;
        }

        .form-group input {
            width: 100%;

            padding: 12px;

            border: 1px solid #ccc;

            border-radius: 6px;

            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;

            border-color: #2563eb;
        }

        .buttons {
            display: flex;

            gap: 12px;

            margin-top: 25px;
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

    </style>

</head>


<body>


    <!-- HEADER -->

    <div class="header">

        <h1>
            📚 OCMRS
        </h1>

        <a href="<%= request.getContextPath() %>/SubjectServlet"
           class="back-btn">

            ← Back to Subjects

        </a>

    </div>


    <!-- MAIN -->

    <div class="container">

        <div class="card">


            <h2>
                ✏️ Edit Subject
            </h2>


            <div class="subject-id">

                Subject ID:
                <%= subject.getSubjectId() %>

            </div>


            <form action="<%= request.getContextPath() %>/SubjectServlet"
                  method="post">


                <!-- ACTION -->

                <input type="hidden"
                       name="action"
                       value="update">


                <!-- SUBJECT ID -->

                <input type="hidden"
                       name="subjectId"
                       value="<%= subject.getSubjectId() %>">


                <!-- COURSE ID -->

                <div class="form-group">

                    <label>
                        Course ID
                    </label>

                    <input type="number"
                           name="courseId"
                           value="<%= subject.getCourseId() %>"
                           required>

                </div>


                <!-- SUBJECT NAME -->

                <div class="form-group">

                    <label>
                        Subject Name
                    </label>

                    <input type="text"
                           name="subjectName"
                           value="<%= subject.getSubjectName() %>"
                           required>

                </div>


                <!-- CREDITS -->

                <div class="form-group">

                    <label>
                        Credits
                    </label>

                    <input type="number"
                           name="credits"
                           value="<%= subject.getCredits() %>"
                           min="1"
                           max="10"
                           required>

                </div>


                <!-- BUTTONS -->

                <div class="buttons">

                    <button type="submit"
                            class="update-btn">

                        💾 Update Subject

                    </button>


                    <a href="<%= request.getContextPath() %>/SubjectServlet"
                       class="cancel-btn">

                        Cancel

                    </a>

                </div>


            </form>


        </div>

    </div>


</body>

</html>b 