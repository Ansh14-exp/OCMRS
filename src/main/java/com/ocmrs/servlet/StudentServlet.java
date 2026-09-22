package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.StudentDao;
import com.ocmrs.model.Student;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    StudentDao studentDAO = new StudentDao();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {

            int studentId = Integer.parseInt(
                    request.getParameter("studentId"));

            studentDAO.deleteStudent(studentId);

            List<Student> students =
                    studentDAO.getAllStudents();

            request.setAttribute("students", students);

            request.getRequestDispatcher(
                    "admin/students.jsp").forward(request, response);

        } else if ("edit".equals(action)) {

            int studentId = Integer.parseInt(
                    request.getParameter("studentId"));

            Student student =
                    studentDAO.getStudentById(studentId);

            request.setAttribute("student", student);

            request.getRequestDispatcher(
                    "admin/editStudent.jsp").forward(request, response);

        } else {

            List<Student> students =
                    studentDAO.getAllStudents();

            request.setAttribute("students", students);

            request.getRequestDispatcher(
                    "admin/students.jsp").forward(request, response);
        }

}
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");

String collegeId = request.getParameter("collegeId");
String courseId = request.getParameter("courseId");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");

Student student = new Student();

student.setCollegeId(Integer.parseInt(collegeId));
student.setCourseId(Integer.parseInt(courseId));
student.setName(name);
student.setEmail(email);
student.setPhone(phone);
student.setAddress(address);
student.setDob(dob);
student.setGender(gender);

if ("update".equals(action)) {

int studentId = Integer.parseInt(
      request.getParameter("studentId"));

student.setStudentId(studentId);

studentDAO.updateStudent(student);

} else {

studentDAO.addStudent(student);
}

response.sendRedirect(
  request.getContextPath() + "/StudentServlet");
}
   
}