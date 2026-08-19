package com.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

@WebServlet("/EmployeeInsertServlet")
public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String department = request.getParameter("department");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Employee emp = new Employee();
		emp.setName(name);
		emp.setAge(age);
		emp.setDepartment(department);
		emp.setEmail(email);
		emp.setPassword(password);

		EmployeeDAO dao = new EmployeeDAO();
		dao.insert(emp);

		response.sendRedirect("EmployeeListServlet");
	}

}
