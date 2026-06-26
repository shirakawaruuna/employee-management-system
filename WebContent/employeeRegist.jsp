<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録</title>
</head>
<body>

	<h1>従業員登録</h1>

	<form action="EmployeeInsertServlet" method="post">

		氏名： <input type="text" name="name"><br>
		<br> 年齢： <input type="text" name="age"><br>
		<br> 部署： <input type="text" name="department"><br>
		<br> メール： <input type="text" name="email"><br>
		<br> パスワード： <input type="password" name="password"><br>
		<br> <input type="submit" value="登録">

	</form>

	<br>

	<a href="EmployeeListServlet">一覧へ戻る</a>

</body>
</html>