package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.CourseDAO;
import com.ocmrs.dao.DepartmentDAO;
import com.ocmrs.model.Course;
import com.ocmrs.model.Department;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    CourseDAO courseDAO = new CourseDAO();
    DepartmentDAO departmentDAO = new DepartmentDAO();


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");


        // Delete Course
        if ("delete".equals(action)) {

            int courseId = Integer.parseInt(
                    request.getParameter("courseId"));

            courseDAO.deleteCourse(courseId);

            List<Course> courses =
                    courseDAO.getAllCourses();

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "courses", courses);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/courses.jsp")
                    .forward(request, response);


        // Edit Course
        } else if ("edit".equals(action)) {

            int courseId = Integer.parseInt(
                    request.getParameter("courseId"));

            Course course =
                    courseDAO.getCourseById(courseId);

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "course", course);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/editCourse.jsp")
                    .forward(request, response);


        // View All Courses
        } else {

            List<Course> courses =
                    courseDAO.getAllCourses();

            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute(
                    "courses", courses);

            request.setAttribute(
                    "departments", departments);

            request.getRequestDispatcher(
                    "admin/courses.jsp")
                    .forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        String departmentId =
                request.getParameter("departmentId");

        String courseName =
                request.getParameter("courseName");

        String duration =
                request.getParameter("duration");

        String level =
                request.getParameter("level");


        Course course =
                new Course();

        course.setDepartmentId(
                Integer.parseInt(departmentId));

        course.setCourseName(courseName);

        course.setDuration(duration);

        course.setLevel(level);


        // Update Course
        if ("update".equals(action)) {

            int courseId =
                    Integer.parseInt(
                            request.getParameter("courseId"));

            course.setCourseId(courseId);

            courseDAO.updateCourse(course);


        // Add Course
        } else {

            courseDAO.addCourse(course);
        }


        response.sendRedirect(
                request.getContextPath()
                + "/CourseServlet");
    }
}