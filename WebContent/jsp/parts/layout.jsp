<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ヘッダー -->
<div class="header">
	<span class="header-title">従業員管理システム</span>
	<div class="header-right">
		<span class="header-user">ようこそ、${loginUser.name} さん</span> <a
			href="${pageContext.request.contextPath}/LogoutServlet"
			class="logout-btn">ログアウト</a>
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
			<a href="#"
				class="sidebar-item <c:if test="${param.menu == 'pass'}">active</c:if>">パスワード変更</a>
		</c:if>
		<c:if test="${loginUser.role == 'user'}">
			<a href="${pageContext.request.contextPath}/MyPageServlet"
				class="sidebar-item <c:if test="${param.menu == 'list'}">active</c:if>">マイページ</a>
			<a href="#"
				class="sidebar-item <c:if test="${param.menu == 'pass'}">active</c:if>">パスワード変更</a>
		</c:if>
	</div>