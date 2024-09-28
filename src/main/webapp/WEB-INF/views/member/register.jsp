<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>살구 - 회원 가입</title>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/register-env.jsp"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>

<div class="signup-container">
    <div class="signup-content">
        <div class="signup-logo ">
            <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
        </div>

        <!-- 회원가입 폼 -->
        <form class="signup-form">
            <label for="email">이메일 아이디</label>
            <div class="input-button-container">
                <input type="text" id="email" placeholder="이메일을 입력해주세요.">
                <button type="button" id="sendAuthCodeBtn" class="auth-btn">이메일 인증</button>
            </div>
            <div id="emailValid"></div> <!-- 이메일 유효성 검사 결과 표시 -->

            <label for="authCode">인증번호</label>
            <div class="input-button-container">
                <input type="text" id="authCode" placeholder="인증번호를 입력해주세요.">
                <button type="button" id="verifyAuthCodeBtn" class="auth-btn">인증번호 확인</button>
            </div>
            <div id="authCodeTimer" style="color:red;"></div> <!-- 인증번호 유효 시간 표시 -->
            <div id="authCodeValid"></div> <!-- 인증번호 유효성 검사 결과 표시 -->

            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" placeholder="닉네임을 입력해주세요.">
            <div id="nicknameValid"></div>

            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" placeholder="비밀번호를 입력해주세요.">
            <div id="pwdValid"></div>

            <label for="pwdChk">비밀번호 확인</label>
            <input type="password" id="pwdChk" placeholder="다시 한번 비밀번호를 입력해주세요.">
            <div id="pwdChkValid"></div>

            <button type="button" onclick="gotoSecondSignUp()" class="signup-btn">다음</button>
            <div id="buttonCheck"></div>
        </form>
    </div>
</div>
</body>
</html>
