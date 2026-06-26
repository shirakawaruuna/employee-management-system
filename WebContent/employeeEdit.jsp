<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員編集</title>
</head>
<body>

	<h1>従業員編集</h1>

	<form action="EmployeeUpdateServlet" method="post">

		<input type="hidden" name="id" value="${employee.id}">

		ID:${employee.id}<br>
		<br> 氏名: <input type="text" name="name" value="${employee.name}"><br>
		<br> 年齢: <input type="text" name="age" value="${employee.age}"><br>
		<br> 部署: <input type="text" name="department"
			value="${employee.department}"><br>
		<br> メール: <input type="text" name="email"
			value="${employee.email}"><br>
		<br> <input type="submit" value="更新">

	</form>

	<br>

<c:if test="${loginUser.role == 'admin'}">
	<a href="EmployeeListServlet">一覧へ戻る</a>
</c:if>

<c:if test="${loginUser.role == 'user'}">
	<a href="menu.jsp">マイページへ戻る</a>
</c:if>

</body>
</html>