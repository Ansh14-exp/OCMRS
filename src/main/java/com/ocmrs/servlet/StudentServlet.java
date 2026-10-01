package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Login check
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        String role = user.getRole();

        // ==================================================
        // ADMIN SECTION
        // ==================================================
        if ("ADMIN".equalsIgnoreCase(role)) {

            String action = request.getParameter("action");

            // -------------------------
            // DELETE STUDENT
            // -------------------------
            if ("delete".equalsIgnoreCase(action)) {

                String studentIdParam =
                        request.getParameter("studentId");

                if (studentIdParam != null &&
                    !studentIdParam.trim().isEmpty()) {

                    try {

                        int studentId =
                                Integer.parseInt(studentIdParam);

                        studentDAO.deleteStudent(studentId);

                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }

                response.sendRedirect(
                        request.getContextPath() + "/StudentServlet"
                );
                return;
            }

            // -------------------------
            // EDIT STUDENT
            // -------------------------
            if ("edit".equalsIgnoreCase(action)) {

                String studentIdParam =
                        request.getParameter("studentId");

                if (studentIdParam == null ||
                    studentIdParam.trim().isEmpty()) {

                    response.sendRedirect(
                            request.getContextPath() + "/StudentServlet"
                    );
                    return;
                }

                try {

                    int studentId =
                            Integer.parseInt(studentIdParam);

                    Student student =
                            studentDAO.getStudentById(studentId);

                    if (student == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/StudentServlet"
                        );
                        return;
                    }

                    request.setAttribute(
                            "student",
                            student
                    );

                    request.getRequestDispatcher(
                            "/admin/editStudent.jsp"
                    ).forward(request, response);

                } catch (NumberFormatException e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/StudentServlet"
                    );
                }

                return;
            }

            // -------------------------
            // DEFAULT ADMIN PAGE
            // -------------------------

            List<Student> students =
                    studentDAO.getAllStudents();

            request.setAttribute(
                    "students",
                    students
            );

            request.getRequestDispatcher(
                    "/admin/students.jsp"
            ).forward(request, response);

            return;
        }

        // ==================================================
        // STUDENT SECTION
        // ==================================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            int userId = user.getUserId();

            Student student =
                    studentDAO.getStudentByUserId(userId);

            if (student != null) {

                request.setAttribute(
                        "student",
                        student
                );

                request.getRequestDispatcher(
                        "/student/profile.jsp"
                ).forward(request, response);

            } else {

                request.setAttribute(
                        "error",
                        "Student record not found for User ID: "
                        + userId
                );

                request.getRequestDispatcher(
                        "/student/profile.jsp"
                ).forward(request, response);
            }

            return;
        }

        // ==================================================
        // OTHER ROLES
        // ==================================================

        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );
    }

    // =========================
    // POST
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Login check
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        // Only ADMIN can add/update students
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        String action = request.getParameter("action");

        // ==================================================
        // UPDATE STUDENT
        // ==================================================

        if ("update".equalsIgnoreCase(action)) {

            try {

                Student student = new Student();

                student.setStudentId(
                        Integer.parseInt(
                                request.getParameter("studentId")
                        )
                );

                student.setUserId(
                        Integer.parseInt(
                                request.getParameter("userId")
                        )
                );

                student.setCollegeId(
                        Integer.parseInt(
                                request.getParameter("collegeId")
                        )
                );

                student.setCourseId(
                        Integer.parseInt(
                                request.getParameter("courseId")
                        )
                );

                student.setName(
                        request.getParameter("name")
                );

                student.setEmail(
                        request.getParameter("email")
                );

                student.setPhone(
                        request.getParameter("phone")
                );

                student.setAddress(
                        request.getParameter("address")
                );

                student.setDob(
                        request.getParameter("dob")
                );

                student.setGender(
                        request.getParameter("gender")
                );

                studentDAO.updateStudent(student);

            } catch (Exception e) {

                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath() + "/StudentServlet"
            );

            return;
        }

        // ==================================================
        // ADD STUDENT
        // ==================================================

        try {

            Student student = new Student();

            student.setUserId(
                    Integer.parseInt(
                            request.getParameter("userId")
                    )
            );

            student.setCollegeId(
                    Integer.parseInt(
                            request.getParameter("collegeId")
                    )
            );

            student.setCourseId(
                    Integer.parseInt(
                            request.getParameter("courseId")
                    )
            );

            student.setName(
                    request.getParameter("name")
            );

            student.setEmail(
                    request.getParameter("email")
            );

            student.setPhone(
                    request.getParameter("phone")
            );

            student.setAddress(
                    request.getParameter("address")
            );

            student.setDob(
                    request.getParameter("dob")
            );

            student.setGender(
                    request.getParameter("gender")
            );

            studentDAO.addStudent(student);

        } catch (Exception e) {

            e.printStackTrace();
        }

        response.sendRedirect(
                request.getContextPath() + "/StudentServlet"
        );
    }
}