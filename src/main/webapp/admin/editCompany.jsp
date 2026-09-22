<%@ page import="com.ocmrs.model.Company" %>

<%
    Company company = (Company) request.getAttribute("company");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Company</title>

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
            max-width: 600px;
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
        textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
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

    <h1>Edit Company</h1>

         <form action="<%= request.getContextPath() %>/CompanyServlet" method="post">

        <input type="hidden"
               name="action"
               value="update">

        <input type="hidden"
               name="companyId"
               value="<%= company.getCompanyId() %>">


        <label>Company Name:</label>

        <input type="text"
               name="companyName"
               value="<%= company.getCompanyName() %>"
               required>


        <label>Industry:</label>

        <input type="text"
               name="industry"
               value="<%= company.getIndustry() != null ? company.getIndustry() : "" %>">


        <label>Email:</label>

        <input type="email"
               name="email"
               value="<%= company.getEmail() != null ? company.getEmail() : "" %>">


        <label>Phone:</label>

        <input type="text"
               name="phone"
               value="<%= company.getPhone() != null ? company.getPhone() : "" %>">


        <label>Address:</label>

        <textarea name="address"><%= company.getAddress() != null ? company.getAddress() : "" %></textarea>


        <label>Website:</label>

        <input type="text"
               name="website"
               value="<%= company.getWebsite() != null ? company.getWebsite() : "" %>">


        <button type="submit">
            Update Company
        </button>

    </form>
     
  
</div>

</body>
</html>