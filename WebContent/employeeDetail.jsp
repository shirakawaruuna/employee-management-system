<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員詳細</title>
</head>
<body>

	<h1>従業員詳細</h1>

	ID:${employee.id}
	<br> 氏名：${employee.name}
	<br> 年齢：${employee.age}
	<br> 部署：${employee.department}
	<br> メール：${employee.email}
	<br>

	<br>
	<a href="EmployeeEditServlet?id=${employee.id}">編集</a>
	<br>


<c:if test="${loginUser.role == 'admin'}">
	<a href="EmployeeDeleteServlet?id=${employee.id}">削除</a>
	<a href="EmployeeListServlet">一覧へ戻る</a>
</c:if>

<c:if test="${loginUser.role == 'user'}">
	<a href="menu.jsp">マイページへ戻る</a>
</c:if>

</body>
</html>