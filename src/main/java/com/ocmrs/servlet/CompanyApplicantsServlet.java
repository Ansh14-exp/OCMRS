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
import com.ocmrs.model.Application;
import com.ocmrs.model.Company;
import com.ocmrs.model.User;

@WebServlet("/CompanyApplicantsServlet")
public class CompanyApplicantsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
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

        // Get applications for this company
        List<Application> applications =
                applicationDAO.getApplicationsByCompanyId(
                    company.getCompanyId()
                );

        // Send applications to JSP
        request.setAttribute(
            "applications",
            applications
        );

        // Send company information
        request.setAttribute(
            "company",
            company
        );

        // Open applicants page
        request.getRequestDispatcher(
            "/company/applicants.jsp"
        ).forward(request, response);
    }
}