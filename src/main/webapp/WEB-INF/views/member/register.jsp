<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/components/header.jsp" %>

<script src="${pageContext.request.contextPath}/js/member/register.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/register.css">

<div class="signup-container">
	<div class="signup-content">
		<div class="signup-logo ">
			<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
		</div>
		
		<form class="signup-form">
			<label for="username">아이디</label>
			<input type="text" id="username" placeholder="이메일을 입력해주세요.">
			<div id="usernameValid"></div>
			
			<label for="nickname">닉네임</label>
			<input type="text" id="nickname" placeholder="닉네임을 입력해주세요.">
			<div id="nicknameValid"></div>
			
			
			<label for="password">비밀번호</label>
			<input type="password" id="password" placeholder="비밀번호를 입력해주세요.">
			<div id="passwordValid"></div>
			
			<label for="passwordCheck">비밀번호확인</label>
			<input type="password" id="passwordCheck" placeholder="다시 한번 비밀번호를 입력해주세요.">
			<div id="passwordCheckValid"></div>
			
			<button type="button" onclick="gotoSecondSignUp()" class="signup-btn">가입 후 상세 정보 입력하러 가기
			</button>
			<div id="buttonCheck"></div>
		</form>
	</div>
</div>
