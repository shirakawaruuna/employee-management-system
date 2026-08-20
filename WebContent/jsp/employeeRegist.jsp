<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<label>氏名</label>
				<input type="text" name="name" id="name" value="${name}" class="${nameError != null ? 'input-error' : ''}">
				 <br><span class="error-text">${nameError}</span>
				<br> <span id="name-error" class="error-text"></span>
			</div>

			<div class="form-group">
				<label>年齢</label>
				<input type="text" name="age" id="age" value="${age}" class="${ageError != null ? 'input-error' : ''}">
				<br> <span class="error-text">${ageError}</span>
				<br> <span id="age-error" class="error-text"></span>
			</div>

			<div class="form-group">
				<label>部署</label>
				<input type="text" name="department" id="department" value="${department}"
				class="${departmentError != null ? 'input-error' : ''}">
				<br><span class="error-text">${departmentError}</span>
				<br><span id="department-error" class="error-text"></span>
			</div>

			<div class="form-group">
				<label>メール</label>
				<input type="text" name="email" value="${email}" class="${emailError != null ? 'input-error' : ''}">
				<br><span class="error-text">${emailError}</span>
			</div>

			<div class="form-group">
				<label>パスワード</label>
				<input type="password" name="password" class="${passwordError != null ? 'input-error' : ''}">
				<br><span class="error-text">${passwordError}</span>
			</div>

			<c:if test="${error != null}">
				<p class="error-text">${error}</p>
			</c:if>

			<div class="detail-actions">
				<input type="submit" class="btn btn-primary" id="submit-btn"
					value="登録">
			</div>

		</form>

		<div class="detail-actions">
			<a href="${pageContext.request.contextPath}/EmployeeListServlet"
				class="btn btn-detail">一覧へ戻る</a>
		</div>

	</div>
	</div>

	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>