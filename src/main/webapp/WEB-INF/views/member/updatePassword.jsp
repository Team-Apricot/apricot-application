<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/updatePassword.css">
<script src="${pageContext.request.contextPath}/js/member/myPage.js"></script>

<div class="updatePassword-modal">
    <div class="close">
        <button class="close-btn" onclick="closeUpdatePwModal()">&times;</button>
    </div>
    <div class="logo ">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
    </div>

    <div class="modal-content">
        <!-- login form -->
        <form class="update-password-form" action="${pageContext.request.contextPath}/member/login" method="post">
            <label for="username">현재 비밀번호</label>
            <input type="text" id="username" name="username" placeholder="현재 비밀번호">

            <label for="password">새 비밀번호 </label>
            <input type="password" id="password" name="password" placeholder="새 비밀번호">

            <label for="passwordCheck">새 비밀번호 확인 </label>
            <input type="password" id="passwordCheck" name="password" placeholder="새 비밀번호 확인">

            <button type="submit" class="updatePw-btn">비밀번호 수정</button>
        </form>
    </div>

</div>
