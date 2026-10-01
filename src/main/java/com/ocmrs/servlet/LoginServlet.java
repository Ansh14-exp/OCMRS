package com.ocmrs.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.StudentDAO;
import com.ocmrs.dao.UserDAO;
import com.ocmrs.dao.FacultyDAO;
import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.Company;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        String selectedRole =
                request.getParameter("role");


        // =========================
        // CHECK ROLE
        // =========================

        if (selectedRole == null ||
            selectedRole.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp?error=InvalidRole"
            );

            return;
        }


        // =========================
        // LOGIN DATABASE CHECK
        // =========================

        UserDAO userDAO =
                new UserDAO();

        User user =
                userDAO.login(
                    username,
                    password
                );


        // =========================
        // INVALID LOGIN
        // =========================

        if (user == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp?error=InvalidLogin"
            );

            return;
        }


        // =========================
        // CHECK SELECTED ROLE
        // =========================

        String databaseRole =
                user.getRole();

        if (!selectedRole.equalsIgnoreCase(databaseRole)) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp?error=InvalidRole"
            );

            return;
        }


        // =========================
        // CREATE SESSION
        // =========================

        HttpSession session =
                request.getSession();

        session.setAttribute(
            "user",
            user
        );


        // =========================
        // STUDENT
        // =========================

        if ("STUDENT".equalsIgnoreCase(databaseRole)) {

            StudentDAO studentDAO =
                    new StudentDAO();

            Student student =
                    studentDAO.getStudentByUserId(
                        user.getUserId()
                    );

            if (student != null) {

                session.setAttribute(
                    "student",
                    student
                );

                response.sendRedirect(
                    request.getContextPath()
                    + "/student/dashboard.jsp"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?error=StudentNotFound"
                );
            }

            return;
        }


        // =========================
        // ADMIN
        // =========================

        if ("ADMIN".equalsIgnoreCase(databaseRole)) {

            response.sendRedirect(
                request.getContextPath()
                + "/AdminServlet"
            );

            return;
        }


     // =========================
     // FACULTY
     // =========================

     if ("FACULTY".equalsIgnoreCase(databaseRole)) {

         FacultyDAO facultyDAO =
                 new FacultyDAO();

         Faculty faculty =
                 facultyDAO.getFacultyByUserId(
                     user.getUserId()
                 );

         if (faculty != null) {

             session.setAttribute(
                 "faculty",
                 faculty
             );

             response.sendRedirect(
                 request.getContextPath()
                 + "/faculty/dashboard.jsp"
             );

         } else {

             response.sendRedirect(
                 request.getContextPath()
                 + "/login.jsp?error=FacultyNotFound"
             );
         }

         return;
     }

        // =========================
        // COMPANY
        // =========================

     if ("COMPANY".equalsIgnoreCase(databaseRole)) {

    	    CompanyDAO companyDAO = new CompanyDAO();

    	    Company company =
    	            companyDAO.getCompanyByUserId(user.getUserId());

    	    if (company != null) {

    	        session.setAttribute("company", company);

    	        response.sendRedirect(
    	                request.getContextPath()
    	                + "/company/dashboard.jsp"
    	        );

    	    } else {

    	        response.sendRedirect(
    	                request.getContextPath()
    	                + "/login.jsp?error=CompanyNotFound"
    	        );
    	    }

    	    return;
    	}

        // =========================
        // INVALID DATABASE ROLE
        // =========================

        response.sendRedirect(
            request.getContextPath()
            + "/login.jsp?error=InvalidRole"
        );
    }
}