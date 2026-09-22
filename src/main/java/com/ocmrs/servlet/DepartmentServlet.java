package com.ocmrs.servlet;
import com.ocmrs.dao.CollegeDAO;
import com.ocmrs.model.College;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.DepartmentDAO;
import com.ocmrs.model.Department;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    DepartmentDAO departmentDAO = new DepartmentDAO();
    CollegeDAO collegeDAO = new CollegeDAO();

    // GET
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");


// Delete Department
if ("delete".equals(action)) {

int departmentId = Integer.parseInt(
       request.getParameter("departmentId"));

departmentDAO.deleteDepartment(departmentId);

List<Department> departments =
       departmentDAO.getAllDepartments();

List<com.ocmrs.model.College> colleges =
       collegeDAO.getAllColleges();

request.setAttribute(
       "departments", departments);

request.setAttribute(
       "colleges", colleges);

request.getRequestDispatcher(
       "admin/departments.jsp")
       .forward(request, response);


// Edit Department
} else if ("edit".equals(action)) {

int departmentId = Integer.parseInt(
       request.getParameter("departmentId"));

Department department =
       departmentDAO.getDepartmentById(departmentId);

List<com.ocmrs.model.College> colleges =
       collegeDAO.getAllColleges();

request.setAttribute(
       "department", department);

request.setAttribute(
       "colleges", colleges);

request.getRequestDispatcher(
       "admin/editDepartment.jsp")
       .forward(request, response);


// View All Departments
} else {

List<Department> departments =
       departmentDAO.getAllDepartments();

List<com.ocmrs.model.College> colleges =
       collegeDAO.getAllColleges();

request.setAttribute(
       "departments", departments);

request.setAttribute(
       "colleges", colleges);

request.getRequestDispatcher(
       "admin/departments.jsp")
       .forward(request, response);
}
}
    


    // POST
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");

String collegeId =
  request.getParameter("collegeId");

String departmentName =
  request.getParameter("departmentName");

String hodName =
  request.getParameter("hodName");


Department department =
  new Department();

department.setCollegeId(
  Integer.parseInt(collegeId));

department.setDepartmentName(
  departmentName);

department.setHodName(
  hodName);


// Update Department
if ("update".equals(action)) {

int departmentId = Integer.parseInt(
      request.getParameter("departmentId"));

department.setDepartmentId(departmentId);

departmentDAO.updateDepartment(department);


// Add Department
} else {

departmentDAO.addDepartment(department);
}


response.sendRedirect(
  request.getContextPath()
  + "/DepartmentServlet");
}
}