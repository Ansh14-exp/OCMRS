package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Company;
import com.ocmrs.model.Placement;
import com.ocmrs.model.User;


@WebServlet("/CompanyPlacementSaveServlet")
public class CompanyPlacementSaveServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ApplicationDAO applicationDAO;
    private PlacementDAO placementDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
        placementDAO = new PlacementDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check session
        if (session == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        // Check logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"COMPANY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        // Get company from session
        Company company =
                (Company) session.getAttribute("company");

        if (company == null) {
            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyProfileServlet");
            return;
        }

        try {

            // Get form values
            int applicationId =
                    Integer.parseInt(
                            request.getParameter("applicationId"));

            int studentId =
                    Integer.parseInt(
                            request.getParameter("studentId"));

            int jobId =
                    Integer.parseInt(
                            request.getParameter("jobId"));

            String placementDate =
                    request.getParameter("placementDate");

            String packageAmount =
                    request.getParameter("packageAmount");

            String status =
                    request.getParameter("status");


            // Get application
            Application application =
                    applicationDAO.getApplicationById(
                            applicationId);

            if (application == null) {
                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyApplicantsServlet");
                return;
            }


            // Security check:
            // Application must belong to this company
            boolean belongsToCompany =
                    applicationDAO.applicationBelongsToCompany(
                            applicationId,
                            company.getCompanyId());

            if (!belongsToCompany) {
                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyApplicantsServlet");
                return;
            }


            // Only Selected applicant can become placement
            if (application.getStatus() == null ||
                !"Selected".equalsIgnoreCase(
                        application.getStatus())) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyApplicantsServlet");
                return;
            }


            // Create Placement object
            Placement placement = new Placement();

            placement.setStudentId(studentId);
            placement.setApplicationId(applicationId);
            placement.setJobId(jobId);
            placement.setPlacementDate(placementDate);
            placement.setPackageAmount(packageAmount);
            placement.setStatus(status);


            // Save placement
            boolean success =
                    placementDAO.addPlacement(placement);


            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyPlacementServlet?success=created");

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/CompanyPlacementServlet?error=failed");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/CompanyPlacementServlet?error=failed");
        }
    }
}