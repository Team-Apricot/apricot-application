<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/area/area.css">
<script src="${pageContext.request.contextPath}/js/area/area.js"></script>
<%@ include file="/WEB-INF/components/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울시 지역구 이벤트</title>
</head>
<body>
    <div class="container">
        <!-- 메인 컨텐츠: 지도와 상세 내용 -->
        <section class="content">
            <header class="content-header">
                <img src="${pageContext.request.contextPath}/assets/img/jongno.png" alt="로고" class="region-logo">
                <div class="region-text">
                    <h1 id="selected-region-title">서울시</h1>
                    <h3 id="selected-region-description">서울의 심장 다시 뛰는</h3>
                </div>
            </header>
            <!-- 서울 지도 SVG -->
            <div class="map">
                <object type="image/svg+xml" data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg" id="seoul-map"></object>
            </div>

            <!-- 카테고리 및 상세 정보 섹션 -->
            <div class="details">
                <!-- 카테고리 버튼들 -->
                <input type="button" value="일자리" class="selected">
                <input type="button" value="주거">
                <input type="button" value="교육">
                <input type="button" value="복지">
                <input type="button" value="참여권리">

                <!-- 이벤트 카드 그리드 -->
                <div id="grid" class="details2">
                    <div>
                        <h3>청년 쿡 비즈니스센터 운영</h3>
                        <p>식품제조업 분야 청년 스타트업 육성을 위해...</p>
                        <button class="deadline-btn" data-status="신청마감">신청마감</button>
                    </div>
                    <div>
                        <h3>대학생 아르바이트 사업</h3>
                        <p>서울시 대학생이 방학기간 동안...</p>
                        <button class="deadline-btn" data-status="상시">상시</button>
                    </div>
                    <div>
                        <h3>종로 청년 창업센터</h3>
                        <p>창업 초기의 청년 기업 지원...</p>
                        <button class="deadline-btn" data-status="진행중">진행중</button>
                    </div>
                    <div>
                        <h3>청년 쿡 비즈니스센터 운영</h3>
                        <p>식품제조업 분야 청년 스타트업 육성을 위해...</p>
                        <button class="deadline-btn" data-status="신청마감">신청마감</button>
                    </div>
                    <div>
                        <h3>대학생 아르바이트 사업</h3>
                        <p>서울시 대학생이 방학기간 동안...</p>
                        <button class="deadline-btn" data-status="상시">상시</button>
                    </div>
                    <div>
                        <h3>종로 청년 창업센터</h3>
                        <p>창업 초기의 청년 기업 지원...</p>
                        <button class="deadline-btn" data-status="진행중">진행중</button>
                    </div>
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

<%@ include file="/WEB-INF/components/footer.jsp" %>
