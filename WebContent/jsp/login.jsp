<%@ page contentType="text/html; charset=UTF-8"%>

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
			        <label>ID:</label>
			        <input type="text" name="id">
			    </div>

			    <div class="form-group">
			        <label>PASS:</label>
			        <input type="password" name="pass">
			    </div>

			    <input type="submit" value="ログイン">

			</form>
	</div>
</body>
</html>