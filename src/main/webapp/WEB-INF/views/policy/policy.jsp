<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>살구 - 살기 좋은 지역구 </title>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/policy-env.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<section>
  <div class="hidden-background"></div>
  <img src="${pageContext.request.contextPath}/assets/img/logo.png"
       style="width: 10em; padding-top: 20px; padding-bottom: 10px">
  <div class="policy-wrapper">
    <div class="search-wrapper">
      <form action="${pageContext.request.contextPath}/policy/searchpolicy" method="get">
        <input type="text" id="search-id" name="policy-search-name" class="district-search"
               placeholder="관심있는 혜택을 검색해주세요 (검색 예시 : 청년)">
        <button class="search-btn">
          <i class="fas fa-search search-icon"></i>
        </button>
      </form>
    </div>

    <div class="search-policy-wrapper">
      <div class="like-info">
        <div class="searchresult">
          검색결과 : ${policyCnt}
        </div>
        <div class="my-like">
          <c:forEach items="${policyInfo}" var="policy">
            <div class="like-detail" onclick="goToPolicy('${policy.policyCode}')">
              <div class="location-img">
                <img src="${pageContext.request.contextPath}${policy.districtLogoPath}">
              </div>
              <div class="location-name">${policy.districtName}</div>
              <div class="policy-name">${policy.policyName}</div>
              <div class="policy-status">${policy.prdRpttSecd}</div>
              <!-- 로그인된 사라만 찜 버튼이 보임 -->
              <sec:authorize access="isAuthenticated()">
                <div class="scrapBtn" data-policy-code="${policy.policyCode}">
                  <i class="fa-regular fa-star"></i>
                </div>
              </sec:authorize>
            </div>
          </c:forEach>
        </div>
        <ul class="pagination">
          <li class="arrow"><a href="#" id="prev-page">&lt;</a></li>
          <li><a href="#" class="page-number selected">1</a></li>
          <li><a href="#" class="page-number">2</a></li>
          <li><a href="#" class="page-number">3</a></li>
          <li><a href="#" class="page-number">4</a></li>
          <li><a href="#" class="page-number">5</a></li>
          <li class="arrow"><a href="#" id="next-page">&gt;</a></li>
        </ul>
      </div>

    </div>
  </div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>

</body>
</html>