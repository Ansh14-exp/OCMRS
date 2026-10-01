package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.AttendanceDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.dao.SubjectDAO;
import com.ocmrs.model.Attendance;
import com.ocmrs.model.Faculty;
import com.ocmrs.model.Student;
import com.ocmrs.model.Subject;
import com.ocmrs.model.User;

@WebServlet("/FacultyAttendanceServlet")
public class FacultyAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AttendanceDAO attendanceDAO;
    private StudentDAO studentDAO;
    private SubjectDAO subjectDAO;

    @Override
    public void init() throws ServletException {

        attendanceDAO = new AttendanceDAO();
        studentDAO = new StudentDAO();
        subjectDAO = new SubjectDAO();
    }

    // =====================================================
    // GET - SHOW ATTENDANCE PAGE
    // =====================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            !"FACULTY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyProfileServlet"
            );

            return;
        }

        // -------------------------------------------------
        // GET ATTENDANCE RECORDS
        // -------------------------------------------------

        List<Attendance> attendanceList =
                attendanceDAO.getAttendanceByFacultyId(
                        faculty.getFacultyId()
                );

        // -------------------------------------------------
        // GET FACULTY SUBJECTS
        // -------------------------------------------------

        List<Subject> subjectList =
                subjectDAO.getSubjectsByFacultyId(
                        faculty.getFacultyId()
                );

        // -------------------------------------------------
        // GET DEPARTMENT STUDENTS
        // -------------------------------------------------

        List<Student> studentList =
                studentDAO.getStudentsByDepartmentId(
                        faculty.getDepartmentId()
                );

        // -------------------------------------------------
        // SEND DATA TO JSP
        // -------------------------------------------------

        request.setAttribute(
                "attendanceList",
                attendanceList
        );

        request.setAttribute(
                "subjectList",
                subjectList
        );

        request.setAttribute(
                "studentList",
                studentList
        );

        request.setAttribute(
                "faculty",
                faculty
        );

        request.getRequestDispatcher(
                "/faculty/attendance.jsp"
        ).forward(request, response);
    }

    // =====================================================
    // POST - MARK ATTENDANCE
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        if (user == null ||
            !"FACULTY".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyProfileServlet"
            );

            return;
        }

        // -------------------------------------------------
        // GET FORM VALUES
        // -------------------------------------------------

        String studentIdParam =
                request.getParameter("studentId");

        String subjectIdParam =
                request.getParameter("subjectId");

        String attendanceDate =
                request.getParameter("attendanceDate");

        String status =
                request.getParameter("status");

        // -------------------------------------------------
        // VALIDATION
        // -------------------------------------------------

        if (studentIdParam == null ||
            subjectIdParam == null ||
            attendanceDate == null ||
            status == null ||
            studentIdParam.isEmpty() ||
            subjectIdParam.isEmpty() ||
            attendanceDate.isEmpty() ||
            status.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyAttendanceServlet?error=missing"
            );

            return;
        }

        try {

            int studentId =
                    Integer.parseInt(studentIdParam);

            int subjectId =
                    Integer.parseInt(subjectIdParam);

            // -------------------------------------------------
            // CREATE ATTENDANCE OBJECT
            // -------------------------------------------------

            Attendance attendance =
                    new Attendance();

            attendance.setStudentId(studentId);

            attendance.setSubjectId(subjectId);

            attendance.setAttendanceDate(
                    attendanceDate
            );

            attendance.setStatus(status);

            // -------------------------------------------------
            // INSERT INTO DATABASE
            // -------------------------------------------------

            boolean success =
                    attendanceDAO.addAttendance(
                            attendance
                    );

            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/FacultyAttendanceServlet?success=added"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/FacultyAttendanceServlet?error=failed"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/FacultyAttendanceServlet?error=invalid"
            );
        }
    }
}