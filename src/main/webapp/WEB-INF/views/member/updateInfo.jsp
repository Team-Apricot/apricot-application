<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>살구 - MyPage</title>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/myPage-env.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<div class="updateInfo-modal">
  <div class="logo ">
    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
  </div>
  <div class="modal-content">
    <div class="modal-left">

      <div class="radio">
        <%--                <div class="nickname-input">--%>
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/person.png">
          <label for="updateNick">닉네임 수정</label></div>
        <input type="text" id="updateNick" placeholder="닉네임을 입력하세요">
        <%--                </div>--%>
        <button class="update-detail-btn" onclick="updateNickname(${memberId})"> 수정
        </button>
      </div>

      <div class="radio">
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/age.png" alt="살구 Logo">
          <label for="category1">나이 </label>
        </div>

        <div id="category1" class="category-list">
          <input type="radio" name="age" id="age1" value="20대 미만"><label for="age1">20대
          미만</label>
          <input type="radio" name="age" id="age2" value="20대"><label
            for="age2">20대</label>
          <input type="radio" name="age" id="age3" value="30대"><label
            for="age3">30대</label>
          <input type="radio" name="age" id="age4" value="40대"><label
            for="age4">40대</label>
          <input type="radio" name="age" id="age5" value="50대 이상"><label for="age5"> 50대
          이상</label>
        </div>
        <button class="update-detail-btn" onclick="updateAgeRange(${memberId})"> 수정</button>
      </div>

      <div class="radio">
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/job.png" alt="살구 Logo">
          <label for="category2">직업</label>
        </div>
        <div id="category2" class="category-list">
          <input type="radio" name="job" id="job1" value="무직"><label for="job1">무직</label>
          <input type="radio" name="job" id="job2" value="학생"><label for="job2">학생</label>
          <input type="radio" name="job" id="job3" value="직장인"><label
            for="job3">직장인</label>
        </div>
        <button class="update-detail-btn" onclick="updateCareer(${memberId})">수정</button>
      </div>
    </div>
    <div class="modal-right">
      <div class="radio">
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/marriage.png" alt="살구 Logo">
          <label for="category3">결혼여부</label>
        </div>
        <div id="category3" class="category-list">
          <input type="radio" id="marriage1" name="marriage" value="기혼"><label
            for="marriage1">기혼</label>
          <input type="radio" id="marriage2" name="marriage" value="미혼"><label
            for="marriage2">미혼</label>
        </div>
        <button class="update-detail-btn" onclick="updateMarriedStatus(${memberId})">수정</button>
      </div>

      <div class="radio">
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/baby.png" alt="살구 Logo">
          <label for="category4">자녀수</label>
        </div>
        <div id="category4" class="category-list">
          <input type="radio" id="numchild1" name="numchild" value=0><label
            for="numchild1">0</label>
          <input type="radio" id="numchild2" name="numchild" value=1><label
            for="numchild2">1</label>
          <input type="radio" id="numchild3" name="numchild" value=2><label
            for="numchild3">2+</label>
        </div>
        <button class="update-detail-btn" onclick="updateNumChild(${memberId})">수정</button>
      </div>

      <div class="radio">
        <div class="update-icon-label">
          <img src="${pageContext.request.contextPath}/assets/img/gender.png" alt="살구 Logo">
          <label for="category5">성별</label>
        </div>
        <div id="category5" class="category-list">
          <input type="radio" name="gender" id="gender1" value="남자"><label for="gender1">
          남자</label>
          <input type="radio" name="gender" id="gender2" value="여자"><label for="gender2">
          여자</label>
        </div>
        <button class="update-detail-btn" onclick="updateGender(${memberId})">수정</button>
      </div>
    </div>
  </div>
  <div class="modal-bottom">
    <div class="radio">
      <div class="category-header" onclick="">
        <img src="${pageContext.request.contextPath}/assets/img/interest.png" alt="살구 Logo">
        관심사 수정
        <%--        <i id="icon6" class="fa-solid fa-sort-down"></i>--%>
      </div>
      <div id="category6" class="category-list">
        <input type="checkbox" id="023010" name="benefits" value="일자리"
               onclick='getCheckedCnt(this)'>
        <label for="023010"><span class="order-number"></span>일자리</label>

        <input type="checkbox" id="023020" name="benefits" value="주거"
               onclick='getCheckedCnt(this)'>
        <label for="023020"><span class="order-number"></span>주거</label>

        <input type="checkbox" id="023030" name="benefits" value="교육"
               onclick='getCheckedCnt(this)'>
        <label for="023030"><span class="order-number"></span>교육</label>

        <input type="checkbox" id="023040" name="benefits" value="복지"
               onclick='getCheckedCnt(this)'>
        <label for="023040"><span class="order-number"></span>복지</label>

        <input type="checkbox" id="023050" name="benefits" value="참여/권리"
               onclick='getCheckedCnt(this)'>
        <label for="023050"><span class="order-number"></span>참여/권리</label>

        <%--        TODO: COMMING SOON --%>
        <%--        <input type="checkbox" id="023060" name="benefits" value="의료 시설"--%>
        <%--               onclick='getCheckedCnt(this)'>--%>
        <%--        <label for="023060"><span class="order-number"></span>의료 시설</label>--%>

        <%--        <input type="checkbox" id="023070" name="benefits" value="문화 시설"--%>
        <%--               onclick='getCheckedCnt(this)'>--%>
        <%--        <label for="023070"><span class="order-number"></span> 문화 시설</label>--%>

        <%--        <input type="checkbox" id="023080" name="benefits" value="체육 시설"--%>
        <%--               onclick='getCheckedCnt(this)'>--%>
        <%--        <label for="023080"><span class="order-number"></span>체육 시설</label>--%>
      </div>
      <button class="update-detail-btn" onclick="updateInterest()">수정</button>

      <div id="benefitsValid" class="error"></div>
    </div>
  </div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
