<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>살구 - 살기 좋은 지역구 </title>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/policy-env.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<section>
  <div class="hidden-background"></div>
  <img src="${pageContext.request.contextPath}/assets/img/logo.png"
       style="width: 10em; padding-top: 20px; padding-bottom: 10px">
  <div class="policy-wrapper">
    <div class="search-wrapper">
      <form action="${pageContext.request.contextPath}/policy/searchpolicy" method="get">
        <input type="text" id="search-id" name="policy-search-name" class="district-search"
               placeholder="관심있는 혜택을 검색해주세요 (검색 예시 : 청년)">
        <button class="search-btn">
          <i class="fas fa-search search-icon"></i>
        </button>
      </form>
    </div>

    <div class="search-policy-wrapper">
      <div class="search-info">
        <div class="searchresult">
          검색결과 : ${policyCnt}
        </div>
        <div class="search-detail">
          <c:forEach items="${policyInfo}" var="policy">
            <div class="detail" onclick="goToPolicy('${policy.policyCode}')">
              <div class="location-img">
                <img src="${pageContext.request.contextPath}${policy.districtLogoPath}">
              </div>
              <div class="location-name">${policy.districtName}</div>
              <div class="policy-name">${policy.policyName}</div>
              <div class="policy-status">${policy.prdRpttSecd}</div>
              <!-- 로그인된 사라만 찜 버튼이 보임 -->
              <sec:authorize access="isAuthenticated()">
                <div class="scrapBtn" data-policy-code="${policy.policyCode}">
                  <i class="fa-regular fa-star"></i>
                </div>
              </sec:authorize>
            </div>
          </c:forEach>
        </div>

        <%--        <ul class="pagination">--%>
        <%--          <c:if test="${currentPage > 1}">--%>
        <%--            <li class="arrow"><a--%>
        <%--                href="?policy-search-name=${param['policy-search-name']}&page=${currentPage - 1}&size=10"--%>
        <%--                id="prev-page">&lt;</a></li>--%>
        <%--          </c:if>--%>

        <%--          <c:if test="${totalPages > 5}">--%>
        <%--            <c:if test="${currentPage <= 3}">--%>
        <%--              <c:forEach begin="1" end="5" var="i">--%>
        <%--                <li>--%>
        <%--                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"--%>
        <%--                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>--%>
        <%--                </li>--%>
        <%--              </c:forEach>--%>
        <%--            </c:if>--%>

        <%--            <c:if test="${currentPage > 3 && currentPage <= totalPages - 2}">--%>
        <%--              <c:forEach begin="${currentPage - 2}" end="${currentPage + 2}" var="i">--%>
        <%--                <li>--%>
        <%--                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"--%>
        <%--                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>--%>
        <%--                </li>--%>
        <%--              </c:forEach>--%>
        <%--            </c:if>--%>

        <%--            <c:if test="${currentPage > totalPages - 2}">--%>
        <%--              <c:forEach begin="${totalPages - 4}" end="${totalPages}" var="i">--%>
        <%--                <li>--%>
        <%--                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"--%>
        <%--                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>--%>
        <%--                </li>--%>
        <%--              </c:forEach>--%>
        <%--            </c:if>--%>
        <%--          </c:if>--%>

        <%--          <c:if test="${currentPage < totalPages}">--%>
        <%--            <li class="arrow"><a--%>
        <%--                href="?policy-search-name=${param['policy-search-name']}&page=${currentPage + 1}&size=10"--%>
        <%--                id="next-page">&gt;</a></li>--%>
        <%--          </c:if>--%>
        <%--        </ul>--%>

        <ul class="pagination">
          <c:if test="${currentPage > 1}">
            <li class="arrow"><a
                href="?policy-search-name=${param['policy-search-name']}&page=${currentPage - 1}&size=10"
                id="prev-page">&lt;</a></li>
          </c:if>

          <c:if test="${totalPages <= 5}">
            <c:forEach begin="1" end="${totalPages}" var="i">
              <li>
                <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"
                   class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>
              </li>
            </c:forEach>
          </c:if>

          <c:if test="${totalPages > 5}">
            <c:if test="${currentPage <= 3}">
              <c:forEach begin="1" end="5" var="i">
                <li>
                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"
                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>
                </li>
              </c:forEach>
            </c:if>

            <c:if test="${currentPage > 3 && currentPage <= totalPages - 2}">
              <c:forEach begin="${currentPage - 2}" end="${currentPage + 2}" var="i">
                <li>
                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"
                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>
                </li>
              </c:forEach>
            </c:if>

            <c:if test="${currentPage > totalPages - 2}">
              <c:forEach begin="${totalPages - 4}" end="${totalPages}" var="i">
                <li>
                  <a href="?policy-search-name=${param['policy-search-name']}&page=${i}&size=10"
                     class="page-number ${i == currentPage ? 'selected' : ''}">${i}</a>
                </li>
              </c:forEach>
            </c:if>
          </c:if>

          <c:if test="${currentPage < totalPages}">
            <li class="arrow"><a
                href="?policy-search-name=${param['policy-search-name']}&page=${currentPage + 1}&size=10"
                id="next-page">&gt;</a></li>
          </c:if>
        </ul>

      </div>
    </div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>

</body>
</html>