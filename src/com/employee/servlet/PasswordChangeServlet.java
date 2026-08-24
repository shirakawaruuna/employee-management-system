package com.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

@WebServlet("/PasswordChangeServlet")
public class PasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		int id = loginUser.getId();
		String currentPassword = request.getParameter("password");
		String newPassword = request.getParameter("newpassword");
		String confirmPassword = request.getParameter("checkpassword");

		EmployeeDAO dao = new EmployeeDAO();
		Employee emp = dao.findById(id);

		if (currentPassword == null || currentPassword.isEmpty()) {
			// 空なので、エラーを出して更新せずに戻す
			request.setAttribute("passwordError", "現在のパスワードを入力してください。");

			request.getRequestDispatcher("jsp/passwordChange.jsp")
					.forward(request, response);
			return;

		} else if (!currentPassword.equals(emp.getPassword())) {

			request.setAttribute("passwordError", "現在のパスワードが間違っています。正しいパスワードを入力して下さい。");

			request.getRequestDispatcher("jsp/passwordChange.jsp")
					.forward(request, response);
			return;
		}

		if (newPassword == null || newPassword.isEmpty()) {
			// 空なので、エラーを出して更新せずに戻す
			request.setAttribute("newpasswordError", "新しいパスワードを入力してください。");

			request.getRequestDispatcher("jsp/passwordChange.jsp")
					.forward(request, response);
			return;
		} else if (confirmPassword == null || confirmPassword.isEmpty()) {
			request.setAttribute("confirmswordError", "確認用パスワードを入力してください。");

			request.getRequestDispatcher("jsp/passwordChange.jsp")
					.forward(request, response);
			return;
		} else if (!newPassword.equals(confirmPassword)) {
			request.setAttribute("newpasswordError", "新しいパスワードと確認のための新しいパスワードが一致しません。再入力して下さい。");

			request.getRequestDispatcher("jsp/passwordChange.jsp")
					.forward(request, response);
			return;
		}

		emp.setPassword(newPassword);
		dao.pass(emp);
		emp.setId(id);
		emp.setPassword(newPassword);

		request.setAttribute("successMessage", "パスワードを変更しました");
		request.getRequestDispatcher("jsp/passwordChange.jsp").forward(request, response);

	}

}
