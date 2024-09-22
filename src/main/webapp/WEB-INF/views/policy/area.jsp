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
            <h1 id="selected-region-title">서울시</h1>
            <h3 id="selected-region-description">서울의 심장 다시 뛰는 ${regionId}</h3>
        </div>
    </div>

    <div class="policy-container">
        <section class="content">
            <div class="map">
                <object type="image/svg+xml"
                        data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg"
                        id="seoul-map"></object>
            </div>

            <div class="details">
                <input type="button" value="전체" class="category-btn selected" data-category="전체">
                <input type="button" value="일자리" class="category-btn" data-category="일자리">
                <input type="button" value="주거" class="category-btn" data-category="주거">
                <input type="button" value="교육" class="category-btn" data-category="교육">
                <input type="button" value="복지" class="category-btn" data-category="복지">
                <input type="button" value="참여권리" class="category-btn" data-category="참여권리">

                <div id="grid" class="details2"></div>

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
        </section>
    </div>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
