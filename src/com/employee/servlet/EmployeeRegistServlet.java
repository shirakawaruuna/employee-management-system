package com.employee.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.model.Employee;

/**
 * Servlet implementation class EmployeeRegistServlet
 */
@WebServlet("/EmployeeRegistServlet")
public class EmployeeRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null) {
			response.sendRedirect("jsp/login.jsp");
			return;
		}

		Employee loginUser = (Employee) session.getAttribute("loginUser");

		if (loginUser == null) {
			response.sendRedirect("jsp/login.jsp");
			return;
		}

		if (!"admin".equals(loginUser.getRole())) {
			response.sendRedirect("MyPageServlet");
			return;
		}



		RequestDispatcher rd = request.getRequestDispatcher("jsp/employeeRegist.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
