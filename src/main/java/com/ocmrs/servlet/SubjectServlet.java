package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.SubjectDAO;
import com.ocmrs.model.Student;
import com.ocmrs.model.Subject;
import com.ocmrs.model.User;


@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubjectDAO subjectDAO;

    @Override
    public void init() throws ServletException {
        subjectDAO = new SubjectDAO();
    }

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // =========================
        // ADMIN
        // =========================
        if ("ADMIN".equalsIgnoreCase(user.getRole())) {

            String action = request.getParameter("action");

            // DELETE
            if ("delete".equalsIgnoreCase(action)) {

                try {
                    int subjectId = Integer.parseInt(
                            request.getParameter("subjectId")
                    );

                    boolean deleted = subjectDAO.deleteSubject(subjectId);

                    if (deleted) {
                        request.getSession().setAttribute(
                                "success",
                                "Subject deleted successfully!"
                        );
                    } else {
                        request.getSession().setAttribute(
                                "error",
                                "Subject could not be deleted."
                        );
                    }

                } catch (Exception e) {
                    e.printStackTrace();

                    request.getSession().setAttribute(
                            "error",
                            "Error deleting subject."
                    );
                }

                response.sendRedirect(
                        request.getContextPath() + "/SubjectServlet"
                );
                return;
            }

            // EDIT
            if ("edit".equalsIgnoreCase(action)) {

                try {

                    int subjectId = Integer.parseInt(
                            request.getParameter("subjectId")
                    );

                    Subject subject =
                            subjectDAO.getSubjectById(subjectId);

                    if (subject == null) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/SubjectServlet"
                        );
                        return;
                    }

                    request.setAttribute("subject", subject);

                    request.getRequestDispatcher(
                            "/admin/editSubject.jsp"
                    ).forward(request, response);

                } catch (Exception e) {

                    e.printStackTrace();

                    response.sendRedirect(
                            request.getContextPath()
                            + "/SubjectServlet"
                    );
                }

                return;
            }

            // SUBJECT LIST
            List<Subject> subjects =
                    subjectDAO.getAllSubjects();

            request.setAttribute("subjects", subjects);

            // Get message
            String success =
                    (String) session.getAttribute("success");

            String error =
                    (String) session.getAttribute("error");

            session.removeAttribute("success");
            session.removeAttribute("error");

            request.setAttribute("success", success);
            request.setAttribute("error", error);

            request.getRequestDispatcher(
                    "/admin/subjects.jsp"
            ).forward(request, response);

            return;
        }

        // =========================
        // STUDENT
        // =========================
        if ("STUDENT".equalsIgnoreCase(user.getRole())) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {
                response.sendRedirect(
                        request.getContextPath() + "/login.jsp"
                );
                return;
            }

            int courseId = student.getCourseId();

            List<Subject> subjects =
                    subjectDAO.getSubjectsByCourseId(courseId);

            request.setAttribute("subjects", subjects);

            request.getRequestDispatcher(
                    "/student/subjects.jsp"
            ).forward(request, response);

            return;
        }

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

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user =
                (User) session.getAttribute("user");

        // Only ADMIN
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        String action =
                request.getParameter("action");

        // =========================
        // UPDATE
        // =========================
        if ("update".equalsIgnoreCase(action)) {

            try {

                Subject subject = new Subject();

                subject.setSubjectId(
                        Integer.parseInt(
                                request.getParameter("subjectId")
                        )
                );

                subject.setCourseId(
                        Integer.parseInt(
                                request.getParameter("courseId")
                        )
                );

                subject.setSubjectName(
                        request.getParameter("subjectName").trim()
                );

                subject.setCredits(
                        Integer.parseInt(
                                request.getParameter("credits")
                        )
                );

                boolean updated =
                        subjectDAO.updateSubject(subject);

                if (updated) {

                    session.setAttribute(
                            "success",
                            "Subject updated successfully!"
                    );

                } else {

                    session.setAttribute(
                            "error",
                            "Subject update failed."
                    );
                }

            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Invalid subject data."
                );
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet"
            );

            return;
        }

        // =========================
        // ADD
        // =========================
        if ("add".equalsIgnoreCase(action)) {

            try {

                String courseIdParam =
                        request.getParameter("courseId");

                String subjectName =
                        request.getParameter("subjectName");

                String creditsParam =
                        request.getParameter("credits");

                if (courseIdParam == null ||
                    subjectName == null ||
                    creditsParam == null ||
                    subjectName.trim().isEmpty()) {

                    session.setAttribute(
                            "error",
                            "Please fill all subject details."
                    );

                    response.sendRedirect(
                            request.getContextPath()
                            + "/SubjectServlet"
                    );
                    return;
                }

                int courseId =
                        Integer.parseInt(courseIdParam);

                int credits =
                        Integer.parseInt(creditsParam);

                Subject subject =
                        new Subject();

                subject.setCourseId(courseId);
                subject.setSubjectName(subjectName.trim());
                subject.setCredits(credits);

                boolean added =
                        subjectDAO.addSubject(subject);

                if (added) {

                    session.setAttribute(
                            "success",
                            "Subject added successfully!"
                    );

                } else {

                    session.setAttribute(
                            "error",
                            "Subject could not be added."
                    );
                }

            } catch (Exception e) {

                e.printStackTrace();

                session.setAttribute(
                        "error",
                        "Error adding subject. Check Course ID."
                );
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet"
            );

            return;
        }

        response.sendRedirect(
                request.getContextPath()
                + "/SubjectServlet"
        );
    }
}