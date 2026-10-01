package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.InterviewDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Interview;
import com.ocmrs.model.User;

@WebServlet("/InterviewServlet")
public class InterviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO;
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {

        interviewDAO = new InterviewDAO();
        applicationDAO = new ApplicationDAO();
    }

    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Login check
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        User user =
                (User) session.getAttribute("user");

        // Admin only
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/index.jsp");

            return;
        }

        String action =
                request.getParameter("action");


        // =================================================
        // DELETE
        // =================================================

        if ("delete".equalsIgnoreCase(action)) {

            String idParam =
                    request.getParameter("interviewId");

            try {

                int interviewId =
                        Integer.parseInt(idParam);

                interviewDAO.deleteInterview(interviewId);

            } catch (Exception e) {

                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/InterviewServlet");

            return;
        }


        // =================================================
        // EDIT
        // =================================================

        if ("edit".equalsIgnoreCase(action)) {

            String idParam =
                    request.getParameter("interviewId");

            try {

                if (idParam == null ||
                    idParam.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/InterviewServlet");

                    return;
                }

                int interviewId =
                        Integer.parseInt(idParam);


                // Get interview
                Interview interview =
                        interviewDAO.getInterviewById(
                                interviewId);


                // Interview not found
                if (interview == null) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/InterviewServlet");

                    return;
                }


                // Get all applications
                List<Application> applications =
                        applicationDAO.getAllApplications();


                // Send data to JSP
                request.setAttribute(
                        "interview",
                        interview);

                request.setAttribute(
                        "applications",
                        applications);


                // Open edit page
                request.getRequestDispatcher(
                        "/admin/editInterview.jsp")
                        .forward(request, response);

                return;

            } catch (NumberFormatException e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/InterviewServlet");

                return;
            }
        }


        // =================================================
        // DEFAULT - SHOW ALL INTERVIEWS
        // =================================================

        List<Interview> interviews =
                interviewDAO.getAllInterviews();

        List<Application> applications =
                applicationDAO.getAllApplications();


        request.setAttribute(
                "interviews",
                interviews);

        request.setAttribute(
                "applications",
                applications);


        request.getRequestDispatcher(
                "/admin/interviews.jsp")
                .forward(request, response);
    }


    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);


        // Login check
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }


        User user =
                (User) session.getAttribute("user");


        // Admin only
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/index.jsp");

            return;
        }


        String action =
                request.getParameter("action");


        String applicationIdParam =
                request.getParameter("applicationId");

        String interviewDate =
                request.getParameter("interviewDate");

        String mode =
                request.getParameter("mode");

        String result =
                request.getParameter("result");


        // =================================================
        // APPLICATION ID
        // =================================================

        int applicationId;

        try {

            applicationId =
                    Integer.parseInt(applicationIdParam);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/InterviewServlet");

            return;
        }


        // =================================================
        // CREATE INTERVIEW OBJECT
        // =================================================

        Interview interview =
                new Interview();

        interview.setApplicationId(
                applicationId);


        // =================================================
        // DATETIME CONVERSION
        // =================================================

        if (interviewDate != null &&
            !interviewDate.trim().isEmpty()) {

            /*
             * HTML datetime-local:
             *
             * 2026-09-29T01:14
             *
             * MySQL Timestamp:
             *
             * 2026-09-29 01:14:00
             */

            interviewDate =
                    interviewDate.replace("T", " ");

            if (interviewDate.length() == 16) {

                interviewDate += ":00";
            }

            interview.setInterviewDate(
                    interviewDate);

        } else {

            interview.setInterviewDate(null);
        }


        // =================================================
        // MODE
        // =================================================

        interview.setMode(mode);


        // =================================================
        // RESULT
        // =================================================

        interview.setResult(result);


        // =================================================
        // UPDATE
        // =================================================

        if ("update".equalsIgnoreCase(action)) {

            String interviewIdParam =
                    request.getParameter("interviewId");

            try {

                int interviewId =
                        Integer.parseInt(
                                interviewIdParam);


                interview.setInterviewId(
                        interviewId);


                interviewDAO.updateInterview(
                        interview);


            } catch (Exception e) {

                e.printStackTrace();
            }


        }

        // =================================================
        // ADD
        // =================================================

        else {

            interviewDAO.addInterview(
                    interview);
        }


        // =================================================
        // REDIRECT
        // =================================================

        response.sendRedirect(
                request.getContextPath()
                + "/InterviewServlet");
    }
}