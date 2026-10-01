package com.ocmrs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocmrs.dao.ApplicationDAO;
import com.ocmrs.dao.CollegeDAO;
import com.ocmrs.dao.CompanyDAO;
import com.ocmrs.dao.InterviewDAO;
import com.ocmrs.dao.JobDAO;
import com.ocmrs.dao.PlacementDAO;
import com.ocmrs.dao.StudentDAO;
import com.ocmrs.model.Application;
import com.ocmrs.model.College;
import com.ocmrs.model.Company;
import com.ocmrs.model.Interview;
import com.ocmrs.model.Job;
import com.ocmrs.model.Placement;
import com.ocmrs.model.Student;

