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
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Company;
import com.ocmrs.model.User;

@WebServlet("/CompanyPlacementServlet")
public class CompanyPlacementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO;
    private PlacementDAO placementDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
        placementDAO = new PlacementDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // ================= SESSION CHECK =================

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // ================= COMPANY =================

        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyProfileServlet");

            return;
        }

        // ================= APPLICATION ID =================

        String applicationIdParam =
                request.getParameter("applicationId");

        /*
         * If no applicationId is supplied,
         * show existing placement records.
         */

        if (applicationIdParam == null ||
            applicationIdParam.trim().isEmpty()) {

            request.setAttribute(
                    "company",
                    company);

            request.setAttribute(
                    "placements",
                    placementDAO.getPlacementsByCompanyId(
                            company.getCompanyId()));

            request.getRequestDispatcher(
                    "/company/placement.jsp")
                   .forward(request, response);

            return;
        }

        // ================= PARSE APPLICATION ID =================

        int applicationId;

        try {

            applicationId =
                    Integer.parseInt(applicationIdParam);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyApplicantsServlet");

            return;
        }

        // ================= GET APPLICATION =================

        Application application =
                applicationDAO.getApplicationById(
                        applicationId);

        if (application == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyApplicantsServlet");

            return;
        }

        // ================= COMPANY OWNERSHIP CHECK =================

        /*
         * ApplicationDAO does not directly give us
         * companyId, so verify that the application's
         * job belongs to the logged-in company.
         */

        boolean belongsToCompany =
                applicationDAO.applicationBelongsToCompany(
                        applicationId,
                        company.getCompanyId());

        if (!belongsToCompany) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyApplicantsServlet");

            return;
        }

        // ================= STATUS CHECK =================

        if (application.getStatus() == null ||
            !"Selected".equalsIgnoreCase(
                    application.getStatus())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyApplicantsServlet");

            return;
        }

        // ================= SEND DATA =================

        request.setAttribute(
                "company",
                company);

        request.setAttribute(
                "application",
                application);

        request.getRequestDispatcher(
                "/company/create-placement.jsp")
               .forward(request, response);
    }
}