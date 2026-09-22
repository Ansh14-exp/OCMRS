package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.model.Company;

@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CompanyDAO companyDAO;

    @Override
    public void init() throws ServletException {
        companyDAO = new CompanyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

        case "delete":
            deleteCompany(request, response);
            break;

        case "edit":
            editCompany(request, response);
            break;

        default:
            listCompanies(request, response);
            break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addCompany(request, response);

        } else if ("update".equals(action)) {
            updateCompany(request, response);

        } else {
            response.sendRedirect("CompanyServlet");
        }
    }


    // ADD COMPANY
    private void addCompany(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        Company company = new Company();

        company.setCompanyName(request.getParameter("companyName"));
        company.setIndustry(request.getParameter("industry"));
        company.setEmail(request.getParameter("email"));
        company.setPhone(request.getParameter("phone"));
        company.setAddress(request.getParameter("address"));
        company.setWebsite(request.getParameter("website"));

        companyDAO.addCompany(company);

        response.sendRedirect("CompanyServlet");
    }


    // LIST COMPANIES
    private void listCompanies(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {

        List<Company> companies = companyDAO.getAllCompanies();

        request.setAttribute("companies", companies);

        request.getRequestDispatcher("admin/companies.jsp")
               .forward(request, response);
    }


    // EDIT COMPANY
    private void editCompany(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        int companyId =
                Integer.parseInt(request.getParameter("id"));

        Company company =
                companyDAO.getCompanyById(companyId);

        request.setAttribute("company", company);

        request.getRequestDispatcher("admin/editCompany.jsp")
               .forward(request, response);
    }


    // UPDATE COMPANY
    private void updateCompany(HttpServletRequest request,
                               HttpServletResponse response)
            throws IOException {

        Company company = new Company();

        company.setCompanyId(
                Integer.parseInt(request.getParameter("companyId"))
        );

        company.setCompanyName(
                request.getParameter("companyName")
        );

        company.setIndustry(
                request.getParameter("industry")
        );

        company.setEmail(
                request.getParameter("email")
        );

        company.setPhone(
                request.getParameter("phone")
        );

        company.setAddress(
                request.getParameter("address")
        );

        company.setWebsite(
                request.getParameter("website")
        );

        companyDAO.updateCompany(company);

        response.sendRedirect("CompanyServlet");
    }


    // DELETE COMPANY
    private void deleteCompany(HttpServletRequest request,
                               HttpServletResponse response)
            throws IOException {

        int companyId =
                Integer.parseInt(request.getParameter("id"));

        companyDAO.deleteCompany(companyId);

        response.sendRedirect("CompanyServlet");
    }
}