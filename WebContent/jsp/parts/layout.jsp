<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ヘッダー -->
<div class="header">
	<span class="header-title">従業員管理システム</span>
	<div class="header-right">
		<span class="header-user">ようこそ、${loginUser.name} さん</span> <a href="#"
			class="logout-btn confirm-btn" data-message="ログアウトしますか?"
			data-url="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
	</div>
</div>


<div class="layout">

	<!-- サイドバー -->
	<div class="sidebar">
		<c:if test="${loginUser.role == 'admin'}">
			<a href="${pageContext.request.contextPath}/EmployeeListServlet"
				class="sidebar-item <c:if test="${param.menu == 'list'}">active</c:if>">従業員一覧</a>
			<a href="${pageContext.request.contextPath}/jsp/employeeRegist.jsp"
				class="sidebar-item <c:if test="${param.menu == 'regist'}">active</c:if>">新規登録</a>
			<a href="${pageContext.request.contextPath}/jsp/passwordChange.jsp"
				class="sidebar-item <c:if test="${param.menu == 'pass'}">active</c:if>">パスワード変更</a>
		</c:if>
		<c:if test="${loginUser.role == 'user'}">
			<a href="${pageContext.request.contextPath}/MyPageServlet"
				class="sidebar-item <c:if test="${param.menu == 'list'}">active</c:if>">マイページ</a>
			<a href="${pageContext.request.contextPath}/jsp/passwordChange.jsp"
				class="sidebar-item <c:if test="${param.menu == 'pass'}">active</c:if>">パスワード変更</a>
		</c:if>
	</div>


	<!-- 確認モーダル -->
	<div id="confirm-modal" class="modal-overlay">
		<div class="modal-box">
			<p id="modal-message">本当に実行しますか?</p>
			<div class="modal-buttons">
				<button id="modal-ok" class="btn btn-danger">OK</button>
				<button id="modal-cancel" class="btn btn-detail">キャンセル</button>
			</div>
		</div>
	</div>
