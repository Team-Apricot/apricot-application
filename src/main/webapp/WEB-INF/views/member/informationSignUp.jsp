<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/components/header.jsp" %>

<script src="${pageContext.request.contextPath}/js/member/signUp.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/signup.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> <!-- 구글 폰트 링크 추가 -->



<div class="signup-container">


    <div class="signup-content">
        <form class="signup-form">
            <div class="signup-logo ">
                <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
            </div>
            <div class="filter">
                <div>초기화 <i class="fa-solid fa-rotate-right"></i></div>
            </div>

            <!--나이 선택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category1','icon1')">나이* <i id="icon1" class="fa-solid fa-sort-down" ></i></div>
                <div id="category1" class="category-list">
                    <input type="radio" name="age" id="age1" value="10"><label for="age1"> 20대 미만</label>
                    <input type="radio" name="age" id="age2" value="10"><label for="age2"> 20대</label>
                    <input type="radio" name="age" id="age3" value="10"><label for="age3"> 30대</label>
                    <input type="radio" name="age" id="age4" value="10"><label for="age4"> 40대</label>
                    <input type="radio" name="age" id="age5" value="10"><label for="age5"> 50대 이상</label>
                </div>
                <div id="ageValid"></div>
            </div>

            <!--성별 선택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category2','icon2')">성별* <i id="icon2" class="fa-solid fa-sort-down" ></i></div>
                <div id="category2" class="category-list">
                    <input type="radio" name="gender" id="gender1" value="남자"><label for="gender1"> 남자</label>
                   <input type="radio" name="gender" id="gender2" value="여자"><label for="gender2"> 여자</label>
                </div>
                <div id="genderValid" class="error"></div>
            </div>

            <!--직업 선택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category3','icon3')">직업* <i id="icon3" class="fa-solid fa-sort-down" ></i></div>
                <div id="category3" class="category-list">
                    <input type="radio" name="job" id="job1" value="무직"><label for="job1"> 무직</label>
                    <input type="radio" name="job" id="job2" value="학생"><label for="job2"> 학생</label>
                    <input type="radio" name="job" id="job3" value="직장인"><label for="job3"> 직장인</label>
                </div>
                <div id="jobValid" class="error"></div>

            </div>

            <!--결혼여부 선택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category4','icon4')">결혼 여부* <i id="icon4" class="fa-solid fa-sort-down" ></i></div>
                <div id="category4" class="category-list">
                    <input type="radio" id="marriage1" name="marriage" value="기혼"> <label for="marriage1">기혼</label>
                    <input type="radio" id="marriage2" name="marriage" value="미혼"> <label for="marriage2">미혼</label>
                </div>
                <div id="marriageValid" class="error"></div>

            </div>

            <!--자녀수 선택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category5','icon5')">자녀 수 <i id="icon5" class="fa-solid fa-sort-down" ></i></div>
                <div id="category5" class="category-list">
                    <input id="son" type="range"  step="1" min ="0" max="2" value="0" list="sondata"><!--자녀수는 input rage -->
                    <datalist id="sondata">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2+</option>
                    </datalist>
                </div>
            </div>

            <!-- 헤택 -->
            <div class="form-group">
                <div class="category-header" onclick="toggleCategory('category6','icon6')">관심있는 혜택을 선택해주세요 (최대 3개) <i id="icon6" class="fa-solid fa-sort-down" ></i></div>
                <div id="category6" class="category-list">
                    <input type="checkbox" id="benefits1" name="benefits" value="일자리" onclick='getCheckedCnt(this)'> <label for="benefits1"> <span class="order-number"></span> 일자리 </label>
                    <input type="checkbox" id="benefits2" name="benefits" value="주거" onclick='getCheckedCnt(this)'> <label for="benefits2"> <span class="order-number"></span>주거 </label>
                    <input type="checkbox" id="benefits3" name="benefits" value="교육" onclick='getCheckedCnt(this)'> <label for="benefits3"> <span class="order-number"></span>교육 </label>
                    <input type="checkbox" id="benefits4" name="benefits" value="복지" onclick='getCheckedCnt(this)'> <label for="benefits4"><span class="order-number"></span> 복지 </label>
                    <input type="checkbox" id="benefits5" name="benefits" value="참여/권리" onclick='getCheckedCnt(this)'><label for="benefits5"><span class="order-number"></span> 참여/권리 </label>
                    <input type="checkbox" id="benefits6" name="benefits" value="의료 시설" onclick='getCheckedCnt(this)'> <label for="benefits6"><span class="order-number"></span> 의료 시설 </label>
                    <input type="checkbox" id="benefits7" name="benefits" value="문화 시설" onclick='getCheckedCnt(this)'> <label for="benefits7"><span class="order-number"></span> 문화 시설 </label>
                    <input type="checkbox" id="benefits8" name="benefits" value="체육 시설" onclick='getCheckedCnt(this)'> <label for="benefits8"> <span class="order-number"></span>체육 시설 </label>
                </div>
                <div id="benefitsValid" class="error"></div>
            </div>
            <button  type = "button" onclick="finishSignUp()" class="signup-btn">완료</button>
            <div id="buttonCheck"></div>
        </form>
    </div>
</div>
