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
import com.ocmrs.model.Company;
import com.ocmrs.model.Interview;
import com.ocmrs.model.User;


@WebServlet("/CompanyInterviewServlet")
public class CompanyInterviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO;
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {

        interviewDAO = new InterviewDAO();
        applicationDAO = new ApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // =========================
        // SESSION CHECK
        // =========================

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
        // GET APPLICATION ID
        // =========================

        String applicationIdParam =
                request.getParameter("applicationId");

        if (applicationIdParam != null &&
            !applicationIdParam.trim().isEmpty()) {

            try {

                int applicationId =
                        Integer.parseInt(
                            applicationIdParam
                        );

                /*
                 * Get the application.
                 */
                Application application =
                        applicationDAO.getApplicationById(
                            applicationId
                        );

                /*
                 * Application must exist.
                 */
                if (application == null) {

                    response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyApplicantsServlet"
                        + "?error=application"
                    );

                    return;
                }

                /*
                 * Verify that this application
                 * belongs to the logged-in company.
                 *
                 * We check the job's company_id
                 * directly from database.
                 */
                boolean validApplication =
                        isApplicationBelongsToCompany(
                            applicationId,
                            company.getCompanyId()
                        );

                if (!validApplication) {

                    response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyApplicantsServlet"
                        + "?error=unauthorized"
                    );

                    return;
                }

                /*
                 * Get existing interviews
                 * for this application.
                 */
                List<Interview> interviews =
                        interviewDAO
                        .getInterviewsByApplicationId(
                            applicationId
                        );

                request.setAttribute(
                    "application",
                    application
                );

                request.setAttribute(
                    "interviews",
                    interviews
                );

            } catch (NumberFormatException e) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyApplicantsServlet"
                    + "?error=invalid"
                );

                return;
            }
        }

        // =========================
        // COMPANY DATA
        // =========================

        request.setAttribute(
            "company",
            company
        );

        // =========================
        // OPEN INTERVIEW PAGE
        // =========================

        request.getRequestDispatcher(
            "/company/interview.jsp"
        ).forward(request, response);
    }


    // =================================================
    // CHECK APPLICATION BELONGS TO LOGGED-IN COMPANY
    // =================================================

    private boolean isApplicationBelongsToCompany(
            int applicationId,
            int companyId) {

        String sql =
            "SELECT COUNT(*) "
          + "FROM application a "
          + "INNER JOIN job j "
          + "ON a.job_id = j.job_id "
          + "WHERE a.application_id = ? "
          + "AND j.company_id = ?";

        try (java.sql.Connection con =
                com.ocmrs.util.DBConnection.getConnection();

             java.sql.PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);
            ps.setInt(2, companyId);

            try (java.sql.ResultSet rs =
                    ps.executeQuery()) {

                if (rs.next()) {

                    return rs.getInt(1) > 0;
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}