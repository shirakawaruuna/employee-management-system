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

@WebServlet("/jsp/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		EmployeeDAO dao = new EmployeeDAO();

		// DBでログインチェック
		Employee emp = dao.login(id, pass);

		if (emp != null) {

			HttpSession session = request.getSession();
			session.setAttribute("loginUser", emp);
		    if ("admin".equals(emp.getRole())) {
		        // 管理者 → 従業員一覧へ
		        response.sendRedirect(request.getContextPath() + "/EmployeeListServlet");
		    } else {
		        // 一般社員 → マイページへ
		        response.sendRedirect(request.getContextPath() + "/MyPageServlet");
		    }
		} else {
			// ログイン失敗
			request.setAttribute("error", "IDまたはパスワードが違います");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
		}
	}

}