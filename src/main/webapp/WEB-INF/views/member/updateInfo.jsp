<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/updateInfo.css">
<script src="${pageContext.request.contextPath}/js/member/myPage.js"></script>

<div class="updateInfo-modal">
    <div class="close">
        <button class="close-btn" onclick="closeUpdateInfoModal()">&times;</button>
    </div>
    <div class="logo ">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
    </div>

    <div class="modal-content">
        <!-- login form -->
        <form class="update-info-detail" action="${pageContext.request.contextPath}/member/login"
              method="post">
            <div class="update_nickname">
                <div class="nickname-input">
                    <label for="username">닉네임 수정</label>
                    <input type="text" id="username" name="username" placeholder="닉네임을 입력하세요">
                </div>
                <button class="update-nickname-btn"> 수정</button>
            </div>

            <div class="radio">
                <label for="category1">나이 </label>
                <div id="category1" class="category-list">
                    <input type="radio" name="age" id="age1" value="20대 미만"><label for="age1"> 20대
                    미만</label>
                    <input type="radio" name="age" id="age2" value="20대"><label for="age2">
                    20대</label>
                    <input type="radio" name="age" id="age3" value="30대"><label for="age3">
                    30대</label>
                    <input type="radio" name="age" id="age4" value="40대"><label for="age4">
                    40대</label>
                    <input type="radio" name="age" id="age5" value="50대 이상"><label for="age5"> 50대
                    이상</label>
                </div>
                <button class="update-detail-btn"> 수정</button>
            </div>
            <div class="radio">
                <label for="category2"> 직업 </label>
                <div id="category2" class="category-list">
                    <input type="radio" name="job" id="job1" value="무직"><label for="job1">
                    무직</label>
                    <input type="radio" name="job" id="job2" value="학생"><label for="job2">
                    학생</label>
                    <input type="radio" name="job" id="job3" value="직장인"><label for="job3">
                    직장인</label>
                </div>
                <button class="update-detail-btn"> 수정</button>
            </div>

        </form>

    </div>

</div>
