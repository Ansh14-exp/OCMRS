package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.JobDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.Job;
import com.ocmrs.model.User;


@WebServlet("/CompanyManageJobServlet")
public class CompanyManageJobServlet extends HttpServlet {

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

        // Logged-in user
        User user = (User) session.getAttribute("user");

        // Company role check
        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in company
        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );
            return;
        }

        // Get only this company's jobs
        List<Job> jobs =
                jobDAO.getJobsByCompanyId(
                    company.getCompanyId()
                );

        // Send jobs to JSP
        request.setAttribute("jobs", jobs);

        // Send company information
        request.setAttribute("company", company);

        // Forward to Manage Jobs page
        request.getRequestDispatcher(
            "/company/manage-jobs.jsp"
        ).forward(request, response);
    }
}