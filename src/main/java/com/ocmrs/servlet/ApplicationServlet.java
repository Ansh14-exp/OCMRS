package com.ocmrs.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.JobDAO;
import com.ocmrs.dao.StudentDao;
import com.ocmrs.model.Application;
import com.ocmrs.model.Job;
import com.ocmrs.model.Student;

@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO;
    private JobDAO jobDAO;
    private StudentDao studentDAO;

    @Override
    public void init() throws ServletException {

        applicationDAO = new ApplicationDAO();
        jobDAO = new JobDAO();
        studentDAO = new StudentDao();
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
            deleteApplication(request, response);
            break;

        case "edit":
            editApplication(request, response);
            break;

        default:
            listApplications(request, response);
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

            addApplication(request, response);

        } else if ("update".equals(action)) {

            updateApplication(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/ApplicationServlet"
            );
        }
    }


    // ADD APPLICATION
    private void addApplication(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Application application =
                new Application();

        application.setJobId(
                Integer.parseInt(
                        request.getParameter("jobId")
                )
        );

        application.setStudentId(
                Integer.parseInt(
                        request.getParameter("studentId")
                )
        );

        String applicationDate =
                request.getParameter("applicationDate");

        if (applicationDate != null
                && !applicationDate.isEmpty()) {

            application.setApplicationDate(
                    Date.valueOf(applicationDate)
            );
        }

        application.setStatus(
                request.getParameter("status")
        );

        applicationDAO.addApplication(application);

        response.sendRedirect(
                request.getContextPath()
                + "/ApplicationServlet"
        );
    }


    // LIST APPLICATIONS
    private void listApplications(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Application> applications =
                applicationDAO.getAllApplications();

        List<Job> jobs =
                jobDAO.getAllJobs();

        List<Student> students =
                studentDAO.getAllStudents();

        request.setAttribute(
                "applications",
                applications
        );

        request.setAttribute(
                "jobs",
                jobs
        );

        request.setAttribute(
                "students",
                students
        );

        request.getRequestDispatcher(
                "admin/applications.jsp"
        ).forward(request, response);
    }


    // EDIT APPLICATION
    private void editApplication(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int applicationId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        Application application =
                applicationDAO.getApplicationById(
                        applicationId
                );

        List<Job> jobs =
                jobDAO.getAllJobs();

        List<Student> students =
                studentDAO.getAllStudents();

        request.setAttribute(
                "application",
                application
        );

        request.setAttribute(
                "jobs",
                jobs
        );

        request.setAttribute(
                "students",
                students
        );

        request.getRequestDispatcher(
                "admin/editApplication.jsp"
        ).forward(request, response);
    }


    // UPDATE APPLICATION
    private void updateApplication(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Application application =
                new Application();

        application.setApplicationId(
                Integer.parseInt(
                        request.getParameter(
                                "applicationId"
                        )
                )
        );

        application.setJobId(
                Integer.parseInt(
                        request.getParameter("jobId")
                )
        );

        application.setStudentId(
                Integer.parseInt(
                        request.getParameter("studentId")
                )
        );

        String applicationDate =
                request.getParameter(
                        "applicationDate"
                );

        if (applicationDate != null
                && !applicationDate.isEmpty()) {

            application.setApplicationDate(
                    Date.valueOf(applicationDate)
            );
        }

        application.setStatus(
                request.getParameter("status")
        );

        applicationDAO.updateApplication(
                application
        );

        response.sendRedirect(
                request.getContextPath()
                + "/ApplicationServlet"
        );
    }


    // DELETE APPLICATION
    private void deleteApplication(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int applicationId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        applicationDAO.deleteApplication(
                applicationId
        );

        response.sendRedirect(
                request.getContextPath()
                + "/ApplicationServlet"
        );
    }
}