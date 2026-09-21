package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.CollegeDAO;
import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.dao.InterviewDAO;
import com.ocmrs.dao.JobDAO;
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.dao.StudentDao;
import com.ocmrs.model.Application;
import com.ocmrs.model.College;
import com.ocmrs.model.Company;
import com.ocmrs.model.Interview;
import com.ocmrs.model.Job;
import com.ocmrs.model.Placement;
import com.ocmrs.model.Student;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDao studentDAO;
    private CollegeDAO collegeDAO;
    private CompanyDAO companyDAO;
    private JobDAO jobDAO;
    private ApplicationDAO applicationDAO;
    private InterviewDAO interviewDAO;
    private PlacementDAO placementDAO;

    @Override
    public void init() throws ServletException {

        studentDAO = new StudentDao();
        collegeDAO = new CollegeDAO();
        companyDAO = new CompanyDAO();
        jobDAO = new JobDAO();
        applicationDAO = new ApplicationDAO();
        interviewDAO = new InterviewDAO();
        placementDAO = new PlacementDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students =
                studentDAO.getAllStudents();

        List<College> colleges =
                collegeDAO.getAllColleges();

        List<Company> companies =
                companyDAO.getAllCompanies();

        List<Job> jobs =
                jobDAO.getAllJobs();

        List<Application> applications =
                applicationDAO.getAllApplications();

        List<Interview> interviews =
                interviewDAO.getAllInterviews();

        List<Placement> placements =
                placementDAO.getAllPlacements();


        request.setAttribute(
                "students",
                students
        );

        request.setAttribute(
                "colleges",
                colleges
        );

        request.setAttribute(
                "companies",
                companies
        );

        request.setAttribute(
                "jobs",
                jobs
        );

        request.setAttribute(
                "applications",
                applications
        );

        request.setAttribute(
                "interviews",
                interviews
        );

        request.setAttribute(
                "placements",
                placements
        );


        request.getRequestDispatcher(
                "admin/reports.jsp"
        ).forward(request, response);
    }
}