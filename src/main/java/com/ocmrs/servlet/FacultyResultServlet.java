package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ResultDAO;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.Result;
import com.ocmrs.model.User;


@WebServlet("/FacultyResultServlet")
public class FacultyResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ResultDAO resultDAO;

    @Override
    public void init() throws ServletException {
        resultDAO = new ResultDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // ==========================================
        // GET SESSION
        // ==========================================

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        // ==========================================
        // GET LOGGED-IN USER
        // ==========================================

        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            !"FACULTY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        // ==========================================
        // GET FACULTY FROM SESSION
        // ==========================================

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyProfileServlet"
            );

            return;
        }


        // ==========================================
        // GET RESULTS FOR FACULTY SUBJECTS
        // ==========================================

        List<Result> resultList =
                resultDAO.getResultsByFacultyId(
                        faculty.getFacultyId()
                );


        // ==========================================
        // SEND DATA TO JSP
        // ==========================================

        request.setAttribute(
                "resultList",
                resultList
        );

        request.setAttribute(
                "faculty",
                faculty
        );


        // ==========================================
        // FORWARD TO FACULTY RESULTS PAGE
        // ==========================================

        request.getRequestDispatcher(
                "/faculty/results.jsp"
        ).forward(request, response);
    }
}