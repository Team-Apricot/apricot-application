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
    <script>
        // JSP에서 전달받은 districtCode와 districtName을 JavaScript 변수로 설정
        const initialDistrictCode = "${districtCode}";
        const initialDistrictName = "${districtName}";
    </script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>

<section>
    <div class="content-header">
        <img src="${pageContext.request.contextPath}/assets/img/jongno.png" alt="로고" class="region-logo">
        <div class="region-text">
            <!-- 선택된 지역구 정보가 동적으로 업데이트됨 -->
            <h1 id="selected-region-title">서울시</h1>
            <h3 id="selected-region-description">서울의 심장 다시 뛰는 ${regionId}</h3>
        </div>
    </div>

    <div class="policy-container">
        <section class="content">
            <!-- 서울 지도 SVG -->
            <div class="map">
                <object type="image/svg+xml"
                        data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg"
                        id="seoul-map"></object>
            </div>

            <!-- 카테고리 및 상세 정보 섹션 -->
            <div class="details">
                <!-- 카테고리 버튼들 -->
                <input type="button" value="전체" class="category-btn selected">
                <input type="button" value="일자리" class="category-btn">
                <input type="button" value="주거" class="category-btn">
                <input type="button" value="교육" class="category-btn">
                <input type="button" value="복지" class="category-btn">
                <input type="button" value="참여권리" class="category-btn">

                <!-- 이벤트 카드 그리드 -->
                <div id="grid" class="details2">
                    <c:forEach var="policy" items="${policies}">
                        <div class="event-card">
                            <h3>${policy.policyName}</h3>
                            <p>${policy.policyContent}</p>
                            <div class="status">
                                <c:set var="policyEndDate" value="${policy.policyEndDate}" />
                                <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>" />
                                <c:choose>
                                    <c:when test="${policyEndDate == null}">
                                        <div class="deadline-btn" data-status="always">상시</div>
                                    </c:when>
                                    <c:when test="${policyEndDate < currentDate}">
                                        <div class="deadline-btn" data-status="deadline">신청마감</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="deadline-btn" data-status="progress">진행중</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- 페이지네이션 -->
                <ul class="pagination">
                    <li class="arrow"><a href="#">&lt;</a></li>
                    <li><a href="#" class="selected">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li class="arrow"><a href="#">&gt;</a></li>
                </ul>
            </div>
        </section>
    </div>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
