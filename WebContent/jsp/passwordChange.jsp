<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード変更</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<!-- サイドバー -->
	<jsp:include page="parts/layout.jsp">
		<jsp:param name="menu" value="pass" />
	</jsp:include>
	<!-- メインコンテンツ -->
	<div class="main">
		<div class="main-header">
			<h2 class="main-title">パスワード変更</h2>
		</div>
		<form
			action="${pageContext.request.contextPath}/PasswordChangeServlet"
			method="post">

			<div class="form-group">
				<label>現在のパスワード</label> <input type="password" name="password"
					id="password" class="${passwordError != null ? 'input-error' : ''}">
				<br> <span class="error-text">${passwordError}</span>
			</div>

			<div class="form-group">
				<label>新しいパスワード</label> <input type="password" name="newpassword"
					id="newpassword"
					class="${newpasswordError != null ? 'input-error' : ''}"> <br>
				<span id="newpassword-error" class="error-text">${newpasswordError}</span>
			</div>

			<div class="form-group">
				<label>パスワードの確認</label> <input type="password" name="checkpassword"
					id="checkpassword"
					class="${confirmswordError != null ? 'input-error' : ''}">
				<span style="color: #666666; font-size: 12px;">新しいパスワードの再入力</span> <br>
				<span id="newpassword-error" class="error-text">${confirmswordError}</span>
			</div>


			<div class="detail-actions">
				<input type="submit" class="btn btn-primary confirm-btn"
					id="submit-btn" data-message="パスワードを変更します。よろしいですか？" value="変更">
			</div>

		</form>

		<c:if test="${not empty successMessage}">
			<div class="modal-overlay show" id ="success-modal">
				<div class="modal-box">
					<p class="success-message">${successMessage}</p>
					<div class="modal-buttons">
						<button type="button" id="OkBtn" class="btn btn-primary">OK</button>
					</div>
				</div>
			</div>
		</c:if>

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

	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/js/confirm-modal.js"></script>

</body>
</html>