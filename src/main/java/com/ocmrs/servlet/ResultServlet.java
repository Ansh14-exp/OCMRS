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
import com.ocmrs.dao.ResultDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Exam;
import com.ocmrs.model.Result;
import com.ocmrs.model.Student;
import com.ocmrs.model.User;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ResultDAO resultDAO;
    private ExamDAO examDAO;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {

        resultDAO = new ResultDAO();
        examDAO = new ExamDAO();
        studentDAO = new StudentDAO();
    }


    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }


        User user = (User) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }


        String role = user.getRole();


        // =====================================================
        // ADMIN
        // =====================================================

        if ("ADMIN".equalsIgnoreCase(role)) {

            String action = request.getParameter("action");


            // =================================================
            // DELETE RESULT
            // =================================================

            if ("delete".equalsIgnoreCase(action)) {

                try {

                    int resultId = Integer.parseInt(
                            request.getParameter("resultId"));

                    boolean deleted =
                            resultDAO.deleteResult(resultId);


                    if (deleted) {

                        session.setAttribute(
                                "success",
                                "Result deleted successfully!");

                    } else {

                        session.setAttribute(
                                "error",
                                "Failed to delete result.");
                    }

                } catch (Exception e) {

                    e.printStackTrace();

                    session.setAttribute(
                            "error",
                            "Invalid Result ID.");
                }


                response.sendRedirect(
                        request.getContextPath()
                                + "/ResultServlet");

                return;
            }


            // =================================================
            // EDIT RESULT
            // =================================================

            if ("edit".equalsIgnoreCase(action)) {

                try {

                    int resultId = Integer.parseInt(
                            request.getParameter("resultId"));


                    Result result =
                            resultDAO.getResultById(resultId);


                    if (result == null) {

                        session.setAttribute(
                                "error",
                                "Result not found.");

                        response.sendRedirect(
                                request.getContextPath()
                                        + "/ResultServlet");

                        return;
                    }


                    // Data for dropdowns
                    request.setAttribute(
                            "exams",
                            examDAO.getAllExams());

                    request.setAttribute(
                            "students",
                            studentDAO.getAllStudents());


                    request.setAttribute(
                            "result",
                            result);


                    request.getRequestDispatcher(
                            "/admin/editResult.jsp")
                            .forward(request, response);

                    return;


                } catch (Exception e) {

                    e.printStackTrace();

                    session.setAttribute(
                            "error",
                            "Unable to load result.");

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/ResultServlet");

                    return;
                }
            }


            // =================================================
            // ADMIN RESULT PAGE
            // =================================================

            request.setAttribute(
                    "results",
                    resultDAO.getAllResults());


            // Exam dropdown data
            request.setAttribute(
                    "exams",
                    examDAO.getAllExams());


            // Student dropdown data
            request.setAttribute(
                    "students",
                    studentDAO.getAllStudents());


            // Success message
            String success =
                    (String) session.getAttribute("success");


            // Error message
            String error =
                    (String) session.getAttribute("error");


            if (success != null) {

                request.setAttribute(
                        "success",
                        success);

                session.removeAttribute("success");
            }


            if (error != null) {

                request.setAttribute(
                        "error",
                        error);

                session.removeAttribute("error");
            }


            request.getRequestDispatcher(
                    "/admin/results.jsp")
                    .forward(request, response);

            return;
        }


        // =====================================================
        // STUDENT
        // =====================================================

        if ("STUDENT".equalsIgnoreCase(role)) {

            Student student =
                    (Student) session.getAttribute("student");


            if (student == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/StudentServlet");

                return;
            }


            int studentId =
                    student.getStudentId();


            request.setAttribute(
                    "results",
                    resultDAO.getResultsByStudentId(studentId));


            request.getRequestDispatcher(
                    "/student/results.jsp")
                    .forward(request, response);

            return;
        }


        // =====================================================
        // OTHER ROLES
        // =====================================================

        response.sendRedirect(
                request.getContextPath() + "/login.jsp");
    }


    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);


        if (session == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }


        User user =
                (User) session.getAttribute("user");


        if (user == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }


        String action =
                request.getParameter("action");


        // =====================================================
        // ADD RESULT
        // =====================================================

        if ("add".equalsIgnoreCase(action)) {

            try {

                int examId =
                        Integer.parseInt(
                                request.getParameter("examId"));


                int studentId =
                        Integer.parseInt(
                                request.getParameter("studentId"));


                double marks =
                        Double.parseDouble(
                                request.getParameter("marks"));


                String grade =
                        request.getParameter("grade");


                if (grade == null ||
                    grade.trim().isEmpty()) {

                    session.setAttribute(
                            "error",
                            "Grade is required.");

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/ResultServlet");

                    return;
                }


                if (marks < 0) {

                    session.setAttribute(
                            "error",
                            "Marks cannot be negative.");

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/ResultServlet");

                    return;
                }


                Result result =
                        new Result();


                result.setExamId(examId);

                result.setStudentId(studentId);

                result.setMarks(marks);

                result.setGrade(grade.trim());


                boolean added =
                        resultDAO.addResult(result);


                if (added) {

                    session.setAttribute(
                            "success",
                            "Result added successfully!");

                } else {

                    session.setAttribute(
                            "error",
                            "Failed to add result.");
                }


            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Invalid input. Please check the values.");
            }


            response.sendRedirect(
                    request.getContextPath()
                            + "/ResultServlet");

            return;
        }


        // =====================================================
        // UPDATE RESULT
        // =====================================================

        if ("update".equalsIgnoreCase(action)) {

            try {

                int resultId =
                        Integer.parseInt(
                                request.getParameter("resultId"));


                int examId =
                        Integer.parseInt(
                                request.getParameter("examId"));


                int studentId =
                        Integer.parseInt(
                                request.getParameter("studentId"));


                double marks =
                        Double.parseDouble(
                                request.getParameter("marks"));


                String grade =
                        request.getParameter("grade");


                if (grade == null ||
                    grade.trim().isEmpty()) {

                    session.setAttribute(
                            "error",
                            "Grade is required.");

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/ResultServlet");

                    return;
                }


                if (marks < 0) {

                    session.setAttribute(
                            "error",
                            "Marks cannot be negative.");

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/ResultServlet");

                    return;
                }


                Result result =
                        new Result();


                result.setResultId(resultId);

                result.setExamId(examId);

                result.setStudentId(studentId);

                result.setMarks(marks);

                result.setGrade(grade.trim());


                boolean updated =
                        resultDAO.updateResult(result);


                if (updated) {

                    session.setAttribute(
                            "success",
                            "Result updated successfully!");

                } else {

                    session.setAttribute(
                            "error",
                            "Failed to update result.");
                }


            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Invalid input. Please check the values.");
            }


            response.sendRedirect(
                    request.getContextPath()
                            + "/ResultServlet");

            return;
        }


        // =====================================================
        // INVALID ACTION
        // =====================================================

        session.setAttribute(
                "error",
                "Invalid action.");


        response.sendRedirect(
                request.getContextPath()
                        + "/ResultServlet");
    }
}