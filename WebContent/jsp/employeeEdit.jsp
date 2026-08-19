<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員編集</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<!-- サイドバー -->
	<jsp:include page="parts/layout.jsp">
		<jsp:param name="menu" value="list" />
	</jsp:include>
	<!-- メインコンテンツ -->
	<div class="main">
		<h2 class="main-title">従業員編集</h2>

		<form action="EmployeeUpdateServlet" method="post">

			<input type="hidden" name="id" value="${employee.id}">

			<p>ID:${employee.id}</p>
			<div class="form-group">
				<label>氏名</label> <input type="text" name="name"
					value="${employee.name}">
			</div>
			<div class="form-group">
				<label>年齢</label><input type="text" name="age"
					value="${employee.age}">
			</div>
			<div class="form-group">
				<label>部署</label><input type="text" name="department"
					value="${employee.department}">
			</div>
			<div class="form-group">
				<label>メール</label><input type="text" name="email"
					value="${employee.email}">
			</div>

			<div class="detail-actions">
				<input type="submit" class="btn btn-primary" value="更新">

			</div>
		</form>
		<c:if test="${loginUser.role == 'admin'}">
			<div class="detail-actions">
				<a href="${pageContext.request.contextPath}/EmployeeListServlet"
					class="btn btn-detail">一覧へ戻る</a>
			</div>
		</c:if>

		<c:if test="${loginUser.role == 'user'}">
			<div class="detail-actions">
				<a href="${pageContext.request.contextPath}/MyPageServlet"
					class="btn btn-detail">マイページへ戻る</a>
			</div>
		</c:if>

	</div>
	</div>
</body>
</html>