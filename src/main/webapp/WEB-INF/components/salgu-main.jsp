<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/index-main-env.jsp"/>
<meta name="context-path" content="${pageContext.request.contextPath}"/>
<section>
  <video class="background-video" autoplay muted loop>
    <source src="${pageContext.request.contextPath}/assets/video/index-page-background.mp4"
            type="video/mp4">
  </video>
  <div class="overlay"></div>
  <div class="hidden-background"></div>
  <div class="search-container">
    <div class="blur-background">
      <img src="${pageContext.request.contextPath}/assets/img/logo.png"
           style="width: 10em; padding-top: 20px; padding-bottom: 10px">
      <div class="search-wrapper">
        <form action="${pageContext.request.contextPath}/policy/searchpolicy" method="get">
          <input type="text" id="search-id" name="policy-search-name" class="district-search"
                 placeholder="관심있는 혜택을 검색해주세요 (검색 예시 : 청년) ">
          <button class="search-btn">
            <i class="fas fa-search search-icon"></i>
          </button>
        </form>
      </div>
      <div id="rank-policy-districts-container">
        <span id="rank-policy-title">📈 지역구 혜택 순위: </span>
        <span id="rank-policy-districts" class="rank-policy-districts"></span>
      </div>
      <div id="myChart"></div>
    </div>
  </div>
  <!-- 챗봇 오버레이 -->
  <div class="chatbot-overlay" onclick="openRecommendModal()">
    <i class="fas fa-robot chatbot-icon"></i>
    <div class="chatbot-text">살구에게 지역구 추천 받기</div>
  </div>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/policy/recommendation.jsp"/>
</section>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
