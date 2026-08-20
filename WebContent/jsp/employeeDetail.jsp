<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員詳細</title>
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
		<div class="main-header">
			<h2 class="main-title">従業員詳細</h2>
		</div>

		<div class="detail-info">
			ID：${employee.id}<br> 氏名：${employee.name}<br>
			年齢：${employee.age}<br> 部署：${employee.department}<br>
			メール：${employee.email}<br>
		</div>

		<div class="detail-actions">
			<a href="EmployeeEditServlet?id=${employee.id}"
				class="btn btn-primary">編集</a>
			<c:if test="${loginUser.role == 'admin'}">
				<a href="EmployeeDeleteServlet?id=${employee.id}"
					class="btn btn-danger">削除</a>
				<a href="EmployeeListServlet" class="btn btn-detail btn-right">一覧へ戻る</a>
			</c:if>

		</div>
	</div>
	</div>

</body>
</html>