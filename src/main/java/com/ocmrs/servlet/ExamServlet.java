package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ExamDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Exam;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ExamDAO examDAO;

    @Override
    public void init() throws ServletException {
        examDAO = new ExamDAO();
    }

    // =====================================================
    // GET
    // =====================================================

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

        User user =
                (User) session.getAttribute("user");

        String role = user.getRole();


        // =================================================
        // ADMIN SECTION
        // =================================================

        if ("ADMIN".equalsIgnoreCase(role)) {

            String action =
                    request.getParameter("action");


            // -------------------------------------------------
            // DELETE EXAM
            // -------------------------------------------------

            if ("delete".equalsIgnoreCase(action)) {

                try {

                    int examId =
                            Integer.parseInt(
                                    request.getParameter("examId")
                            );

                    boolean deleted =
                            examDAO.deleteExam(examId);

                    if (deleted) {

                        session.setAttribute(
                                "success",
                                "Exam deleted successfully!"
                        );

                    } else {

                        session.setAttribute(
                                "error",
                                "Exam could not be deleted."
                        );
                    }

                } catch (Exception e) {

                    e.printStackTrace();

                    session.setAttribute(
                            "error",
                            "Error deleting exam."
                    );
                }

                response.sendRedirect(
                        request.getContextPath()
                        + "/ExamServlet"
                );

                return;
            }


            // -------------------------------------------------
            // EDIT EXAM
            // -------------------------------------------------

            if ("edit".equalsIgnoreCase(action)) {

                try {

                    int examId =
                            Integer.parseInt(
                                    request.getParameter("examId")
                            );

                    Exam exam =
                            examDAO.getExamById(examId);

                    if (exam == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/ExamServlet"
                        );

                        return;
                    }

                    request.setAttribute(
                            "exam",
                            exam
                    );

                    request.getRequestDispatcher(
                            "/admin/editExam.jsp"
                    ).forward(request, response);

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ExamServlet"
                    );
                }

                return;
            }


            // -------------------------------------------------
            // ADMIN EXAM LIST
            // -------------------------------------------------

            List<Exam> exams =
                    examDAO.getAllExams();

            request.setAttribute(
                    "exams",
                    exams
            );


            // Success/Error messages

            String success =
                    (String) session.getAttribute("success");

            String error =
                    (String) session.getAttribute("error");

            session.removeAttribute("success");
            session.removeAttribute("error");

            request.setAttribute(
                    "success",
                    success
            );

            request.setAttribute(
                    "error",
                    error
            );


            request.getRequestDispatcher(
                    "/admin/exams.jsp"
            ).forward(request, response);

            return;
        }


        // =================================================
        // STUDENT SECTION
        // =================================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            Student student =
                    (Student) session.getAttribute("student");


            // Student object check

            if (student == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/login.jsp"
                );

                return;
            }


            // Get student's course ID

            int courseId =
                    student.getCourseId();


            // Get exams for course

            List<Exam> exams =
                    examDAO.getExamsByCourseId(courseId);


            // Send exams to JSP

            request.setAttribute(
                    "exams",
                    exams
            );


            // Open student exams page

            request.getRequestDispatcher(
                    "/student/exams.jsp"
            ).forward(request, response);

            return;
        }


        // =================================================
        // OTHER ROLES
        // =================================================

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
        );
    }


    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);


        // Login check

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


        // Only ADMIN

        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        String action =
                request.getParameter("action");


        // =================================================
        // UPDATE EXAM
        // =================================================

        if ("update".equalsIgnoreCase(action)) {

            try {

                Exam exam =
                        new Exam();


                exam.setExamId(
                        Integer.parseInt(
                                request.getParameter(
                                        "examId"
                                )
                        )
                );


                exam.setSubjectId(
                        Integer.parseInt(
                                request.getParameter(
                                        "subjectId"
                                )
                        )
                );


                exam.setExamType(
                        request.getParameter(
                                "examType"
                        ).trim()
                );


                exam.setExamDate(
                        request.getParameter(
                                "examDate"
                        )
                );


                exam.setTotalMarks(
                        Integer.parseInt(
                                request.getParameter(
                                        "totalMarks"
                                )
                        )
                );


                boolean updated =
                        examDAO.updateExam(exam);


                if (updated) {

                    session.setAttribute(
                            "success",
                            "Exam updated successfully!"
                    );

                } else {

                    session.setAttribute(
                            "error",
                            "Exam update failed."
                    );
                }

            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Invalid exam data."
                );
            }


            response.sendRedirect(
                    request.getContextPath()
                    + "/ExamServlet"
            );

            return;
        }


        // =================================================
        // ADD EXAM
        // =================================================

        if ("add".equalsIgnoreCase(action)) {

            try {

                String subjectIdParam =
                        request.getParameter("subjectId");

                String examType =
                        request.getParameter("examType");

                String examDate =
                        request.getParameter("examDate");

                String totalMarksParam =
                        request.getParameter("totalMarks");


                // Validation

                if (subjectIdParam == null ||
                    examType == null ||
                    examDate == null ||
                    totalMarksParam == null ||
                    examType.trim().isEmpty() ||
                    examDate.trim().isEmpty()) {

                    session.setAttribute(
                            "error",
                            "Please fill all exam details."
                    );

                    response.sendRedirect(
                            request.getContextPath()
                            + "/ExamServlet"
                    );

                    return;
                }


                int subjectId =
                        Integer.parseInt(subjectIdParam);


                int totalMarks =
                        Integer.parseInt(totalMarksParam);


                Exam exam =
                        new Exam();


                exam.setSubjectId(
                        subjectId
                );


                exam.setExamType(
                        examType.trim()
                );


                exam.setExamDate(
                        examDate
                );


                exam.setTotalMarks(
                        totalMarks
                );


                boolean added =
                        examDAO.addExam(exam);


                if (added) {

                    session.setAttribute(
                            "success",
                            "Exam added successfully!"
                    );

                } else {

                    session.setAttribute(
                            "error",
                            "Exam could not be added."
                    );
                }

            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Error adding exam. Check Subject ID and exam details."
                );
            }


            response.sendRedirect(
                    request.getContextPath()
                    + "/ExamServlet"
            );

            return;
        }


        // Unknown action

        response.sendRedirect(
                request.getContextPath()
                + "/ExamServlet"
        );
    }
}