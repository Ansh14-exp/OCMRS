package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.InterviewDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.Interview;
import com.ocmrs.model.User;


@WebServlet("/CompanyInterviewScheduleServlet")
public class CompanyInterviewScheduleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO;

    @Override
    public void init() throws ServletException {
        interviewDAO = new InterviewDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // =========================
        // SESSION CHECK
        // =========================

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // =========================
        // USER CHECK
        // =========================

        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // =========================
        // COMPANY CHECK
        // =========================

        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );

            return;
        }

        // =========================
        // GET FORM DATA
        // =========================

        String applicationIdParam =
                request.getParameter("applicationId");

        String interviewDate =
                request.getParameter("interviewDate");

        String mode =
                request.getParameter("mode");

        String result =
                request.getParameter("result");

        // =========================
        // VALIDATION
        // =========================

        if (applicationIdParam == null ||
            applicationIdParam.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyApplicantsServlet"
                + "?error=application"
            );

            return;
        }

        if (interviewDate == null ||
            interviewDate.trim().isEmpty() ||
            mode == null ||
            mode.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyApplicantsServlet"
                + "?error=invalid"
            );

            return;
        }

        try {

            int applicationId =
                    Integer.parseInt(
                        applicationIdParam
                    );

            /*
             * HTML datetime-local gives:
             *
             * 2026-09-30T10:30
             *
             * Java Timestamp requires:
             *
             * 2026-09-30 10:30:00
             */

            String formattedDate =
                    interviewDate.replace("T", " ");

            if (formattedDate.length() == 16) {
                formattedDate += ":00";
            }

            // =========================
            // CREATE INTERVIEW
            // =========================

            Interview interview =
                    new Interview();

            interview.setApplicationId(
                applicationId
            );

            interview.setInterviewDate(
                formattedDate
            );

            interview.setMode(
                mode.trim()
            );

            if (result == null ||
                result.trim().isEmpty()) {

                result = "Pending";
            }

            interview.setResult(
                result.trim()
            );

            // =========================
            // SAVE INTERVIEW
            // =========================

            boolean success =
                    interviewDAO.addInterview(
                        interview
                    );

            if (success) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyInterviewServlet"
                    + "?applicationId="
                    + applicationId
                    + "&success=scheduled"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyInterviewServlet"
                    + "?applicationId="
                    + applicationId
                    + "&error=failed"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyApplicantsServlet"
                + "?error=invalid"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyApplicantsServlet"
                + "?error=failed"
            );
        }
    }
}