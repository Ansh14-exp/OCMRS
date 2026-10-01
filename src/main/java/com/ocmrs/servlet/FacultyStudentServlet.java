package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;


@WebServlet("/FacultyStudentServlet")
public class FacultyStudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session =
                request.getSession(false);

        // Session check
        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in user
        User user =
                (User) session.getAttribute("user");

        // Faculty role check
        if (user == null ||
            !"FACULTY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in faculty
        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        // If faculty session is missing
        if (faculty == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/FacultyProfileServlet"
            );

            return;
        }

        /*
         * Get students belonging to the
         * faculty's department.
         */
        List<Student> studentList =
                studentDAO.getStudentsByDepartmentId(
                    faculty.getDepartmentId()
                );

        // Send students to JSP
        request.setAttribute(
            "studentList",
            studentList
        );

        request.setAttribute(
            "faculty",
            faculty
        );

        // Open Faculty Students page
        request.getRequestDispatcher(
            "/faculty/students.jsp"
        ).forward(request, response);
    }
}