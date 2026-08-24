<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員一覧</title>
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
			<h2 class="main-title">従業員一覧</h2>
			<a href="${pageContext.request.contextPath}/EmployeeRegistServlet"
				class="btn btn-primary">＋ 新規登録</a>
		</div>

		<table class="data-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>名前</th>
					<th>年齢</th>
					<th>部署</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${list}">
					<tr>
						<td>${emp.id}</td>
						<td>${emp.name}</td>
						<td>${emp.age}</td>
						<td>${emp.department}</td>
						<td><a href="EmployeeDetailServlet?id=${emp.id}"
							class="btn btn-detail">詳細</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath}/js/confirm-modal.js"></script>

</body>
</html>