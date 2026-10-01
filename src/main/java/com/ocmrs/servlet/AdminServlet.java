package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.AdminDashboardDAO;
import com.ocmrs.model.User;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDashboardDAO adminDashboardDAO;

    @Override
    public void init() throws ServletException {
        adminDashboardDAO = new AdminDashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Check ADMIN role
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Get dashboard statistics
        int totalStudents = adminDashboardDAO.getTotalStudents();
        int totalFaculty = adminDashboardDAO.getTotalFaculty();
        int totalCourses = adminDashboardDAO.getTotalCourses();
        int totalCompanies = adminDashboardDAO.getTotalCompanies();
        int totalJobs = adminDashboardDAO.getTotalJobs();
        int totalApplications = adminDashboardDAO.getTotalApplications();

        // Send data to JSP
        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("totalFaculty", totalFaculty);
        request.setAttribute("totalCourses", totalCourses);
        request.setAttribute("totalCompanies", totalCompanies);
        request.setAttribute("totalJobs", totalJobs);
        request.setAttribute("totalApplications", totalApplications);

        // Open Admin Dashboard
        request.getRequestDispatcher("/admin/dashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}