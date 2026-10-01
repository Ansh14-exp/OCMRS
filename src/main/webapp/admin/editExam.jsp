<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ocmrs.model.Exam" %>

<%
    Exam exam = (Exam) request.getAttribute("exam");

    if (exam == null) {
        response.sendRedirect(
            request.getContextPath() + "/ExamServlet"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Exam | OCMRS</title>

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
            max-width: 850px;

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

            margin-bottom: 8px;
        }

        .subtitle {
            color: #666;

            margin-bottom: 25px;
        }

        .form-grid {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 20px;
        }

        .form-group {

            display: flex;

            flex-direction: column;
        }

        .form-group label {

            font-weight: bold;

            margin-bottom: 8px;

            color: #444;
        }

        .form-group input {

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

            margin-top: 25px;

            display: flex;

            gap: 12px;
        }

        .update-btn {

            background: #2563eb;

            color: white;

            border: none;

            padding: 12px 24px;

            border-radius: 6px;

            cursor: pointer;

            font-weight: bold;

            font-size: 14px;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        .cancel-btn {

            background: #6b7280;

            color: white;

            text-decoration: none;

            padding: 12px 24px;

            border-radius: 6px;

            font-weight: bold;

            font-size: 14px;
        }

        .cancel-btn:hover {
            background: #4b5563;
        }

        .info-box {

            background: #eef2ff;

            border-left: 4px solid #2563eb;

            padding: 12px 15px;

            margin-bottom: 25px;

            color: #374151;
        }

        @media (max-width: 650px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                margin: 20px auto;
            }

            .header {
                padding: 15px;
            }

            .header h1 {
                font-size: 18px;
            }
        }

    </style>

</head>

<body>


<!-- HEADER -->

<div class="header">

    <h1>
        📝 OCMRS - Edit Exam
    </h1>

    <a href="<%= request.getContextPath() %>/ExamServlet"
       class="back-btn">

        ← Back

    </a>

</div>


<!-- CONTAINER -->

<div class="container">

    <div class="card">

        <h2>
            ✏️ Edit Exam
        </h2>

        <p class="subtitle">
            Update the examination details below.
        </p>


        <div class="info-box">

            <b>Exam ID:</b>
            <%= exam.getExamId() %>

        </div>


        <form action="<%= request.getContextPath() %>/ExamServlet"
              method="post">


            <!-- ACTION -->

            <input type="hidden"
                   name="action"
                   value="update">


            <!-- EXAM ID -->

            <input type="hidden"
                   name="examId"
                   value="<%= exam.getExamId() %>">


            <div class="form-grid">


                <!-- SUBJECT ID -->

                <div class="form-group">

                    <label>
                        Subject ID
                    </label>

                    <input type="number"
                           name="subjectId"
                           value="<%= exam.getSubjectId() %>"
                           min="1"
                           required>

                </div>


                <!-- EXAM TYPE -->

                <div class="form-group">

                    <label>
                        Exam Type
                    </label>

                    <input type="text"
                           name="examType"
                           value="<%= exam.getExamType() %>"
                           required>

                </div>


                <!-- EXAM DATE -->

                <div class="form-group">

                    <label>
                        Exam Date
                    </label>

                    <input type="date"
                           name="examDate"
                           value="<%= exam.getExamDate() %>"
                           required>

                </div>


                <!-- TOTAL MARKS -->

                <div class="form-group">

                    <label>
                        Total Marks
                    </label>

                    <input type="number"
                           name="totalMarks"
                           value="<%= exam.getTotalMarks() %>"
                           min="1"
                           required>

                </div>


            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <button type="submit"
                        class="update-btn">

                    💾 Update Exam

                </button>


                <a href="<%= request.getContextPath() %>/ExamServlet"
                   class="cancel-btn">

                    Cancel

                </a>

            </div>


        </form>

    </div>

</div>

</body>

</html>