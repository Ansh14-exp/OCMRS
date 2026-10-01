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
import com.ocmrs.model.Job;
import com.ocmrs.model.User;


@WebServlet("/CompanyJobServlet")
public class CompanyJobServlet extends HttpServlet {

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

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );
            return;
        }

        request.setAttribute("company", company);

        request.getRequestDispatcher(
            "/company/post-job.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

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
            response.sendRedirect(
                request.getContextPath()
                + "/CompanyProfileServlet"
            );
            return;
        }

        String title =
                request.getParameter("title");

        String description =
                request.getParameter("description");

        String salaryRange =
                request.getParameter("salaryRange");

        String location =
                request.getParameter("location");

        String lastDate =
                request.getParameter("lastDate");


        if (title == null ||
            title.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyJobServlet?error=title"
            );
            return;
        }


        Job job = new Job();

        // IMPORTANT:
        // company_id comes from logged-in company
        job.setCompanyId(company.getCompanyId());

        job.setTitle(title.trim());
        job.setDescription(description);
        job.setSalaryRange(salaryRange);
        job.setLocation(location);
        job.setLastDate(lastDate);


        boolean success =
                jobDAO.addJob(job);


        if (success) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyJobServlet?success=added"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyJobServlet?error=failed"
            );
        }
    }
}