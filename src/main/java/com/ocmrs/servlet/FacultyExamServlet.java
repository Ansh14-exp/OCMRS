package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ExamDAO;
import com.ocmrs.model.Exam;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.User;

@WebServlet("/FacultyExamServlet")
public class FacultyExamServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ExamDAO examDAO;

    @Override
    public void init() throws ServletException {
        examDAO = new ExamDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // ================================================
        // SESSION CHECK
        // ================================================

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        // ================================================
        // USER CHECK
        // ================================================

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


        // ================================================
        // FACULTY CHECK
        // ================================================

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyProfileServlet"
            );

            return;
        }


        // ================================================
        // GET FACULTY EXAMS
        // ================================================

        List<Exam> examList =
                examDAO.getExamsByFacultyId(
                        faculty.getFacultyId()
                );


        // ================================================
        // SEND DATA TO JSP
        // ================================================

        request.setAttribute(
                "examList",
                examList
        );

        request.setAttribute(
                "faculty",
                faculty
        );


        // ================================================
        // OPEN FACULTY EXAMS PAGE
        // ================================================

        request.getRequestDispatcher(
                "/faculty/exams.jsp"
        ).forward(request, response);
    }
}