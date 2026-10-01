<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.ocmrs.model.College" %>

<%
College college =
(College) request.getAttribute("college");

if (college == null) {
    response.sendRedirect(
        request.getContextPath() + "/CollegeServlet"
    );
    return;
}

%>

<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>OCMRS - Edit College</title>

<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    body {
        background: #f4f7fb;
    }

    .container {
        max-width: 850px;
        margin: 60px auto;
        background: white;
        padding: 35px;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }

    h1 {
        color: #172554;
        margin-bottom: 10px;
    }

    .subtitle {
        color: #6b7280;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #374151;
    }

    input {
        width: 100%;
        padding: 13px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 15px;
        outline: none;
    }

    input:focus {
        border-color: #2563eb;
    }

    .buttons {
        display: flex;
        gap: 12px;
        margin-top: 25px;
    }

    button {
        border: none;
        padding: 12px 25px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 15px;
    }

    .update {
        background: #2563eb;
        color: white;
    }

    .update:hover {
        background: #1d4ed8;
    }

    .cancel {
        background: #6b7280;
        color: white;
        text-decoration: none;
        padding: 12px 25px;
        border-radius: 8px;
    }

</style>

</head><body><div class="container"><h1>✏️ Edit College</h1>

<p class="subtitle">
    Update college information
</p>

<form action="<%= request.getContextPath() %>/CollegeServlet"
      method="post">

    <input type="hidden"
           name="action"
           value="update">

    <input type="hidden"
           name="collegeId"
           value="<%= college.getCollegeId() %>">

    <div class="form-group">

        <label>College Name</label>

        <input type="text"
               name="collegeName"
               value="<%= college.getCollegeName() %>"
               required>

    </div>

    <div class="form-group">

        <label>Address</label>

        <input type="text"
               name="address"
               value="<%= college.getAddress() %>">

    </div>

    <div class="form-group">

        <label>Email</label>

        <input type="email"
               name="email"
               value="<%= college.getEmail() %>">

    </div>

    <div class="form-group">

        <label>Phone</label>

        <input type="text"
               name="phone"
               value="<%= college.getPhone() %>">

    </div>

    <div class="buttons">

        <button type="submit" class="update">
            Update College
        </button>

        <a class="cancel"
           href="<%= request.getContextPath() %>/CollegeServlet">
            Cancel
        </a>

    </div>

</form>

</div></body>
</html>