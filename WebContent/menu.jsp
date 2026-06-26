<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
</head>
<body>

	<h1>メニュー画面</h1>


ようこそ、${loginUser.name}さん<br><br>


<c:if test="${loginUser.role == 'admin'}">

	<a href="EmployeeListServlet">従業員一覧</a>
	<br>
	<a href="employeeRegist.jsp">従業員登録</a><br><br>
</c:if>

<c:if test="${loginUser.role == 'user'}">

	<a href="MyPageServlet">マイページ</a><br><br>

</c:if>

	<a href="LogoutServlet">ログアウト</a>

</body>
</html>