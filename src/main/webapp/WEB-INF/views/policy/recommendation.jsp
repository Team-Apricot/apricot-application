<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/policy/recommendation.css">

<div class="recommendation-modal">
  <div class="close">
    <button class="close-btn" onclick="closeRecommendModal()">&times;</button>
  </div>
  <div class="recommendation-modal-content">
<%--    <form class="recommendation-form" action="${pageContext.request.contextPath}/api/v1/recommendation" method="get">--%>
    <p>${memberInfo.nickName}</p>

      <div class="chart-wrapper">
            <div id="chart1" class="chart--container"></div>
            <div id="chart2" class="chart--container"></div>
      </div>
<%--    </form>--%>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/policy/recommendation.js"></script>