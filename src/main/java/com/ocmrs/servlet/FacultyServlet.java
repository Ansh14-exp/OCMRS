package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.DepartmentDAO;
import com.ocmrs.dao.FacultyDAO;
import com.ocmrs.model.Department;
import com.ocmrs.model.Faculty;

@WebServlet("/FacultyServlet")
public class FacultyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    FacultyDAO facultyDAO = new FacultyDAO();
    DepartmentDAO departmentDAO = new DepartmentDAO();


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");


        // Delete Faculty
        if ("delete".equals(action)) {

            int facultyId = Integer.parseInt(
                    request.getParameter("facultyId"));

            facultyDAO.deleteFaculty(facultyId);

            List<Faculty> facultyList =
                    facultyDAO.getAllFaculty();

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "facultyList", facultyList);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/faculty.jsp")
                    .forward(request, response);


        // Edit Faculty
        } else if ("edit".equals(action)) {

            int facultyId = Integer.parseInt(
                    request.getParameter("facultyId"));

            Faculty faculty =
                    facultyDAO.getFacultyById(facultyId);

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "faculty", faculty);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/editFaculty.jsp")
                    .forward(request, response);


        // View All Faculty
        } else {

            List<Faculty> facultyList =
                    facultyDAO.getAllFaculty();

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "facultyList", facultyList);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/faculty.jsp")
                    .forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        String departmentId =
                request.getParameter("departmentId");

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");

        String designation =
                request.getParameter("designation");


        Faculty faculty =
                new Faculty();

        faculty.setDepartmentId(
                Integer.parseInt(departmentId));

        faculty.setName(name);

        faculty.setEmail(email);

        faculty.setPhone(phone);

        faculty.setDesignation(designation);


        // Update Faculty
        if ("update".equals(action)) {

            int facultyId =
                    Integer.parseInt(
                            request.getParameter("facultyId"));

            faculty.setFacultyId(facultyId);

            facultyDAO.updateFaculty(faculty);


        // Add Faculty
        } else {

            facultyDAO.addFaculty(faculty);
        }


        response.sendRedirect(
                request.getContextPath()
                + "/FacultyServlet");
    }
}