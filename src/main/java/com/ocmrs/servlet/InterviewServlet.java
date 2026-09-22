package com.ocmrs.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.InterviewDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.Interview;

@WebServlet("/InterviewServlet")
public class InterviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private InterviewDAO interviewDAO;
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {

        interviewDAO = new InterviewDAO();
        applicationDAO = new ApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

        case "delete":
            deleteInterview(request, response);
            break;

        case "edit":
            editInterview(request, response);
            break;

        default:
            listInterviews(request, response);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            addInterview(request, response);

        } else if ("update".equals(action)) {

            updateInterview(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/InterviewServlet"
            );
        }
    }


    // ADD INTERVIEW
    private void addInterview(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Interview interview =
                new Interview();

        interview.setApplicationId(
                Integer.parseInt(
                        request.getParameter(
                                "applicationId"
                        )
                )
        );

        String interviewDate =
                request.getParameter("interviewDate");

        if (interviewDate != null
                && !interviewDate.isEmpty()) {

            interviewDate = interviewDate.replace("T", " ");

            if (interviewDate.length() == 16) {
                interviewDate += ":00";
            }

            interview.setInterviewDate(
                    Timestamp.valueOf(interviewDate)
            );
        }

        interview.setMode(
                request.getParameter("mode")
        );

        interview.setResult(
                request.getParameter("result")
        );

        interviewDAO.addInterview(interview);

        response.sendRedirect(
                request.getContextPath()
                + "/InterviewServlet"
        );
    }


    // LIST INTERVIEWS
    private void listInterviews(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Interview> interviews =
                interviewDAO.getAllInterviews();

        List<Application> applications =
                applicationDAO.getAllApplications();

        request.setAttribute(
                "interviews",
                interviews
        );

        request.setAttribute(
                "applications",
                applications
        );

        request.getRequestDispatcher(
                "admin/interviews.jsp"
        ).forward(request, response);
    }


    // EDIT INTERVIEW
    private void editInterview(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int interviewId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        Interview interview =
                interviewDAO.getInterviewById(
                        interviewId
                );

        List<Application> applications =
                applicationDAO.getAllApplications();

        request.setAttribute(
                "interview",
                interview
        );

        request.setAttribute(
                "applications",
                applications
        );

        request.getRequestDispatcher(
                "admin/editInterview.jsp"
        ).forward(request, response);
    }


    // UPDATE INTERVIEW
    private void updateInterview(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Interview interview =
                new Interview();

        interview.setInterviewId(
                Integer.parseInt(
                        request.getParameter(
                                "interviewId"
                        )
                )
        );

        interview.setApplicationId(
                Integer.parseInt(
                        request.getParameter(
                                "applicationId"
                        )
                )
        );

        String interviewDate =
                request.getParameter("interviewDate");

        if (interviewDate != null
                && !interviewDate.isEmpty()) {

            interviewDate = interviewDate.replace("T", " ");

            if (interviewDate.length() == 16) {
                interviewDate += ":00";
            }

            interview.setInterviewDate(
                    Timestamp.valueOf(interviewDate)
            );
        }

        interview.setMode(
                request.getParameter("mode")
        );

        interview.setResult(
                request.getParameter("result")
        );

        interviewDAO.updateInterview(interview);

        response.sendRedirect(
                request.getContextPath()
                + "/InterviewServlet"
        );
    }


    // DELETE INTERVIEW
    private void deleteInterview(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int interviewId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        interviewDAO.deleteInterview(
                interviewId
        );

        response.sendRedirect(
                request.getContextPath()
                + "/InterviewServlet"
        );
    }
}