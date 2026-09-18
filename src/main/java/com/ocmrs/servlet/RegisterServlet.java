package com.ocmrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocmrs.dao.UserDAO;
import com.ocmrs.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
 
	private static final long serialVersionUID = 1L;
	
	    protected void doPost(HttpServletRequest request,
	                          HttpServletResponse response)
	            throws ServletException, IOException {

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("confirmPassword");
	        String role = request.getParameter("role");

	        // Check password
	        if (!password.equals(confirmPassword)) {

	            response.sendRedirect(
	                "register.jsp?error=PasswordMismatch"
	            );

	            return;
	        }

	        // Create User object
	        User user = new User();

	        user.setUsername(username);
	        user.setPassword(password);
	        user.setRole(role);

	        // Register user
	        UserDAO userDAO = new UserDAO();

	        boolean result = userDAO.register(user);

	        if (result) {

	            response.sendRedirect(
	                "register.jsp?success=Registered"
	            );

	        } else {

	            response.sendRedirect(
	                "register.jsp?error=RegistrationFailed"
	            );
	        }
	    }
	}
