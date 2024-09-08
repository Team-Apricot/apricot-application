<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/components/header.jsp" %>

<!-- 광고 배너 섹션 -->
<!-- 광고 배너 섹션 -->
<div class="banner-area">
    <img src="${pageContext.request.contextPath}/assets/img/banner_1.png" alt="광고 배너">
    <div class="banner-text">
        <p>살구는</p>
        <p>내가 살기 좋은 지역을 추천해줘요!</p>
    </div>
</div>

<div class="container">
    <div class="left-side">
        <!-- 검색 섹션 -->
        <div class="search-area">
            <h2>찾고 싶은 지역구를 검색 해보세요</h2>
            <div class="search-container">
                <input type="text" placeholder="검색 예시: 강서구">
                <i class="fas fa-search search-icon"></i> <!-- 돋보기 아이콘 추가 -->
            </div>
        </div>

        <!-- 혜택이 많은 지역 리스트 -->
        <div class="top-areas">
            <h2>현재 혜택이 많은 지역 Top 3</h2>
            <div class="areas-list">
                <div class="area-item">
                    <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="강남구">
                    <div class="text">
                        <p class="region-name">강남구</p>
                        <p class="region-tag">#역세권 1위!</p>
                    </div>
                </div>
                <div class="area-item">
                    <img src="${pageContext.request.contextPath}/assets/img/gangseo.png" alt="강서구">
                    <div class="text">
                        <p class="region-name">강서구</p>
                        <p class="region-tag">#거주권 1위!</p>
                    </div>
                </div>
                <div class="area-item">
                    <img src="${pageContext.request.contextPath}/assets/img/jongno.png" alt="종로구">
                    <div class="text">
                        <p class="region-name">종로구</p>
                        <p class="region-tag">#병세권 1위!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="right-side">
<%@ include file="/WEB-INF/components/wordcloud.jsp" %>
    </div>
</div>
<%@ include file="/WEB-INF/components/footer.jsp" %>
