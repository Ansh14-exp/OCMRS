package com.ocmrs.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.UserDAO;
import com.ocmrs.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	
	    private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request,
	                          HttpServletResponse response)
	            throws ServletException, IOException {

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        UserDAO userDAO = new UserDAO();

	        User user = userDAO.login(username, password);

	        if (user != null) {

	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);

	            String role = user.getRole();

	            if ("ADMIN".equalsIgnoreCase(role)) {
	                response.sendRedirect("admin/dashboard.jsp");

	            } else if ("STUDENT".equalsIgnoreCase(role)) {
	                response.sendRedirect("student/dashboard.jsp");

	            } else if ("FACULTY".equalsIgnoreCase(role)) {
	                response.sendRedirect("faculty/dashboard.jsp");

	            } else if ("COMPANY".equalsIgnoreCase(role)) {
	                response.sendRedirect("company/dashboard.jsp");

	            } else {
	                response.sendRedirect("login.jsp?error=InvalidRole");
	            }

	        } else {

	            response.sendRedirect("login.jsp?error=InvalidLogin");
	        }
	    }
	}
