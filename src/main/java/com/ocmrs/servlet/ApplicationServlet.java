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
import com.ocmrs.dao.JobDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Job;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;

@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO;
    private JobDAO jobDAO;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
        jobDAO = new JobDAO();
        studentDAO = new StudentDAO();
    }

    // =====================================================
    // GET METHOD
    // =====================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null || user.getRole() == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        String role = user.getRole();

        // =================================================
        // ADMIN
        // =================================================

        if ("ADMIN".equalsIgnoreCase(role)) {

            String action = request.getParameter("action");

            // DELETE
            if ("delete".equals(action)) {

                try {

                    int applicationId =
                            Integer.parseInt(
                                    request.getParameter("applicationId"));

                    boolean deleted =
                            applicationDAO.deleteApplication(
                                    applicationId);

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message="
                            + (deleted
                               ? "deleted"
                               : "deleteFailed"));

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=invalidId");
                }

                return;
            }

            // EDIT
            if ("edit".equals(action)) {

                try {

                    int applicationId =
                            Integer.parseInt(
                                    request.getParameter("applicationId"));

                    Application application =
                            applicationDAO.getApplicationById(
                                    applicationId);

                    if (application == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/ApplicationServlet?message=notFound");

                        return;
                    }

                    request.setAttribute(
                            "application",
                            application);

                    request.setAttribute(
                            "jobs",
                            jobDAO.getAllJobs());

                    request.setAttribute(
                            "students",
                            studentDAO.getAllStudents());

                    request.getRequestDispatcher(
                            "/admin/editApplication.jsp")
                            .forward(request, response);

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=invalidId");
                }

                return;
            }

            // SHOW ALL APPLICATIONS
            request.setAttribute(
                    "applications",
                    applicationDAO.getAllApplications());

            request.setAttribute(
                    "jobs",
                    jobDAO.getAllJobs());

            request.setAttribute(
                    "students",
                    studentDAO.getAllStudents());

            request.getRequestDispatcher(
                    "/admin/applications.jsp")
                    .forward(request, response);

            return;
        }

        // =================================================
        // STUDENT
        // =================================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                student =
                        studentDAO.getStudentByUserId(
                                user.getUserId());

                if (student != null) {

                    session.setAttribute(
                            "student",
                            student);
                }
            }

            if (student == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/StudentServlet");

                return;
            }

            // =================================================
            // JOB ID PRESENT
            // Open selected job for application
            // =================================================

            String jobIdParameter =
                    request.getParameter("jobId");

            if (jobIdParameter != null &&
                !jobIdParameter.trim().isEmpty()) {

                try {

                    int jobId =
                            Integer.parseInt(jobIdParameter);

                    Job job =
                            jobDAO.getJobById(jobId);

                    if (job == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/JobServlet?message=jobNotFound");

                        return;
                    }

                    // Selected job
                    request.setAttribute(
                            "job",
                            job);

                    // Student
                    request.setAttribute(
                            "student",
                            student);

                    // IMPORTANT:
                    // Send all jobs also
                    request.setAttribute(
                            "jobs",
                            jobDAO.getAllJobs());

                    request.getRequestDispatcher(
                            "/student/apply-job.jsp")
                            .forward(request, response);

                } catch (NumberFormatException e) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=invalidId");

                }

                return;
            }

            // =================================================
            // ACTION = APPLY
            // Open Apply Job page with all jobs
            // =================================================

            String action =
                    request.getParameter("action");

            if ("apply".equalsIgnoreCase(action)) {

                request.setAttribute(
                        "jobs",
                        jobDAO.getAllJobs());

                request.setAttribute(
                        "student",
                        student);

                request.getRequestDispatcher(
                        "/student/apply-job.jsp")
                        .forward(request, response);

                return;
            }

            // =================================================
            // APPLICATION HISTORY
            // =================================================

            List<Application> applications =
                    applicationDAO.getApplicationsByStudentId(
                            student.getStudentId());

            request.setAttribute(
                    "applications",
                    applications);

            request.setAttribute(
                    "student",
                    student);

            request.getRequestDispatcher(
                    "/student/application.jsp")
                    .forward(request, response);

            return;
        }

        // =================================================
        // INVALID ROLE
        // =================================================

        response.sendRedirect(
                request.getContextPath() + "/login.jsp");
    }

    // =====================================================
    // POST METHOD
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            user.getRole() == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        String role = user.getRole();

        // =================================================
        // STUDENT APPLY
        // =================================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                student =
                        studentDAO.getStudentByUserId(
                                user.getUserId());

                if (student != null) {

                    session.setAttribute(
                            "student",
                            student);
                }
            }

            if (student == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/StudentServlet");

                return;
            }

            try {

                String jobIdParameter =
                        request.getParameter("jobId");

                if (jobIdParameter == null ||
                    jobIdParameter.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=invalidId");

                    return;
                }

                int jobId =
                        Integer.parseInt(jobIdParameter);

                Job job =
                        jobDAO.getJobById(jobId);

                if (job == null) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/JobServlet?message=jobNotFound");

                    return;
                }

                Application application =
                        new Application();

                application.setJobId(jobId);

                application.setStudentId(
                        student.getStudentId());

                String currentDate =
                        new java.sql.Date(
                                System.currentTimeMillis())
                                .toString();

                application.setApplicationDate(
                        currentDate);

                application.setStatus(
                        "Applied");

                boolean added =
                        applicationDAO.addApplication(
                                application);

                if (added) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=applied");

                } else {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=applyFailed");
                }

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/ApplicationServlet?message=applyFailed");
            }

            return;
        }

        // =================================================
        // ADMIN
        // =================================================

        if ("ADMIN".equalsIgnoreCase(role)) {

            String action =
                    request.getParameter("action");

            // =================================================
            // ADD
            // =================================================

            if ("add".equals(action)) {

                try {

                    int jobId =
                            Integer.parseInt(
                                    request.getParameter("jobId"));

                    int studentId =
                            Integer.parseInt(
                                    request.getParameter("studentId"));

                    String applicationDate =
                            request.getParameter(
                                    "applicationDate");

                    String status =
                            request.getParameter("status");

                    Application application =
                            new Application();

                    application.setJobId(jobId);

                    application.setStudentId(
                            studentId);

                    application.setApplicationDate(
                            applicationDate);

                    application.setStatus(
                            status);

                    boolean added =
                            applicationDAO.addApplication(
                                    application);

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message="
                            + (added
                               ? "added"
                               : "addFailed"));

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=addFailed");
                }

                return;
            }

            // =================================================
            // UPDATE
            // =================================================

            if ("update".equals(action)) {

                try {

                    int applicationId =
                            Integer.parseInt(
                                    request.getParameter(
                                            "applicationId"));

                    int jobId =
                            Integer.parseInt(
                                    request.getParameter(
                                            "jobId"));

                    int studentId =
                            Integer.parseInt(
                                    request.getParameter(
                                            "studentId"));

                    String applicationDate =
                            request.getParameter(
                                    "applicationDate");

                    String status =
                            request.getParameter(
                                    "status");

                    Application application =
                            new Application();

                    application.setApplicationId(
                            applicationId);

                    application.setJobId(
                            jobId);

                    application.setStudentId(
                            studentId);

                    application.setApplicationDate(
                            applicationDate);

                    application.setStatus(
                            status);

                    boolean updated =
                            applicationDAO.updateApplication(
                                    application);

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message="
                            + (updated
                               ? "updated"
                               : "updateFailed"));

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ApplicationServlet?message=updateFailed");
                }

                return;
            }
        }

        response.sendRedirect(
                request.getContextPath()
                + "/ApplicationServlet");
    }
}
