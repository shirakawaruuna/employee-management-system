package com.employee.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;
import com.employee.validator.EmployeeValidator;

@WebServlet("/EmployeeUpdateServlet")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		//文字列で受け取る
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		String department = request.getParameter("department");
		String email = request.getParameter("email");

		// バリデーターにチェックしてもらう
		EmployeeValidator validator = new EmployeeValidator();
		Map<String, String> errors = validator.validate(name, ageStr, department, email, null);

		if (!errors.isEmpty()) {
		    // エラーメッセージをセット
		    for (Map.Entry<String, String> entry : errors.entrySet()) {
		        request.setAttribute(entry.getKey(), entry.getValue());
		    }
		    // 入力値をセット
		    request.setAttribute("name", name);
		    request.setAttribute("age", ageStr);
		    request.setAttribute("department", department);
		    request.setAttribute("email", email);

		    // employee を取り直して渡す（idから）
		    EmployeeDAO dao = new EmployeeDAO();
		    Employee emp = dao.findById(id);
		    request.setAttribute("employee", emp);

		    request.getRequestDispatcher("jsp/employeeEdit.jsp").forward(request, response);
		    return;
		}

		int age = Integer.parseInt(ageStr);

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
		} else {
			response.sendRedirect("MyPageServlet");
		}

	}

}
