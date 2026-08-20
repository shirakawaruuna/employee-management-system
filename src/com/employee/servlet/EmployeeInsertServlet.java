package com.employee.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;
import com.employee.validator.EmployeeValidator;

//新規登録サーブレット
@WebServlet("/EmployeeInsertServlet")
public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//文字列で受け取る
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		String department = request.getParameter("department");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// バリデーターにチェックしてもらう
		EmployeeValidator validator = new EmployeeValidator();
		Map<String, String> errors = validator.validate(name, ageStr, department, email, password);

		if (!errors.isEmpty()) {
		    // エラーメッセージを全部requestにセットする
		    for (Map.Entry<String, String> entry : errors.entrySet()) {
		        request.setAttribute(entry.getKey(), entry.getValue());
		    }

		    // 入力値も持たせる
		    request.setAttribute("name", name);
		    request.setAttribute("age", ageStr);
		    request.setAttribute("department", department);
		    request.setAttribute("email", email);

		    // 登録画面に戻す
		    request.getRequestDispatcher("jsp/employeeRegist.jsp").forward(request, response);
		    return;
		}

		int age = Integer.parseInt(ageStr);

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
