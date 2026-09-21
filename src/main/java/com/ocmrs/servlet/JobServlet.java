package com.ocmrs.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.dao.JobDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.Job;

@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO;
    private CompanyDAO companyDAO;

    @Override
    public void init() throws ServletException {
        jobDAO = new JobDAO();
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
            deleteJob(request, response);
            break;

        case "edit":
            editJob(request, response);
            break;

        default:
            listJobs(request, response);
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
            addJob(request, response);

        } else if ("update".equals(action)) {
            updateJob(request, response);

        } else {
            response.sendRedirect(request.getContextPath()
                    + "/JobServlet");
        }
    }

    // ADD JOB
    private void addJob(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        Job job = new Job();

        job.setCompanyId(
                Integer.parseInt(request.getParameter("companyId"))
        );

        job.setTitle(
                request.getParameter("title")
        );

        job.setDescription(
                request.getParameter("description")
        );

        job.setSalaryRange(
                request.getParameter("salaryRange")
        );

        job.setLocation(
                request.getParameter("location")
        );

        String lastDate = request.getParameter("lastDate");

        if (lastDate != null && !lastDate.isEmpty()) {
            job.setLastDate(Date.valueOf(lastDate));
        }

        jobDAO.addJob(job);

        response.sendRedirect(request.getContextPath()
                + "/JobServlet");
    }

    // LIST JOBS
    private void listJobs(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        List<Job> jobs = jobDAO.getAllJobs();

        List<Company> companies =
                companyDAO.getAllCompanies();

        request.setAttribute("jobs", jobs);
        request.setAttribute("companies", companies);

        request.getRequestDispatcher(
                "admin/jobs.jsp"
        ).forward(request, response);
    }

    // EDIT JOB
    private void editJob(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int jobId =
                Integer.parseInt(request.getParameter("id"));

        Job job = jobDAO.getJobById(jobId);

        List<Company> companies =
                companyDAO.getAllCompanies();

        request.setAttribute("job", job);
        request.setAttribute("companies", companies);

        request.getRequestDispatcher(
                "admin/editJob.jsp"
        ).forward(request, response);
    }

    // UPDATE JOB
    private void updateJob(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException {

        Job job = new Job();

        job.setJobId(
                Integer.parseInt(
                        request.getParameter("jobId")
                )
        );

        job.setCompanyId(
                Integer.parseInt(
                        request.getParameter("companyId")
                )
        );

        job.setTitle(
                request.getParameter("title")
        );

        job.setDescription(
                request.getParameter("description")
        );

        job.setSalaryRange(
                request.getParameter("salaryRange")
        );

        job.setLocation(
                request.getParameter("location")
        );

        String lastDate =
                request.getParameter("lastDate");

        if (lastDate != null && !lastDate.isEmpty()) {
            job.setLastDate(Date.valueOf(lastDate));
        }

        jobDAO.updateJob(job);

        response.sendRedirect(request.getContextPath()
                + "/JobServlet");
    }

    // DELETE JOB
    private void deleteJob(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException {

        int jobId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        jobDAO.deleteJob(jobId);

        response.sendRedirect(request.getContextPath()
                + "/JobServlet");
    }
}