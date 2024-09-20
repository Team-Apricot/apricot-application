<%-- TODO: 소개 페이지 필요시 사용(일정 보고 진행 예정) --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/index-intro-env.jsp"/>

<section>
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
				<button class="carousel-control-prev" type="button"
				        data-bs-target="#carouselExampleCaptions"
				        data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
				        data-bs-target="#carouselExampleCaptions"
				        data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
	</div>
</section>