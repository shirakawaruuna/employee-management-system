
package com.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

@WebServlet("/EmployeeDetailServlet")
public class EmployeeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		int id = Integer.parseInt(request.getParameter("id"));

		if (!"admin".equals(loginUser.getRole()) && id != loginUser.getId()) {
		    response.sendRedirect("MyPageServlet");
		    return;
		}

		EmployeeDAO dao = new EmployeeDAO();
		Employee emp = dao.findById(id);

		request.setAttribute("employee", emp);
		request.getRequestDispatcher("jsp/employeeDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}