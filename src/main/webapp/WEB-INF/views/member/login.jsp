<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">

<div class="login-modal">
	<div class="close">
		<button class="close-btn" onclick="closeLoginModal()">&times;</button>
	</div>
	<div class="login-logo ">
		<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
	</div>
	
	<div class="login-modal-content">
		<div id="loginErrorMessage" class="login-error-msg" style="display: none; color: red; text-align: center;"></div>
		<!-- login form -->
		<form class="login-form" action="${pageContext.request.contextPath}/api/v1/login" method="post">
		<label for="username">이메일 아이디</label>
			<input class="login-input" id="username" name="username" type="email" placeholder="이메일을 입력하세요" required>
			
			<label for="password">비밀번호</label>
			<input class="login-input" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요">
			
			<button type="submit" class="login-btn">로그인</button>
		</form>
		
		<!-- signup form -->
		<form class="signup-form" action="${pageContext.request.contextPath}/member/register" method="get">
			<button type="button" onclick="gotoSignUp()" class="signup-btn">회원가입</button>
		</form>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/member/login.js"></script>