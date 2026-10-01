package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.JobDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.User;

@WebServlet("/CompanyDeleteJobServlet")
public class CompanyDeleteJobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        jobDAO = new JobDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session check
        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // User check
        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Company check
        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {
            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );
            return;
        }

        String jobIdParam =
                request.getParameter("jobId");

        if (jobIdParam == null ||
            jobIdParam.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyManageJobServlet?error=invalid"
            );
            return;
        }

        try {

            int jobId =
                    Integer.parseInt(jobIdParam);

            // Delete only if job belongs to logged-in company
            boolean deleted =
                    jobDAO.deleteJobByCompany(
                        jobId,
                        company.getCompanyId()
                    );

            if (deleted) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyManageJobServlet"
                    + "?success=deleted"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyManageJobServlet"
                    + "?error=delete"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyManageJobServlet"
                + "?error=invalid"
            );
        }
    }
}