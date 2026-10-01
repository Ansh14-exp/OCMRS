package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.SubjectDAO;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.Subject;
import com.ocmrs.model.User;

@WebServlet("/FacultySubjectServlet")
public class FacultySubjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubjectDAO subjectDAO;

    @Override
    public void init() throws ServletException {
        subjectDAO = new SubjectDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check session
        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in user
        User user =
                (User) session.getAttribute("user");

        // Check Faculty role
        if (user == null ||
            !"FACULTY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get faculty from session
        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        // If faculty is not available
        if (faculty == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/FacultyProfileServlet"
            );

            return;
        }

        // Get subjects assigned to faculty
        List<Subject> subjectList =
                subjectDAO.getSubjectsByFacultyId(
                    faculty.getFacultyId()
                );

        // Send data to JSP
        request.setAttribute(
            "subjectList",
            subjectList
        );

        request.setAttribute(
            "faculty",
            faculty
        );

        // Open subjects page
        request.getRequestDispatcher(
            "/faculty/subjects.jsp"
        ).forward(request, response);
    }
}