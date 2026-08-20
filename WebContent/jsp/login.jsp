<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="../css/login.css">
</head>

<body>
	<div class="login-card">
		<h2>ログイン画面</h2>
		<form action="login" method="post">

			<div class="form-group">
				<label>ID:</label> <input type="text" name="id" value="${id}">
			</div>

			<div class="form-group">
				<label>PASS:</label> <input type="password" name="pass">
			</div>

			<c:if test="${error != null}">
				<p style="color: red; font-size: 12px; ">${error}</p>
			</c:if>


			<input type="submit" value="ログイン">

		</form>
	</div>
</body>
</html>