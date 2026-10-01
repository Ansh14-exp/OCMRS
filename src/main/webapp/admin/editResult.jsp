<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>

<%@ page import="com.ocmrs.model.Result" %>
<%@ page import="com.ocmrs.model.Exam" %>
<%@ page import="com.ocmrs.model.Student" %>


<%
    Result result =
        (Result) request.getAttribute("result");


    List<Exam> exams =
        (List<Exam>) request.getAttribute("exams");


    List<Student> students =
        (List<Student>) request.getAttribute("students");


    if (result == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/ResultServlet"
        );

        return;
    }
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Result | OCMRS</title>


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

    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}


.card h2 {

    color: #172554;

    margin-bottom: 8px;
}


.subtitle {

    color: #666;

    margin-bottom: 25px;
}


.info-box {

    background: #eef2ff;

    border-left: 4px solid #2563eb;

    padding: 12px 15px;

    margin-bottom: 25px;

    color: #374151;
}


.form-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

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


.form-group input,
.form-group select {

    padding: 12px;

    border: 1px solid #ccc;

    border-radius: 6px;

    font-size: 14px;

    background: white;
}


.form-group input:focus,
.form-group select:focus {

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

    <h1>📊 OCMRS - Edit Result</h1>


    <a href="<%= request.getContextPath() %>/ResultServlet"
       class="back-btn">

        ← Back

    </a>

</div>


<!-- MAIN -->

<div class="container">


<div class="card">


    <h2>✏️ Edit Result</h2>


    <p class="subtitle">

        Update the student's result details below.

    </p>


    <!-- RESULT ID -->

    <div class="info-box">

        <b>Result ID:</b>

        <%= result.getResultId() %>

    </div>


    <!-- FORM -->

    <form action="<%= request.getContextPath() %>/ResultServlet"
          method="post">


        <input type="hidden"
               name="action"
               value="update">


        <input type="hidden"
               name="resultId"
               value="<%= result.getResultId() %>">


        <div class="form-grid">


            <!-- EXAM -->

            <div class="form-group">

                <label>Exam</label>


                <select name="examId" required>


                    <option value="">
                        -- Select Exam --
                    </option>


                    <% if (exams != null) { %>


                        <% for (Exam exam : exams) { %>


                            <option
                                value="<%= exam.getExamId() %>"
                                <%= exam.getExamId() == result.getExamId()
                                    ? "selected"
                                    : "" %>
                            >

                                Exam
                                <%= exam.getExamId() %>

                                -
                                <%= exam.getExamType() %>

                                -
                                <%= exam.getExamDate() %>

                            </option>


                        <% } %>


                    <% } %>


                </select>

            </div>


            <!-- STUDENT -->

            <div class="form-group">

                <label>Student</label>


                <select name="studentId" required>


                    <option value="">
                        -- Select Student --
                    </option>


                    <% if (students != null) { %>


                        <% for (Student student : students) { %>


                            <option
                                value="<%= student.getStudentId() %>"
                                <%= student.getStudentId() == result.getStudentId()
                                    ? "selected"
                                    : "" %>
                            >

                                <%= student.getName() %>

                                -
                                ID:
                                <%= student.getStudentId() %>

                            </option>


                        <% } %>


                    <% } %>


                </select>

            </div>


            <!-- MARKS -->

            <div class="form-group">

                <label>Marks</label>


                <input type="number"
                       name="marks"
                       value="<%= result.getMarks() %>"
                       min="0"
                       step="0.01"
                       required>

            </div>


            <!-- GRADE -->

            <div class="form-group">

                <label>Grade</label>


                <select name="grade" required>


                    <option value="">
                        -- Select Grade --
                    </option>


                    <option value="A+"
                        <%= "A+".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        A+

                    </option>


                    <option value="A"
                        <%= "A".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        A

                    </option>


                    <option value="B+"
                        <%= "B+".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        B+

                    </option>


                    <option value="B"
                        <%= "B".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        B

                    </option>


                    <option value="C"
                        <%= "C".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        C

                    </option>


                    <option value="D"
                        <%= "D".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        D

                    </option>


                    <option value="F"
                        <%= "F".equals(result.getGrade())
                            ? "selected"
                            : "" %>>

                        F

                    </option>


                </select>

            </div>


        </div>


        <!-- BUTTONS -->

        <div class="buttons">


            <button type="submit"
                    class="update-btn">

                💾 Update Result

            </button>


            <a href="<%= request.getContextPath() %>/ResultServlet"
               class="cancel-btn">

                Cancel

            </a>


        </div>


    </form>


</div>

</div>


</body>

</html>