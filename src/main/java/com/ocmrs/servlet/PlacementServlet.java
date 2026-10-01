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
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Job;
import com.ocmrs.model.Placement;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;


@WebServlet("/PlacementServlet")
public class PlacementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PlacementDAO placementDAO;
    private ApplicationDAO applicationDAO;
    private StudentDAO studentDAO;
    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {

        placementDAO = new PlacementDAO();
        applicationDAO = new ApplicationDAO();
        studentDAO = new StudentDAO();
        jobDAO = new JobDAO();
    }

    // =====================================================
    // GET METHOD
    // =====================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // ================= LOGIN CHECK =================

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        // =================================================
        // STUDENT FLOW
        // =================================================

        if ("STUDENT".equalsIgnoreCase(user.getRole())) {

            Student student =
                    (Student) session.getAttribute("student");

            // Load student if not in session
            if (student == null) {

                student =
                        studentDAO.getStudentByUserId(
                                user.getUserId()
                        );

                if (student != null) {

                    session.setAttribute(
                            "student",
                            student
                    );
                }
            }

            // Student not found
            if (student == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/index.jsp"
                );

                return;
            }

            // Get student's placements
            List<Placement> placements =
                    placementDAO.getPlacementsByStudentId(
                            student.getStudentId()
                    );

            request.setAttribute(
                    "placements",
                    placements
            );

            // Existing student placement page
            request.getRequestDispatcher(
                    "/student/placement.jsp"
            ).forward(request, response);

            return;
        }

        // =================================================
        // ADMIN FLOW
        // =================================================

        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/index.jsp"
            );

            return;
        }

        String action =
                request.getParameter("action");

        // =================================================
        // DELETE
        // =================================================

        if ("delete".equalsIgnoreCase(action)) {

            String idParam =
                    request.getParameter("placementId");

            try {

                int placementId =
                        Integer.parseInt(idParam);

                placementDAO.deletePlacement(
                        placementId
                );

            } catch (Exception e) {

                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/PlacementServlet"
            );

            return;
        }

        // =================================================
        // EDIT
        // =================================================

        if ("edit".equalsIgnoreCase(action)) {

            String idParam =
                    request.getParameter("placementId");

            try {

                if (idParam == null ||
                    idParam.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/PlacementServlet"
                    );

                    return;
                }

                int placementId =
                        Integer.parseInt(idParam);

                Placement placement =
                        placementDAO.getPlacementById(
                                placementId
                        );

                if (placement == null) {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/PlacementServlet"
                    );

                    return;
                }

                List<Application> applications =
                        applicationDAO.getAllApplications();

                List<Student> students =
                        studentDAO.getAllStudents();

                List<Job> jobs =
                        jobDAO.getAllJobs();

                request.setAttribute(
                        "placement",
                        placement
                );

                request.setAttribute(
                        "applications",
                        applications
                );

                request.setAttribute(
                        "students",
                        students
                );

                request.setAttribute(
                        "jobs",
                        jobs
                );

                request.getRequestDispatcher(
                        "/admin/editPlacement.jsp"
                ).forward(request, response);

                return;

            } catch (NumberFormatException e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/PlacementServlet"
                );

                return;
            }
        }

        // =================================================
        // ADMIN PLACEMENT LIST
        // =================================================

        List<Placement> placements =
                placementDAO.getAllPlacements();

        List<Application> applications =
                applicationDAO.getAllApplications();

        List<Student> students =
                studentDAO.getAllStudents();

        List<Job> jobs =
                jobDAO.getAllJobs();

        request.setAttribute(
                "placements",
                placements
        );

        request.setAttribute(
                "applications",
                applications
        );

        request.setAttribute(
                "students",
                students
        );

        request.setAttribute(
                "jobs",
                jobs
        );

        request.getRequestDispatcher(
                "/admin/placements.jsp"
        ).forward(request, response);
    }

    // =====================================================
    // POST METHOD
    // =====================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);

        // ================= LOGIN CHECK =================

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        // ================= ADMIN ONLY =================

        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/index.jsp"
            );

            return;
        }

        String action =
                request.getParameter("action");

        String studentIdParam =
                request.getParameter("studentId");

        String applicationIdParam =
                request.getParameter("applicationId");

        String jobIdParam =
                request.getParameter("jobId");

        String placementDate =
                request.getParameter("placementDate");

        String packageAmount =
                request.getParameter("package");

        String status =
                request.getParameter("status");

        int studentId;
        int applicationId;
        int jobId;

        // ================= PARSE IDs =================

        try {

            studentId =
                    Integer.parseInt(studentIdParam);

            applicationId =
                    Integer.parseInt(applicationIdParam);

            jobId =
                    Integer.parseInt(jobIdParam);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/PlacementServlet"
            );

            return;
        }

        // ================= CREATE OBJECT =================

        Placement placement =
                new Placement();

        placement.setStudentId(studentId);

        placement.setApplicationId(applicationId);

        placement.setJobId(jobId);

        if (placementDate != null &&
            !placementDate.trim().isEmpty()) {

            placement.setPlacementDate(
                    placementDate
            );

        } else {

            placement.setPlacementDate(null);
        }

        placement.setPackageAmount(
                packageAmount
        );

        placement.setStatus(
                status
        );

        // ================= UPDATE =================

        if ("update".equalsIgnoreCase(action)) {

            String placementIdParam =
                    request.getParameter("placementId");

            try {

                int placementId =
                        Integer.parseInt(
                                placementIdParam
                        );

                placement.setPlacementId(
                        placementId
                );

                placementDAO.updatePlacement(
                        placement
                );

            } catch (Exception e) {

                e.printStackTrace();
            }

        }

        // ================= ADD =================

        else {

            placementDAO.addPlacement(
                    placement
            );
        }

        // ================= REDIRECT =================

        response.sendRedirect(
                request.getContextPath()
                + "/PlacementServlet"
        );
    }
}