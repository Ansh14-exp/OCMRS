package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.User;

@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CompanyDAO companyDAO;

    @Override
    public void init() throws ServletException {
        companyDAO = new CompanyDAO();
    }

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Only ADMIN can manage companies
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/AdminServlet");
            return;
        }

        String action = request.getParameter("action");

        // =========================
        // DELETE
        // =========================
        if ("delete".equals(action)) {

            try {

                int companyId =
                        Integer.parseInt(request.getParameter("companyId"));

                boolean deleted =
                        companyDAO.deleteCompany(companyId);

                if (deleted) {
                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=deleted");
                } else {
                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=deleteFailed");
                }

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=invalidId");
            }

            return;
        }

        // =========================
        // EDIT
        // =========================
        if ("edit".equals(action)) {

            try {

                int companyId =
                        Integer.parseInt(request.getParameter("companyId"));

                Company company =
                        companyDAO.getCompanyById(companyId);

                if (company == null) {
                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=notFound");
                    return;
                }

                request.setAttribute("company", company);

                request.getRequestDispatcher(
                        "/admin/editCompany.jsp")
                        .forward(request, response);

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=invalidId");
            }

            return;
        }

        // =========================
        // DEFAULT - VIEW ALL
        // =========================

        request.setAttribute(
                "companies",
                companyDAO.getAllCompanies());

        request.getRequestDispatcher(
                "/admin/companies.jsp")
                .forward(request, response);
    }


    // =========================
    // POST
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Only ADMIN
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/AdminServlet");
            return;
        }

        String action = request.getParameter("action");

        // =========================
        // ADD COMPANY
        // =========================
        if ("add".equals(action)) {

            String companyName =
                    request.getParameter("companyName");

            String industry =
                    request.getParameter("industry");

            String email =
                    request.getParameter("email");

            String phone =
                    request.getParameter("phone");

            String address =
                    request.getParameter("address");

            String website =
                    request.getParameter("website");

            // Company name is required
            if (companyName == null ||
                companyName.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=nameRequired");

                return;
            }

            Company company = new Company();

            company.setCompanyName(companyName.trim());
            company.setIndustry(industry);
            company.setEmail(email);
            company.setPhone(phone);
            company.setAddress(address);
            company.setWebsite(website);

            boolean added =
                    companyDAO.addCompany(company);

            if (added) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=added");

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=addFailed");
            }

            return;
        }


        // =========================
        // UPDATE COMPANY
        // =========================
        if ("update".equals(action)) {

            try {

                int companyId =
                        Integer.parseInt(
                                request.getParameter("companyId"));

                String companyName =
                        request.getParameter("companyName");

                String industry =
                        request.getParameter("industry");

                String email =
                        request.getParameter("email");

                String phone =
                        request.getParameter("phone");

                String address =
                        request.getParameter("address");

                String website =
                        request.getParameter("website");

                if (companyName == null ||
                    companyName.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=nameRequired");

                    return;
                }

                Company company = new Company();

                company.setCompanyId(companyId);
                company.setCompanyName(companyName.trim());
                company.setIndustry(industry);
                company.setEmail(email);
                company.setPhone(phone);
                company.setAddress(address);
                company.setWebsite(website);

                boolean updated =
                        companyDAO.updateCompany(company);

                if (updated) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=updated");

                } else {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/CompanyServlet?message=updateFailed");
                }

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyServlet?message=invalidId");
            }

            return;
        }

        // Unknown action
        response.sendRedirect(
                request.getContextPath()
                + "/CompanyServlet");
    }
}