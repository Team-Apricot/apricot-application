<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/index-main-env.jsp"/>

<section>
	<video class="background-video" autoplay muted loop>
		<source src="${pageContext.request.contextPath}/assets/video/index-page-background.mp4" type="video/mp4"> <!-- AI로 만든 영상-->
<%--		<source src="${pageContext.request.contextPath}/assets/video/cloud.mp4" type="video/mp4"> <!-- 현실 구름 영상 -->--%>
<%--		<source src="${pageContext.request.contextPath}/assets/video/seoul.mp4" type="video/mp4"> <!-- 현실 구름 영상 -->--%>
	</video>
	<div class="overlay"></div>
	<div class="search-container">
		<div class="blur-background">
			<img src="${pageContext.request.contextPath}/assets/img/logo.png"
			     style="width: 200px; padding-top: 20px; padding-bottom: 10px">
			<div class="search-wrapper">
				<input type="text" id="search-id" name="search-name" class="region-search"
				       placeholder="찾고 싶은 지역구를 검색 해보세요(검색 예시: 강서구)">
				<button class="search-btn">
					<i class="fas fa-search search-icon"></i>
				</button>
			</div>
			<div id="myChart"></div>
		</div>
	</div>
	<!-- 챗봇 오버레이 -->
	<div class="chatbot-overlay">
		<i class="fas fa-robot chatbot-icon"></i>
		<div class="chatbot-text">살구에게 지역구 추천 받기</div>
	</div>
</section>
