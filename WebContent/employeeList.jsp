<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>従業員一覧</title>
</head>

<body>

	<h1>従業員一覧</h1>


	<table border="1">

		<tr>
			<th>ID</th>
			<th>名前</th>
		</tr>


		<c:forEach var="emp" items="${list}">
			<tr>
				<td><a href="EmployeeDetailServlet?id=${emp.id}">${emp.id}</a></td>
				<td>${emp.name}</td>
			</tr>
		</c:forEach>

	</table>

	<br>

	<a href="menu.jsp">メニュー画面へ戻る</a>

</body>
</html>