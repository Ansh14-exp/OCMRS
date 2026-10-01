package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/CompanyInterviewsServlet")
public class CompanyInterviewsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO;

    @Override
    public void init() throws ServletException {
        interviewDAO = new InterviewDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check session
        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // Get logged-in user
        User user =
                (User) session.getAttribute("user");

        // Check company role
        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // Get company
        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );

            return;
        }

        // Get all interviews of this company
        List<Interview> interviews =
                interviewDAO.getInterviewsByCompanyId(
                    company.getCompanyId()
                );

        // Send data to JSP
        request.setAttribute(
            "company",
            company
        );

        request.setAttribute(
            "interviews",
            interviews
        );

        // Open interviews page
        request.getRequestDispatcher(
            "/company/interviews.jsp"
        ).forward(request, response);
    }
}