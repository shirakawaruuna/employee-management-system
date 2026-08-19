<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<!-- サイドバー -->
	<jsp:include page="parts/layout.jsp">
		<jsp:param name="menu" value="regist" />
	</jsp:include>
	<!-- メインコンテンツ -->
	<div class="main">
		<h2 class="main-title">従業員登録</h2>

		<form
			action="${pageContext.request.contextPath}/EmployeeInsertServlet"
			method="post">

			<div class="form-group">
				<label>氏名</label> <input type="text" name="name">
			</div>
			<div class="form-group">
				<label>年齢</label> <input type="text" name="age">
			</div>
			<div class="form-group">
				<label>部署</label> <input type="text" name="department">
			</div>
			<div class="form-group">
				<label>メール</label> <input type="text" name="email">
			</div>
			<div class="form-group">
				<label>パスワード</label> <input type="password" name="password">
			</div>

			<div class="detail-actions">
				<input type="submit" class="btn btn-primary" value="登録">
			</div>

		</form>

		<div class="detail-actions">
			<a href="${pageContext.request.contextPath}/EmployeeListServlet"
				class="btn btn-detail">一覧へ戻る</a>
		</div>

	</div>
	</div>
</body>
</html>