<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Interview" %>
<%@ page import="com.ocmrs.model.Application" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Interview Management</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-container {
            background: white;
            padding: 20px;
            margin: 20px auto;
            width: 90%;
            max-width: 700px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            margin-top: 0;
            color: #444;
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 98%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .edit,
        .delete {
            display: inline-block;
            padding: 6px 12px;
            margin: 3px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .edit {
            background-color: #007bff;
        }

        .edit:hover {
            background-color: #0056b3;
        }

        .delete {
            background-color: #dc3545;
        }

        .delete:hover {
            background-color: #b02a37;
        }

    </style>

</head>

<body>

<h1>Interview Management</h1>


<!-- ADD INTERVIEW -->

<div class="form-container">

    <h2>Add Interview</h2>

    <form action="/OCMRS/InterviewServlet" method="post">

        <input type="hidden"
               name="action"
               value="add">


        <label>Application:</label>

        <select name="applicationId" required>

            <option value="">
                -- Select Application --
            </option>

            <%
                List<Application> applications =
                    (List<Application>)
                    request.getAttribute("applications");

                if (applications != null) {

                    for (Application app :
                            applications) {
            %>

            <option value="<%= app.getApplicationId() %>">
                Application #<%= app.getApplicationId() %>
            </option>

            <%
                    }
                }
            %>

        </select>


        <label>Interview Date & Time:</label>

        <input type="datetime-local"
               name="interviewDate">


        <label>Mode:</label>

        <select name="mode">

            <option value="">
                -- Select Mode --
            </option>

            <option value="Online">
                Online
            </option>

            <option value="Offline">
                Offline
            </option>

            <option value="Hybrid">
                Hybrid
            </option>

        </select>


        <label>Result:</label>

        <select name="result">

            <option value="">
                -- Select Result --
            </option>

            <option value="Pending">
                Pending
            </option>

            <option value="Selected">
                Selected
            </option>

            <option value="Rejected">
                Rejected
            </option>

        </select>


        <button type="submit">
            Add Interview
        </button>

    </form>

</div>


<!-- INTERVIEW LIST -->

<h2 style="text-align:center;">
    Interview List
</h2>


<table>

    <tr>

        <th>ID</th>
        <th>Application</th>
        <th>Interview Date</th>
        <th>Mode</th>
        <th>Result</th>
        <th>Actions</th>

    </tr>


<%
    List<Interview> interviews =
        (List<Interview>)
        request.getAttribute("interviews");

    if (interviews != null
            && !interviews.isEmpty()) {

        for (Interview interview :
                interviews) {
%>

    <tr>

        <td>
            <%= interview.getInterviewId() %>
        </td>

        <td>
            Application #<%= interview.getApplicationId() %>
        </td>

        <td>
            <%= interview.getInterviewDate() != null
                ? interview.getInterviewDate()
                : "" %>
        </td>

        <td>
            <%= interview.getMode() != null
                ? interview.getMode()
                : "" %>
        </td>

        <td>
            <%= interview.getResult() != null
                ? interview.getResult()
                : "" %>
        </td>

        <td>

            <a class="edit"
               href="/OCMRS/InterviewServlet?action=edit&id=<%= interview.getInterviewId() %>">
                Edit
            </a>

            <a class="delete"
               href="/OCMRS/InterviewServlet?action=delete&id=<%= interview.getInterviewId() %>"
               onclick="return confirm('Are you sure you want to delete this interview?');">
                Delete
            </a>

        </td>

    </tr>

<%
        }

    } else {
%>

    <tr>

        <td colspan="6">
            No interviews found.
        </td>

    </tr>

<%
    }
%>

</table>

</body>

</html>