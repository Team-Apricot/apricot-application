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
	<div class="policy-container">
		<!-- 메인 컨텐츠: 지도와 상세 내용 -->
		<section class="content">
			<header class="content-header">
				<!-- 지역구 선택 시 로고와 제목/설명이 업데이트 됨 -->
				<img src="${pageContext.request.contextPath}/assets/img/jongno.png" alt="로고"
				     class="region-logo">
				<div class="region-text">
					<h1 id="selected-region-title">서울시</h1> <!-- 기본값은 서울시 -->
					<h3 id="selected-region-description">서울의 심장 다시 뛰는</h3> <!-- 기본 설명 텍스트 -->
				</div>
			</header>
			
			<!-- 서울 지도 SVG -->
			<div class="map">
				<object type="image/svg+xml"
				        data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg"
				        id="seoul-map"></object> <!-- SVG 지도 파일을 통해 지역구 선택 가능 -->
			</div>
			
			<!-- 카테고리 및 상세 정보 섹션 -->
			<div class="details">
				<!-- 카테고리 버튼들 (기본 선택 없음) -->
				<input type="button" value="일자리" class="category-btn">
				<input type="button" value="주거" class="category-btn">
				<input type="button" value="교육" class="category-btn">
				<input type="button" value="복지" class="category-btn">
				<input type="button" value="참여권리" class="category-btn">
				
				<!-- 이벤트 카드 그리드 -->
				<div id="grid" class="details2">
					<!-- 일자리 관련 카드 -->
<%--					TODO: 임시 연결--%>
					<a href="http://localhost:8080/policy/detail/R2024062124265" class="event-card job" categoryCode="일자리">
						<h3>청년 쿡 비즈니스센터 운영</h3>
						<p>식품제조업 분야 청년 스타트업 육성을 위해...</p>
						<div class="deadline-btn" data-status="deadline">신청마감</div>
					</a>
<%--					<div class="event-card job" categoryCode="일자리">--%>
<%--						<h3>청년 쿡 비즈니스센터 운영</h3>--%>
<%--						<p>식품제조업 분야 청년 스타트업 육성을 위해...</p>--%>
<%--						<div class="deadline-btn" data-status="deadline">신청마감</div>--%>
<%--					</div>--%>
					<div class="event-card job" categoryCode="일자리">
						<h3>대학생 아르바이트 사업</h3>
						<p>서울시 대학생이 방학기간 동안...</p>
						<div class="deadline-btn" data-status="always">상시</div>
					</div>
					
					<!-- 주거 관련 카드 -->
					<div class="event-card housing" categoryCode="주거">
						<h3>서울 주거지원 프로그램</h3>
						<p>청년과 신혼부부를 위한 주거 지원...</p>
						<div class="deadline-btn" data-status="progress">진행중</div>
					</div>
					
					<!-- 교육 관련 카드 -->
					<div class="event-card education" categoryCode="교육">
						<h3>코딩 부트캠프</h3>
						<p>서울시에서 제공하는 무료 코딩 부트캠프...</p>
						<div class="deadline-btn" data-status="progress">진행중</div>
					</div>
					
					<!-- 복지 관련 카드 -->
					<div class="event-card welfare" categoryCode="복지">
						<h3>청년 복지 카드</h3>
						<p>청년층에게 제공되는 복지 혜택...</p>
						<div class="deadline-btn" data-status="always">상시</div>
					</div>
					
					<!-- 참여권리 관련 카드 -->
					<div class="event-card rights" categoryCode="참여권리">
						<h3>청년 참여 예산 제안</h3>
						<p>청년들이 직접 참여할 수 있는 정책 제안 기회...</p>
						<div class="deadline-btn" data-status="progress">진행중</div>
					</div>
				</div>
				
				<!-- 페이지네이션 -->
				<ul class="pagination">
					<li class="arrow"><a href="#">&lt;</a></li>
					<li><a href="#" class="selected">1</a></li> <!-- 기본 선택된 1 페이지 -->
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
