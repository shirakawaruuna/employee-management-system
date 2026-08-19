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

@WebServlet("/EmployeeUpdateServlet")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String department = request.getParameter("department");
		String email = request.getParameter("email");

		Employee emp = new Employee();
		emp.setId(id);
		emp.setName(name);
		emp.setAge(age);
		emp.setDepartment(department);
		emp.setEmail(email);

		EmployeeDAO dao = new EmployeeDAO();
		dao.update(emp);

		HttpSession session = request.getSession(false);
		Employee loginUser = (Employee) session.getAttribute("loginUser");

		if ("admin".equals(loginUser.getRole())) {
			response.sendRedirect("EmployeeListServlet");
		}else {
			response.sendRedirect("MyPageServlet");
		}




	}

}
