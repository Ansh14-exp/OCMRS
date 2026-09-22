<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Application" %>

<%
    Interview interview =
        (Interview) request.getAttribute("interview");

    List<Application> applications =
        (List<Application>) request.getAttribute("applications");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Interview</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: white;
            width: 90%;
            max-width: 650px;
            margin: 30px auto;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            margin-top: 20px;
            padding: 10px 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .back {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Interview</h1>

    <form action="/OCMRS/InterviewServlet" method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="interviewId"
               value="<%= interview.getInterviewId() %>">


        <label>Application:</label>

        <select name="applicationId" required>

            <option value="">
                -- Select Application --
            </option>

            <%
                if (applications != null) {

                    for (Application app :
                            applications) {

                        if (app.getApplicationId()
                                == interview.getApplicationId()) {
            %>

            <option value="<%= app.getApplicationId() %>"
                    selected>
                Application #<%= app.getApplicationId() %>
            </option>

            <%
                        } else {
            %>

            <option value="<%= app.getApplicationId() %>">
                Application #<%= app.getApplicationId() %>
            </option>

            <%
                        }
                    }
                }
            %>

        </select>


        <label>Interview Date & Time:</label>

        <input type="datetime-local"
               name="interviewDate"
               value="<%= interview.getInterviewDate() != null
                    ? interview.getInterviewDate()
                        .toLocalDateTime()
                        .toString()
                    : "" %>">


        <label>Mode:</label>

        <select name="mode">

            <option value="">
                -- Select Mode --
            </option>

            <option value="Online"
                <%= "Online".equals(interview.getMode())
                    ? "selected"
                    : "" %>>
                Online
            </option>

            <option value="Offline"
                <%= "Offline".equals(interview.getMode())
                    ? "selected"
                    : "" %>>
                Offline
            </option>

            <option value="Hybrid"
                <%= "Hybrid".equals(interview.getMode())
                    ? "selected"
                    : "" %>>
                Hybrid
            </option>

        </select>


        <label>Result:</label>

        <select name="result">

            <option value="">
                -- Select Result --
            </option>

            <option value="Pending"
                <%= "Pending".equals(interview.getResult())
                    ? "selected"
                    : "" %>>
                Pending
            </option>

            <option value="Selected"
                <%= "Selected".equals(interview.getResult())
                    ? "selected"
                    : "" %>>
                Selected
            </option>

            <option value="Rejected"
                <%= "Rejected".equals(interview.getResult())
                    ? "selected"
                    : "" %>>
                Rejected
            </option>

        </select>


        <button type="submit">
            Update Interview
        </button>

    </form>


    

</div>

</body>

</html>edit jsp done