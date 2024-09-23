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

        // 지역구별 이미지 및 설명을 동적으로 저장
        const regionImages = {
            '01': 'Jongnogu.png',
            '02': 'Junggu.png',
            '03': 'Yongsangu.png',
            '04': 'Seongdonggu.png',
            '05': 'Gwangjingu.png',
            '06': 'Dongdaemungu.png',
            '07': 'Jungnanggu.png',
            '08': 'Seongbukgu.png',
            '09': 'Gangbukgu.png',
            '10': 'Dobonggu.png',
            '11': 'Nowongu.png',
            '12': 'Eunpyeonggu.png',
            '13': 'Seodaemungu.png',
            '14': 'Mapogu.png',
            '15': 'Yangcheongu.png',
            '16': 'Gangseogu.png',
            '17': 'Gurogu.png',
            '18': 'Geumcheongu.png',
            '19': 'Yeongdeungpogu.png',
            '20': 'Dongjakgu.png',
            '21': 'Gwanakgu.png',
            '22': 'Seochogu.png',
            '23': 'Gangnamgu.png',
            '24': 'Songpagu.png',
            '25': 'Gangdonggu.png'
        };

        const regionDescriptions = {
            '01': '서울의 역사가 숨 쉬는 종로구',
            '02': '서울의 중심, 중구',
            '03': '국제 문화와 만남의 용산구',
            '04': '전통과 현대가 어우러진 성동구',
            '05': '한강변의 아름다운 광진구',
            '06': '역사와 미래가 공존하는 동대문구',
            '07': '쾌적한 주거환경을 자랑하는 중랑구',
            '08': '교육과 문화가 함께하는 성북구',
            '09': '녹색도시를 꿈꾸는 강북구',
            '10': '평화로운 주거지역 도봉구',
            '11': '활기찬 교육도시 노원구',
            '12': '자연과 조화로운 은평구',
            '13': '문화와 예술의 중심 서대문구',
            '14': '젊음과 활기가 넘치는 마포구',
            '15': '편리한 생활환경의 양천구',
            '16': '풍부한 자연환경의 강서구',
            '17': '산업과 문화가 공존하는 구로구',
            '18': '첨단산업의 요람 금천구',
            '19': '서울의 관문, 영등포구',
            '20': '한강이 흐르는 동작구',
            '21': '활기찬 젊음의 거리 관악구',
            '22': '부유하고 쾌적한 서초구',
            '23': '서울의 번영을 상징하는 강남구',
            '24': '다양한 문화와 전통이 어우러진 송파구',
            '25': '맑은 공기와 함께하는 강동구'
        };

    </script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>

<section>
    <div class="content-header">
        <!-- 이미지 파일을 동적으로 변경 -->
        <img src="${pageContext.request.contextPath}/assets/img/region/${regionImages[initialDistrictCode]}" alt="로고" class="region-logo" id="region-logo">

        <!-- 지역구 제목 및 설명을 동적으로 변경 -->
        <div class="region-text">
            <!-- <h1 id="selected-region-title">서울시</h1> -->
            <h1 id="selected-region-title">${initialDistrictName}</h1>
            <!-- <h3 id="selected-region-description">서울의 심장 다시 뛰는 ${regionId}</h3> -->
            <h3 id="selected-region-description">${regionDescriptions[initialDistrictCode]}</h3>
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

                <!-- 이벤트 카드 그리드 -->
                <div id="grid" class="details2">
                    <!-- 이벤트 카드 동적 출력 -->
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
