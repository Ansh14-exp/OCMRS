package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.CollegeDAO;
import com.ocmrs.model.College;

@WebServlet("/CollegeServlet")
public class CollegeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    CollegeDAO collegeDAO = new CollegeDAO();


    // GET
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");


// Delete College
if ("delete".equals(action)) {

int collegeId = Integer.parseInt(
       request.getParameter("collegeId"));

collegeDAO.deleteCollege(collegeId);

List<College> colleges =
       collegeDAO.getAllColleges();

request.setAttribute("colleges", colleges);

request.getRequestDispatcher(
       "admin/colleges.jsp").forward(
               request, response);


// Edit College
} else if ("edit".equals(action)) {

int collegeId = Integer.parseInt(
       request.getParameter("collegeId"));

College college =
       collegeDAO.getCollegeById(collegeId);

request.setAttribute("college", college);

request.getRequestDispatcher(
       "admin/editCollege.jsp").forward(
               request, response);


// View All Colleges
} else {

List<College> colleges =
       collegeDAO.getAllColleges();

request.setAttribute("colleges", colleges);

request.getRequestDispatcher(
       "admin/colleges.jsp").forward(
               request, response);
}
}


    // POST
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");


// Get College Details

String collegeName =
  request.getParameter("collegeName");

String address =
  request.getParameter("address");

String email =
  request.getParameter("email");

String phone =
  request.getParameter("phone");


College college = new College();

college.setCollegeName(collegeName);
college.setAddress(address);
college.setEmail(email);
college.setPhone(phone);


// Update College

if ("update".equals(action)) {

int collegeId = Integer.parseInt(
      request.getParameter("collegeId"));

college.setCollegeId(collegeId);

collegeDAO.updateCollege(college);

} else {

// Add College

collegeDAO.addCollege(college);
}


// Go back to College Management

response.sendRedirect(
  request.getContextPath()
  + "/CollegeServlet");
}
}