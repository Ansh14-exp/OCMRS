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

@WebServlet("/CompanyEditJobServlet")
public class CompanyEditJobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        jobDAO = new JobDAO();
    }

    // =========================
    // GET - Open Edit Page
    // =========================
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

        String jobIdParam =
                request.getParameter("jobId");

        if (jobIdParam == null ||
            jobIdParam.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyManageJobServlet"
            );
            return;
        }

        try {

            int jobId = Integer.parseInt(jobIdParam);

            Job job = jobDAO.getJobById(jobId);

            // Security check:
            // Job must belong to logged-in company
            if (job == null ||
                job.getCompanyId() != company.getCompanyId()) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyManageJobServlet?error=unauthorized"
                );
                return;
            }

            request.setAttribute("job", job);

            request.getRequestDispatcher(
                "/company/edit-job.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyManageJobServlet?error=invalid"
            );
        }
    }


    // =========================
    // POST - Update Job
    // =========================
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

        try {

            int jobId = Integer.parseInt(
                request.getParameter("jobId")
            );

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
                    + "/CompanyEditJobServlet?jobId="
                    + jobId
                    + "&error=title"
                );
                return;
            }


            Job job = new Job();

            job.setJobId(jobId);
            job.setCompanyId(company.getCompanyId());
            job.setTitle(title.trim());
            job.setDescription(description);
            job.setSalaryRange(salaryRange);
            job.setLocation(location);
            job.setLastDate(lastDate);


            boolean success =
                jobDAO.updateJobByCompany(
                    job,
                    company.getCompanyId()
                );


            if (success) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyManageJobServlet"
                    + "?success=updated"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyEditJobServlet?jobId="
                    + jobId
                    + "&error=failed"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                request.getContextPath()
                + "/CompanyManageJobServlet?error=failed"
            );
        }
    }
}