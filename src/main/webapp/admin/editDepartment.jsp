<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ocmrs.model.Department" %>
<%@ page import="com.ocmrs.model.College" %>

<%
Department department =
(Department) request.getAttribute("department");

List<College> colleges =
    (List<College>) request.getAttribute("colleges");

if (department == null) {
    response.sendRedirect(
        request.getContextPath() + "/DepartmentServlet"
    );
    return;
}

%>

<!DOCTYPE html><html>
<head><meta charset="UTF-8"><title>OCMRS - Edit Department</title><style>

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

.container {
    max-width: 850px;
    margin: 60px auto;
    background: white;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.header h1 {
    color: #172554;
}

.back {
    background: #172554;
    color: white;
    padding: 10px 18px;
    border-radius: 7px;
    text-decoration: none;
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
    margin-bottom: 8px;
    font-weight: bold;
    color: #374151;
}

input,
select {
    width: 100%;
    padding: 13px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    background: white;
}

input:focus,
select:focus {
    border-color: #2563eb;
}

.buttons {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.update {
    background: #2563eb;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
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

</style></head><body><div class="container"><div class="header">

    <h1>✏️ Edit Department</h1>

    <a class="back"
       href="<%= request.getContextPath() %>/DepartmentServlet">
        ← Back
    </a>

</div>

<p class="subtitle">
    Update department information
</p>


<form action="<%= request.getContextPath() %>/DepartmentServlet"
      method="post">

    <!-- ACTION -->
    <input type="hidden"
           name="action"
           value="update">

    <!-- DEPARTMENT ID -->
    <input type="hidden"
           name="departmentId"
           value="<%= department.getDepartmentId() %>">


    <!-- COLLEGE -->

    <div class="form-group">

        <label>Select College</label>

        <select name="collegeId" required>

            <option value="">
                -- Select College --
            </option>

            <%
                if (colleges != null) {

                    for (College college : colleges) {

                        boolean selected =
                            college.getCollegeId()
                            == department.getCollegeId();
            %>

            <option value="<%= college.getCollegeId() %>"
                <%= selected ? "selected" : "" %>>

                <%= college.getCollegeName() %>

            </option>

            <%
                    }
                }
            %>

        </select>

    </div>


    <!-- DEPARTMENT NAME -->

    <div class="form-group">

        <label>Department Name</label>

        <input type="text"
               name="departmentName"
               value="<%= department.getDepartmentName() %>"
               required>

    </div>


    <!-- HOD -->

    <div class="form-group">

        <label>Head of Department</label>

        <input type="text"
               name="hodName"
               value="<%= department.getHodName() %>">

    </div>


    <!-- BUTTONS -->

    <div class="buttons">

        <button type="submit"
                class="update">
            Update Department
        </button>

        <a class="cancel"
           href="<%= request.getContextPath() %>/DepartmentServlet">
            Cancel
        </a>

    </div>

</form>

</div></body>
</html>