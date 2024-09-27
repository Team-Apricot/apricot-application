<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/policy/recommendation.css">

<div class="recommendation-modal" id="recommendation-modal" style="display: none">
  <div class="close">
    <button class="close-btn" onclick="closeRecommendModal()">&times;</button>
  </div>
  <div class="recommendation-modal-content">
    <h1 id="recommendation-title"></h1>
    <p class="provide-info"><i class="fas fa-info-circle"></i> <u>추천 정보는 회원님의 정보로 제공됩니다.</u></p>

    <h3 id="recommendation-details"></h3>
    <div id="reason-recommend">
      <div class="reason">
        <h2 id="reason1-title"></h2>
        <p class="provide-info"><i class="fas fa-search"></i> <u>회원님의 정보로 많은 혜택을 가진 지역구를
          분석합니다.</u></p>
        <div id="policy-cnt-results">
        </div>
      </div>
      <div class="reason">
        <h2 id="reason2-title"></h2>
        <p class="provide-info"><i class="fas fa-search"></i> <u>회원님의 정보로 좋은 혜택을 가진 지역구를
          분석합니다.</u></p>
        <div id="policy-score-results"></div>
      </div>
      <div class="reason">
        <h2 id="reason3-title"></h2>
        <p class="provide-info"><i class="fas fa-search"></i> <u>회원님의 정보로 비슷한 성향을 가진 회원들의 인기 있는 혜택을
          가진 지역구를
          분석합니다.</u></p>
        <div id="similar-group-results"></div>
      </div>
      <%--      <div id="result-salgu">--%>

      <%--      </div>--%>
    </div>
    <div class="chart-wrapper">
      <div id="chart1" class="chart--container"></div>
      <div id="chart2" class="chart--container"></div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/policy/recommendation.js"></script>