package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.EnrollmentDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Enrollment;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;


@WebServlet("/EnrollmentServlet")
public class EnrollmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EnrollmentDAO enrollmentDAO;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        enrollmentDAO = new EnrollmentDAO();
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session check
        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null ||
            !"STUDENT".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Student object from session
        Student student = (Student) session.getAttribute("student");

        // If student is not available in session,
        // load it using logged-in user's userId
        if (student == null) {

            student = studentDAO.getStudentByUserId(user.getUserId());

            if (student == null) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?error=StudentNotFound"
                );
                return;
            }

            session.setAttribute("student", student);
        }

        int studentId = student.getStudentId();

        // Get enrollment records
        List<Enrollment> enrollments =
                enrollmentDAO.getEnrollmentsByStudentId(studentId);

        // Send data to JSP
        request.setAttribute("enrollments", enrollments);
        request.setAttribute("student", student);

        // Open enrollment page
        request.getRequestDispatcher(
                "/student/enrollment.jsp"
        ).forward(request, response);
    }
}