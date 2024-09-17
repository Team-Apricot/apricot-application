<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>살구 - 살기 좋은 지역구</title>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/index-env.jsp"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<div class="hidden-background"></div>

<div class="mainContent">
	<section id="carouselSection">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
				        class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
				        aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
				        aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/assets/img/banner_1.png"
					     class="d-block w-100"
					     alt="...">
					<div class="carousel-caption custom-carousel-caption text-left text-orange">
						<h5>혜택을 찾나요?</h5>
						<p>원하는 지역구 혜택을 찾아요!</p>
					</div>
				</div>
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/assets/img/banner_2.png"
					     class="d-block w-100"
					     alt="...">
					<div class="carousel-caption custom-carousel-caption text-right">
						<!-- d-none d-md-block -->
						<h5>살구는</h5>
						<p>내가 살기 좋은 지역을 추천해줘요!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/assets/img/banner_3.png"
					     class="d-block w-100"
					     alt="...">
					<div class="carousel-caption custom-carousel-caption text-left text-orange">
						<h5>문화 생활</h5>
						<p>살구로 많은 지역을 찾아 봐요!</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
			        data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
			        data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>
	
	<div class="index-container">
		<div class="index-left-side">
			<!-- 검색 섹션 -->
			<div class="search-area">
				<h2>찾고 싶은 지역구를 검색 해보세요</h2>
				<div class="search-container">
					<input type="text" placeholder="검색 예시: 강서구">
					<button class="search-btn">
						<i class="fas fa-search search-icon"></i> <!-- 돋보기 아이콘 추가 -->
					</button>
				</div>
			</div>
			<!-- 혜택이 많은 지역 리스트 -->
			<div class="top-areas">
				<h2>살구가 추천하는 지역이에요!</h2>
				<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/rc-region.jsp"/>
			</div>
		</div>
		
		<!--워드 클라우드 -->
		<div class="index-right-side">
			<div id="myChart"></div>
		</div>
	</div>
</div>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
