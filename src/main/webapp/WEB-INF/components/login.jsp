<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<script src="${pageContext.request.contextPath}/js/member/login.js"></script>


<div class="login-modal">
    <div class="close">
    <button  class="close-btn" onclick="closeLoginModal()">&times;</button>
    </div>
    <div class="login-logo ">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">

    </div>

    <div class="modal-content">
        <form class="login-form">
            <label for="username">아이디</label>
            <input type="text" id="username"  placeholder="이메일을 입력하세요">

            <label for="password">비밀번호</label>
            <input type="password" id="password"  placeholder="비밀번호를 입력하세요">

            <button type="submit" class="login-btn">로그인</button>
            <button  type = "button"  onclick="gotoSignUp()" class="signup-btn">회원가입</button>

        </form>
    </div>

</div>