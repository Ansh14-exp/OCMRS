package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.User;

@WebServlet("/CompanyProfileServlet")
public class CompanyProfileServlet extends HttpServlet {

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

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {

            company =
                companyDAO.getCompanyByUserId(
                    user.getUserId()
                );

            if (company == null) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?error=CompanyNotFound"
                );
                return;
            }

            session.setAttribute("company", company);
        }

        request.setAttribute("company", company);

        request.getRequestDispatcher(
            "/company/profile.jsp"
        ).forward(request, response);
    }
}