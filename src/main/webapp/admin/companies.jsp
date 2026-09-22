<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Company" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Management</title>

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

        input,
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
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
            width: 95%;
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

<h1>Company Management</h1>


<!-- ADD COMPANY FORM -->

<div class="form-container">

    <h2>Add Company</h2>

   <form action="<%= request.getContextPath() %>/CompanyServlet" method="post">

        <input type="hidden" name="action" value="add">

        <label>Company Name:</label>
        <input type="text"
               name="companyName"
               required>

        <label>Industry:</label>
        <input type="text"
               name="industry">

        <label>Email:</label>
        <input type="email"
               name="email">

        <label>Phone:</label>
        <input type="text"
               name="phone">

        <label>Address:</label>
        <textarea name="address"></textarea>

        <label>Website:</label>
        <input type="text"
               name="website">

        <button type="submit">Add Company</button>

    </form>

</div>


<!-- COMPANY LIST -->

<h2 style="text-align:center;">Company List</h2>

<table>

    <tr>
        <th>ID</th>
        <th>Company Name</th>
        <th>Industry</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Website</th>
        <th>Actions</th>
    </tr>

<%
    List<Company> companies =
        (List<Company>) request.getAttribute("companies");

    if (companies != null && !companies.isEmpty()) {

        for (Company company : companies) {
%>

    <tr>

        <td><%= company.getCompanyId() %></td>

        <td><%= company.getCompanyName() %></td>

        <td><%= company.getIndustry() %></td>

        <td><%= company.getEmail() %></td>

        <td><%= company.getPhone() %></td>

        <td><%= company.getAddress() %></td>

        <td><%= company.getWebsite() %></td>

        <td>
            
       <a class="edit"
       href="/OCMRS/CompanyServlet?action=edit&id=<%= company.getCompanyId() %>">
        Edit
        </a>
            
            <a class="delete"
               href="<%= request.getContextPath() %>/CompanyServlet?action=delete&id=<%= company.getCompanyId() %>"
               onclick="return confirm('Are you sure you want to delete this company?');">
                Delete
            </a>

        </td>

    </tr>

<%
        }

    } else {
%>

    <tr>
        <td colspan="8">No companies found.</td>
    </tr>

<%
    }
%>

</table>

</body>
</html>