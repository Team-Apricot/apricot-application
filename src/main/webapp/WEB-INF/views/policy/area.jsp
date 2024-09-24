<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>살구 - 지역구 혜택 검색</title>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/area-env.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>

<section>
  <div class="content-header">
    <!-- 지역구 로고 -->
    <img src="${district.districtLogoPath}" alt="로고" class="region-logo" id="region-logo">

    <!-- 지역구 제목 및 슬로건 -->
    <div class="region-text">
      <h1 id="selected-region-title">서울시 ${district.districtName}</h1>
      <h3 id="selected-region-description">${district.districtSlogan}</h3>
    </div>
  </div>
  <div class="content">
    <div class="map">
      <object type="image/svg+xml"
              data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg"
              id="seoul-map">
      </object>
    </div>

    <div class="policy-container">
      <div class="details">
        <div class="category">
          <input type="button" value="전체" class="category-btn selected">
          <input type="button" value="일자리" class="category-btn" data-category="023010">
          <input type="button" value="주거" class="category-btn" data-category="023020">
          <input type="button" value="교육" class="category-btn" data-category="023030">
          <input type="button" value="복지" class="category-btn" data-category="023040">
          <input type="button" value="참여/권리" class="category-btn" data-category="023050">
        </div>

        <div id="grid" class="details2"></div>

        <ul class="pagination">
          <li class="arrow"><a href="#" id="prev-page">&lt;</a></li>
          <li class="arrow"><a href="#" id="next-page">&gt;</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
