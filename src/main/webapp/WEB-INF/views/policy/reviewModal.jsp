<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/policy/reviewModal.css">
<link href="/assets/css/star.css" rel="stylesheet"/>
<!-- 별 css -->

<div class="review-modal">
  <div class="close">
    <button class="close-btn" onclick="closeReviewModal()">&times;</button>
  </div>
  <div class="review-modal-content">
    <form class="mb-3" name="myform" id="myform" method="post">
      <fieldset>
        <h3 class="text-bold">평점을 선택해주세요</h3>
        <input type="radio" name="reviewStar" value="5" id="rate1"><label
          for="rate1">★</label>
        <input type="radio" name="reviewStar" value="4" id="rate2"><label
          for="rate2">★</label>
        <input type="radio" name="reviewStar" value="3" id="rate3"><label
          for="rate3">★</label>
        <input type="radio" name="reviewStar" value="2" id="rate4"><label
          for="rate4">★</label>
        <input type="radio" name="reviewStar" value="1" id="rate5"><label
          for="rate5">★</label>
      </fieldset>
      <div>
      </div>
    </form>
  </div>
  <div class="btn">
    확인
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/policy/recommendation.js"></script>