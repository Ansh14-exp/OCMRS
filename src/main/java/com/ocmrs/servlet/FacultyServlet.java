package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.DepartmentDAO;
import com.ocmrs.dao.FacultyDAO;
import com.ocmrs.model.Department;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.User;

@WebServlet("/FacultyServlet")
public class FacultyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FacultyDAO facultyDAO;
    private DepartmentDAO departmentDAO;

    @Override
    public void init() throws ServletException {
        facultyDAO = new FacultyDAO();
        departmentDAO = new DepartmentDAO();
    }

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Check ADMIN role
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");


        // =========================
        // DELETE
        // =========================
        if ("delete".equals(action)) {

            String id = request.getParameter("facultyId");

            if (id != null && !id.trim().isEmpty()) {

                int facultyId = Integer.parseInt(id);

                facultyDAO.deleteFaculty(facultyId);
            }

            response.sendRedirect(
                request.getContextPath() + "/FacultyServlet"
            );

            return;
        }


        // =========================
        // EDIT
        // =========================
        if ("edit".equals(action)) {

            String id = request.getParameter("facultyId");

            if (id == null || id.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath() + "/FacultyServlet"
                );

                return;
            }

            int facultyId = Integer.parseInt(id);

            Faculty faculty =
                facultyDAO.getFacultyById(facultyId);

            List<Department> departments =
                departmentDAO.getAllDepartments();

            request.setAttribute("faculty", faculty);
            request.setAttribute("departments", departments);

            request.getRequestDispatcher(
                "/admin/editFaculty.jsp"
            ).forward(request, response);

            return;
        }


        // =========================
        // VIEW ALL FACULTY
        // =========================

        List<Faculty> facultyList =
            facultyDAO.getAllFaculty();

        List<Department> departments =
            departmentDAO.getAllDepartments();

        request.setAttribute("facultyList", facultyList);
        request.setAttribute("departments", departments);

        request.getRequestDispatcher(
            "/admin/faculty.jsp"
        ).forward(request, response);
    }


    // =========================
    // POST
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

        // Check ADMIN role
        if (user == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );

            return;
        }


        String action =
            request.getParameter("action");

        String departmentId =
            request.getParameter("departmentId");

        String name =
            request.getParameter("name");

        String email =
            request.getParameter("email");

        String phone =
            request.getParameter("phone");

        String designation =
            request.getParameter("designation");


        // Basic validation
        if (departmentId == null ||
            departmentId.trim().isEmpty() ||
            name == null ||
            name.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/FacultyServlet"
            );

            return;
        }


        Faculty faculty = new Faculty();

        faculty.setDepartmentId(
            Integer.parseInt(departmentId)
        );

        faculty.setName(name);
        faculty.setEmail(email);
        faculty.setPhone(phone);
        faculty.setDesignation(designation);


        // =========================
        // UPDATE
        // =========================

        if ("update".equals(action)) {

            String id =
                request.getParameter("facultyId");

            if (id != null &&
                !id.trim().isEmpty()) {

                int facultyId =
                    Integer.parseInt(id);

                faculty.setFacultyId(facultyId);

                facultyDAO.updateFaculty(faculty);
            }

        } else {

            // =========================
            // ADD
            // =========================

            facultyDAO.addFaculty(faculty);
        }


        response.sendRedirect(
            request.getContextPath() + "/FacultyServlet"
        );
    }
}

