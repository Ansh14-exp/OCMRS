package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.FacultyDAO;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.User;


@WebServlet("/FacultyProfileServlet")
public class FacultyProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FacultyDAO facultyDAO;

    @Override
    public void init() throws ServletException {
        facultyDAO = new FacultyDAO();
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

        // Get faculty using logged-in user's ID
        Faculty faculty =
                facultyDAO.getFacultyByUserId(
                    user.getUserId()
                );

        // Faculty not found
        if (faculty == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/faculty/dashboard.jsp"
            );

            return;
        }

        // Store faculty in session
        session.setAttribute(
            "faculty",
            faculty
        );

        // Send faculty to JSP
        request.setAttribute(
            "faculty",
            faculty
        );

        // Open profile page
        request.getRequestDispatcher(
            "/faculty/profile.jsp"
        ).forward(request, response);
    }
}