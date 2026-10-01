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
import com.ocmrs.dao.JobDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Company;
import com.ocmrs.model.Job;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;

@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JobDAO jobDAO;
    private CompanyDAO companyDAO;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {

        jobDAO = new JobDAO();
        companyDAO = new CompanyDAO();
        studentDAO = new StudentDAO();
    }

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        User user = (User) session.getAttribute("user");

        String role = user.getRole();

        // ==========================================
        // ADMIN
        // ==========================================

        if ("ADMIN".equalsIgnoreCase(role)) {

            String action = request.getParameter("action");

            // =========================
            // DELETE
            // =========================
            if ("delete".equals(action)) {

                try {

                    int jobId = Integer.parseInt(
                            request.getParameter("jobId"));

                    boolean deleted =
                            jobDAO.deleteJob(jobId);

                    if (deleted) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/JobServlet?message=deleted");

                    } else {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/JobServlet?message=deleteFailed");
                    }

                } catch (NumberFormatException e) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=invalidId");
                }

                return;
            }

            // =========================
            // EDIT
            // =========================
            if ("edit".equals(action)) {

                try {

                    int jobId = Integer.parseInt(
                            request.getParameter("jobId"));

                    Job job = jobDAO.getJobById(jobId);

                    if (job == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/JobServlet?message=notFound");

                        return;
                    }

                    request.setAttribute("job", job);

                    request.setAttribute(
                            "companies",
                            companyDAO.getAllCompanies());

                    request.getRequestDispatcher(
                            "/admin/editJob.jsp")
                            .forward(request, response);

                } catch (NumberFormatException e) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=invalidId");
                }

                return;
            }

            // =========================
            // ADMIN DEFAULT
            // =========================

            request.setAttribute(
                    "jobs",
                    jobDAO.getAllJobs());

            request.setAttribute(
                    "companies",
                    companyDAO.getAllCompanies());

            request.getRequestDispatcher(
                    "/admin/jobs.jsp")
                    .forward(request, response);

            return;
        }

        // ==========================================
        // STUDENT
        // ==========================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            // If student object is not already in session
            if (student == null) {

                student = studentDAO.getStudentByUserId(
                        user.getUserId());

                if (student != null) {

                    session.setAttribute(
                            "student",
                            student);
                }
            }

            request.setAttribute(
                    "jobs",
                    jobDAO.getAllJobs());

            request.getRequestDispatcher(
                    "/student/jobs.jsp")
                    .forward(request, response);

            return;
        }

        // ==========================================
        // OTHER ROLES
        // ==========================================

        response.sendRedirect(
                request.getContextPath() + "/login.jsp");
    }


    // =========================
    // POST
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        User user = (User) session.getAttribute("user");

        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/AdminServlet");

            return;
        }

        String action = request.getParameter("action");

        // ==========================================
        // ADD JOB
        // ==========================================

        if ("add".equals(action)) {

            try {

                int companyId = Integer.parseInt(
                        request.getParameter("companyId"));

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
                            + "/JobServlet?message=titleRequired");

                    return;
                }

                Job job = new Job();

                job.setCompanyId(companyId);
                job.setTitle(title.trim());
                job.setDescription(description);
                job.setSalaryRange(salaryRange);
                job.setLocation(location);
                job.setLastDate(lastDate);

                boolean added =
                        jobDAO.addJob(job);

                if (added) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=added");

                } else {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=addFailed");
                }

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/JobServlet?message=addFailed");
            }

            return;
        }


        // ==========================================
        // UPDATE JOB
        // ==========================================

        if ("update".equals(action)) {

            try {

                int jobId = Integer.parseInt(
                        request.getParameter("jobId"));

                int companyId = Integer.parseInt(
                        request.getParameter("companyId"));

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
                            + "/JobServlet?message=titleRequired");

                    return;
                }

                Job job = new Job();

                job.setJobId(jobId);
                job.setCompanyId(companyId);
                job.setTitle(title.trim());
                job.setDescription(description);
                job.setSalaryRange(salaryRange);
                job.setLocation(location);
                job.setLastDate(lastDate);

                boolean updated =
                        jobDAO.updateJob(job);

                if (updated) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=updated");

                } else {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=updateFailed");
                }

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/JobServlet?message=updateFailed");
            }

            return;
        }

        response.sendRedirect(
                request.getContextPath() + "/JobServlet");
    }
}