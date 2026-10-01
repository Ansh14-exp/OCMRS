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
import com.ocmrs.model.College;
import com.ocmrs.model.User;

@WebServlet("/CollegeServlet")
public class CollegeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CollegeDAO collegeDAO;

    @Override
    public void init() throws ServletException {
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
        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // Get logged-in user
        User user =
                (User) session.getAttribute("user");

        // Only ADMIN allowed
        if (user == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        String action =
                request.getParameter("action");


        // =========================
        // DELETE COLLEGE
        // =========================
        if ("delete".equals(action)) {

            String id =
                    request.getParameter("collegeId");

            if (id != null &&
                !id.trim().isEmpty()) {

                int collegeId =
                        Integer.parseInt(id);

                collegeDAO.deleteCollege(
                    collegeId
                );
            }

            response.sendRedirect(
                request.getContextPath()
                + "/CollegeServlet"
            );

            return;
        }


        // =========================
        // EDIT COLLEGE
        // =========================
        if ("edit".equals(action)) {

            String id =
                    request.getParameter("collegeId");

            if (id == null ||
                id.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/CollegeServlet"
                );

                return;
            }

            int collegeId =
                    Integer.parseInt(id);

            College college =
                    collegeDAO.getCollegeById(
                        collegeId
                    );

            request.setAttribute(
                "college",
                college
            );

            request.getRequestDispatcher(
                "/admin/editCollege.jsp"
            ).forward(
                request,
                response
            );

            return;
        }


        // =========================
        // VIEW ALL COLLEGES
        // =========================

        List<College> colleges =
                collegeDAO.getAllColleges();

        request.setAttribute(
            "colleges",
            colleges
        );

        request.getRequestDispatcher(
            "/admin/colleges.jsp"
        ).forward(
            request,
            response
        );
    }


    // =========================
    // POST METHOD
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }

        // Check ADMIN
        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
            );

            return;
        }


        String action =
                request.getParameter("action");

        String collegeName =
                request.getParameter("collegeName");

        String address =
                request.getParameter("address");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");


        // =========================
        // BASIC VALIDATION
        // =========================

        if (collegeName == null ||
            collegeName.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/CollegeServlet"
            );

            return;
        }


        // Create College object
        College college =
                new College();

        college.setCollegeName(
            collegeName
        );

        college.setAddress(
            address
        );

        college.setEmail(
            email
        );

        college.setPhone(
            phone
        );


        // =========================
        // UPDATE COLLEGE
        // =========================

        if ("update".equals(action)) {

            String id =
                    request.getParameter("collegeId");

            if (id != null &&
                !id.trim().isEmpty()) {

                int collegeId =
                        Integer.parseInt(id);

                college.setCollegeId(
                    collegeId
                );

                collegeDAO.updateCollege(
                    college
                );
            }

        } else {

            // =========================
            // ADD COLLEGE
            // =========================

            collegeDAO.addCollege(
                college
            );
        }


        // Redirect
        response.sendRedirect(
            request.getContextPath()
            + "/CollegeServlet"
        );
    }
}
