<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Application" %>

<%
    Interview interview =
            (Interview) request.getAttribute("interview");

    List<Application> applications =
            (List<Application>) request.getAttribute("applications");

    if (interview == null) {
        response.sendRedirect(
                request.getContextPath() + "/InterviewServlet");
        return;
    }

    if (applications == null) {
        applications = new java.util.ArrayList<Application>();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Interview</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        .container {
            width: 92%;
            max-width: 850px;
            margin: 40px auto;
        }

        .header {
            background: linear-gradient(135deg, #182848, #4b6cb7);
            color: white;
            padding: 25px 30px;
            border-radius: 15px 15px 0 0;
        }

        .header h1 {
            font-size: 27px;
            margin-bottom: 7px;
        }

        .header p {
            opacity: 0.9;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 0 0 15px 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .info {
            background: #eef4ff;
            border-left: 4px solid #4b6cb7;
            padding: 13px 15px;
            margin-bottom: 25px;
            border-radius: 5px;
            color: #304b80;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        input,
        select {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccd3df;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #4b6cb7;
        }

        .no-app {
            background: #fff3cd;
            color: #856404;
            padding: 12px;
            border-radius: 7px;
            margin-top: 8px;
            font-size: 14px;
        }

        .button-area {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .update-btn,
        .cancel-btn {
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
            border: none;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-btn {
            background: #4b6cb7;
            color: white;
        }

        .update-btn:hover {
            background: #182848;
        }

        .cancel-btn {
            background: #e8ebf0;
            color: #333;
        }

        .cancel-btn:hover {
            background: #d9dde5;
        }

    </style>

</head>

<body>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>Edit Interview</h1>

        <p>
            Update interview information
        </p>

    </div>


    <div class="card">

        <!-- INTERVIEW INFO -->

        <div class="info">

            Editing Interview

            <strong>
                #<%= interview.getInterviewId() %>
            </strong>

        </div>


        <!-- FORM -->

        <form action="<%= request.getContextPath() %>/InterviewServlet"
              method="post">

            <!-- ACTION -->

            <input type="hidden"
                   name="action"
                   value="update">


            <!-- INTERVIEW ID -->

            <input type="hidden"
                   name="interviewId"
                   value="<%= interview.getInterviewId() %>">


            <!-- APPLICATION -->

            <div class="form-group">

                <label>
                    Application
                </label>

                <% if (applications.isEmpty()) { %>

                    <div class="no-app">
                        No application found.
                    </div>

                <% } else { %>

                    <select name="applicationId"
                            required>

                        <option value="">
                            -- Select Application --
                        </option>

                        <% for (Application app : applications) { %>

                            <option
                                value="<%= app.getApplicationId() %>"
                                <%= app.getApplicationId()
                                    == interview.getApplicationId()
                                    ? "selected"
                                    : "" %>>

                                #APP<%= app.getApplicationId() %>
                                -
                                <%= app.getJobTitle() %>
                                -
                                <%= app.getCompanyName() %>

                            </option>

                        <% } %>

                    </select>

                <% } %>

            </div>


            <!-- INTERVIEW DATE -->

            <div class="form-group">

                <label>
                    Interview Date & Time
                </label>

                <%
                    String dateValue =
                            interview.getInterviewDate();

                    if (dateValue != null &&
                        !dateValue.trim().isEmpty()) {

                        dateValue =
                                dateValue.replace(" ", "T");

                        if (dateValue.length() > 16) {

                            dateValue =
                                    dateValue.substring(0, 16);
                        }
                    }
                %>

                <input type="datetime-local"
                       name="interviewDate"
                       value="<%= dateValue != null ? dateValue : "" %>"
                       required>

            </div>


            <!-- MODE -->

            <div class="form-group">

                <label>
                    Interview Mode
                </label>

                <select name="mode"
                        required>

                    <option value="">
                        -- Select Mode --
                    </option>

                    <option value="Online"
                        <%= "Online".equalsIgnoreCase(
                                interview.getMode())
                                ? "selected"
                                : "" %>>
                        Online
                    </option>

                    <option value="Offline"
                        <%= "Offline".equalsIgnoreCase(
                                interview.getMode())
                                ? "selected"
                                : "" %>>
                        Offline
                    </option>

                    <option value="Hybrid"
                        <%= "Hybrid".equalsIgnoreCase(
                                interview.getMode())
                                ? "selected"
                                : "" %>>
                        Hybrid
                    </option>

                </select>

            </div>


            <!-- RESULT -->

            <div class="form-group">

                <label>
                    Result
                </label>

                <select name="result">

                    <option value="Pending"
                        <%= "Pending".equalsIgnoreCase(
                                interview.getResult())
                                ? "selected"
                                : "" %>>
                        Pending
                    </option>

                    <option value="Selected"
                        <%= "Selected".equalsIgnoreCase(
                                interview.getResult())
                                ? "selected"
                                : "" %>>
                        Selected
                    </option>

                    <option value="Rejected"
                        <%= "Rejected".equalsIgnoreCase(
                                interview.getResult())
                                ? "selected"
                                : "" %>>
                        Rejected
                    </option>

                </select>

            </div>


            <!-- BUTTONS -->

            <div class="button-area">

                <button type="submit"
                        class="update-btn">

                    Update Interview

                </button>


                <a href="<%= request.getContextPath() %>/InterviewServlet"
                   class="cancel-btn">

                    Cancel

                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>