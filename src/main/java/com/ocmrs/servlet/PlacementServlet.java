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
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.dao.StudentDao;
import com.ocmrs.model.Application;
import com.ocmrs.model.Job;
import com.ocmrs.model.Placement;
import com.ocmrs.model.Student;

@WebServlet("/PlacementServlet")
public class PlacementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PlacementDAO placementDAO;
    private StudentDao studentDAO;
    private ApplicationDAO applicationDAO;
    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        placementDAO = new PlacementDAO();
        studentDAO = new StudentDao();
        applicationDAO = new ApplicationDAO();
        jobDAO = new JobDAO();
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
            deletePlacement(request, response);
            break;

        case "edit":
            editPlacement(request, response);
            break;

        default:
            listPlacements(request, response);
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

            addPlacement(request, response);

        } else if ("update".equals(action)) {

            updatePlacement(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/PlacementServlet"
            );
        }
    }

    // ADD PLACEMENT
    private void addPlacement(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Placement placement = new Placement();

        placement.setStudentId(
                Integer.parseInt(
                        request.getParameter("studentId")
                )
        );

        placement.setApplicationId(
                Integer.parseInt(
                        request.getParameter("applicationId")
                )
        );

        placement.setJobId(
                Integer.parseInt(
                        request.getParameter("jobId")
                )
        );

        String placementDate =
                request.getParameter("placementDate");

        if (placementDate != null
                && !placementDate.isEmpty()) {

            placement.setPlacementDate(
                    Date.valueOf(placementDate)
            );
        }

        placement.setPackageAmount(
                request.getParameter("packageAmount")
        );

        placement.setStatus(
                request.getParameter("status")
        );

        placementDAO.addPlacement(placement);

        response.sendRedirect(
                request.getContextPath()
                + "/PlacementServlet"
        );
    }


    // LIST PLACEMENTS
    private void listPlacements(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Placement> placements =
                placementDAO.getAllPlacements();

        List<Student> students =
                studentDAO.getAllStudents();

        List<Application> applications =
                applicationDAO.getAllApplications();

        List<Job> jobs =
                jobDAO.getAllJobs();

        request.setAttribute("placements", placements);
        request.setAttribute("students", students);
        request.setAttribute("applications", applications);
        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher(
                "admin/placements.jsp"
        ).forward(request, response);
    }


    // EDIT PLACEMENT
    private void editPlacement(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int placementId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        Placement placement =
                placementDAO.getPlacementById(
                        placementId
                );

        List<Student> students =
                studentDAO.getAllStudents();

        List<Application> applications =
                applicationDAO.getAllApplications();

        List<Job> jobs =
                jobDAO.getAllJobs();

        request.setAttribute(
                "placement",
                placement
        );

        request.setAttribute(
                "students",
                students
        );

        request.setAttribute(
                "applications",
                applications
        );

        request.setAttribute(
                "jobs",
                jobs
        );

        request.getRequestDispatcher(
                "admin/editPlacement.jsp"
        ).forward(request, response);
    }


    // UPDATE PLACEMENT
    private void updatePlacement(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Placement placement =
                new Placement();

        placement.setPlacementId(
                Integer.parseInt(
                        request.getParameter(
                                "placementId"
                        )
                )
        );

        placement.setStudentId(
                Integer.parseInt(
                        request.getParameter(
                                "studentId"
                        )
                )
        );

        placement.setApplicationId(
                Integer.parseInt(
                        request.getParameter(
                                "applicationId"
                        )
                )
        );

        placement.setJobId(
                Integer.parseInt(
                        request.getParameter(
                                "jobId"
                        )
                )
        );

        String placementDate =
                request.getParameter(
                        "placementDate"
                );

        if (placementDate != null
                && !placementDate.isEmpty()) {

            placement.setPlacementDate(
                    Date.valueOf(placementDate)
            );
        }

        placement.setPackageAmount(
                request.getParameter(
                        "packageAmount"
                )
        );

        placement.setStatus(
                request.getParameter(
                        "status"
                )
        );

        placementDAO.updatePlacement(
                placement
        );

        response.sendRedirect(
                request.getContextPath()
                + "/PlacementServlet"
        );
    }


    // DELETE PLACEMENT
    private void deletePlacement(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int placementId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        placementDAO.deletePlacement(
                placementId
        );

        response.sendRedirect(
                request.getContextPath()
                + "/PlacementServlet"
        );
    }
}