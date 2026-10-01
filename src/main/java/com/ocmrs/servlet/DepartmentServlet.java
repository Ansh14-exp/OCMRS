package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.CollegeDAO;
import com.ocmrs.dao.DepartmentDAO;
import com.ocmrs.model.College;
import com.ocmrs.model.Department;
import com.ocmrs.model.User;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private DepartmentDAO departmentDAO;
    private CollegeDAO collegeDAO;

    @Override
    public void init() throws ServletException {
        departmentDAO = new DepartmentDAO();
        collegeDAO = new CollegeDAO();
    }

    // =========================
    // GET METHOD
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Only ADMIN can access
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        String action = request.getParameter("action");

        // =========================
        // DELETE DEPARTMENT
        // =========================
        if ("delete".equals(action)) {

            String id = request.getParameter("departmentId");

            if (id != null && !id.trim().isEmpty()) {

                int departmentId = Integer.parseInt(id);

                departmentDAO.deleteDepartment(departmentId);
            }

            response.sendRedirect(
                request.getContextPath() + "/DepartmentServlet"
            );

            return;
        }

        // =========================
        // EDIT DEPARTMENT
        // =========================
        if ("edit".equals(action)) {

            String id = request.getParameter("departmentId");

            if (id == null || id.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath() + "/DepartmentServlet"
                );

                return;
            }

            int departmentId = Integer.parseInt(id);

            Department department =
                    departmentDAO.getDepartmentById(departmentId);

            List<College> colleges =
                    collegeDAO.getAllColleges();

            request.setAttribute(
                "department",
                department
            );

            request.setAttribute(
                "colleges",
                colleges
            );

            request.getRequestDispatcher(
                "/admin/editDepartment.jsp"
            ).forward(request, response);

            return;
        }

        // =========================
        // VIEW ALL DEPARTMENTS
        // =========================

        List<Department> departments =
                departmentDAO.getAllDepartments();

        List<College> colleges =
                collegeDAO.getAllColleges();

        request.setAttribute(
            "departments",
            departments
        );

        request.setAttribute(
            "colleges",
            colleges
        );

        request.getRequestDispatcher(
            "/admin/departments.jsp"
        ).forward(request, response);
    }

    // =========================
    // POST METHOD
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );

            return;
        }

        String action =
                request.getParameter("action");

        String collegeId =
                request.getParameter("collegeId");

        String departmentName =
                request.getParameter("departmentName");

        String hodName =
                request.getParameter("hodName");

        // Basic validation
        if (collegeId == null ||
            collegeId.trim().isEmpty() ||
            departmentName == null ||
            departmentName.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() +
                "/DepartmentServlet"
            );

            return;
        }

        // Create Department object
        Department department =
                new Department();

        department.setCollegeId(
            Integer.parseInt(collegeId)
        );

        department.setDepartmentName(
            departmentName
        );

        department.setHodName(
            hodName
        );

        // =========================
        // UPDATE DEPARTMENT
        // =========================
        if ("update".equals(action)) {

            String id =
                    request.getParameter("departmentId");

            if (id != null &&
                !id.trim().isEmpty()) {

                int departmentId =
                        Integer.parseInt(id);

                department.setDepartmentId(
                    departmentId
                );

                departmentDAO.updateDepartment(
                    department
                );
            }

        } else {

            // =========================
            // ADD DEPARTMENT
            // =========================

            departmentDAO.addDepartment(
                department
            );
        }

        // Redirect back to Department page
        response.sendRedirect(
            request.getContextPath() +
            "/DepartmentServlet"
        );
    }
}