<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>정책 지원 페이지</title>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/detail-env.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<div class="hidden-background"></div>
<div class="layout">
  <div class="navmenu-wrapper">
    <nav class="navmenu">
      <ul>
        <li><a href="#section1" id="navitem1" class="active"><img src="/assets/img/mascot.png" width="40"><span>한 눈에 보는 정책 요약</span></a>
        </li>
        <li><a href="#section2" id="navitem2"><img src="/assets/img/mascot.png" width="40"><span>신청자격</span></a>
        </li>
        <li><a href="#section3" id="navitem3"><img src="/assets/img/mascot.png" width="40"><span>신청방법</span></a>
        </li>
        <li><a href="#section4" id="navitem4"><img src="/assets/img/mascot.png" width="40"><span>기타</span></a></li>
      </ul>
    </nav>
  </div>
  <div class="policy-detail-page">
    <div class="policy-header">
      <sec:authorize access="isAuthenticated()">
        <div class="icon">
          <label class="container">
            <input type="checkbox"
                   id="scrapCheck"
                <c:if test="${not empty scrapInfo}">
                  <c:forEach items="${scrapInfo}" var="scrap">
                    <c:if test="${scrap.policyCode == policyDetails.policyCode}">
                      checked
                    </c:if>
                  </c:forEach>
                </c:if>
            />
            <div class="check" data-policy-code="${policyDetails.policyCode}"
                <c:if test="${not empty scrapInfo}">
                  <c:forEach items="${scrapInfo}" var="scrap">
                    <c:if test="${scrap.policyCode == policyDetails.policyCode}">
                      data-scrap-id="${scrap.scrapId}"
                    </c:if>
                  </c:forEach>
                </c:if>
            >
              <svg viewBox="0 0 256 256">
                <rect fill="none" height="256" width="256"></rect>
                <path
                    d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z"
                    stroke-width="20px"
                    stroke="#000"
                    fill="none"
                ></path>
              </svg>
            </div>
          </label>
        </div>
      </sec:authorize>
      <div class="policy-title">
        <h2>${policyDetails.policyName !="null" && !policyDetails.policyName.isEmpty()? policyDetails.policyName:"❌"}</h2>
        <h3>${policyDetails.policyContent !="null" && !policyDetails.policyContent.isEmpty()? policyDetails.policyContent:"❌"}</h3>
      </div>
      <div class="button-link">
      </div>
    </div>

    <div class="policy-table-content" id="section1">
      <div class="policy-table-header">
        <h3>한 눈에 보는 정책 요약</h3>
      </div>
      <ul>
        <li>
          <div class="list-container">
            <div class="list-title">정책 번호</div>
            <div class="list-content">${policyDetails.policyCode !="null" && !policyDetails.policyCode.isEmpty()? policyDetails.policyCode:"❌"}</div>
          </div>
          <div class="list-container">
            <div class="list-title">정책 분야</div>
            <div class="list-content">${policyDetails.categoryCode !="null" && !policyDetails.categoryCode.isEmpty()? policyDetails.categoryCode:"❌"}</div>
          </div>
          <div class="list-container">
            <div class="list-title">사업 운영 기간</div>
            <div class="list-content">${policyDetails.prdRpttSecd !="null" && !policyDetails.prdRpttSecd.isEmpty()? policyDetails.prdRpttSecd:"❌"}</div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">사업 신청 기간</div>
            <div class="list-content">${policyDetails.schedule !="null" && !policyDetails.schedule.isEmpty()? policyDetails.schedule:"❌"}</div>
          </div>
          <div class="list-container">
            <div class="list-title">지원 규모</div>
            <div class="list-content">something here sometimes</div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">지원 내용</div>
            <div class="list-content">
              ${policyDetails.supportContent !="null" && !policyDetails.supportContent.isEmpty()? policyDetails.supportContent:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">비고</div>
            <div class="list-content">
              something something
            </div>
          </div>
        </li>

      </ul>
    </div>

    <div class="policy-table-content" id="section2">
      <div class="policy-table-header">
        <h3>신청자격</h3>
      </div>
      <ul>
        <li>
          <div class="list-container">
            <div class="list-title">연령</div>
            <div class="list-content">${policyDetails.ageInfo !="null" && !policyDetails.ageInfo.isEmpty()? policyDetails.ageInfo:"❌"}</div>
          </div>
          <div class="list-container">
            <div class="list-title">취업 상태</div>
            <div class="list-content">
              ${policyDetails.empmSttsCn !="null" && !policyDetails.empmSttsCn.isEmpty()? policyDetails.empmSttsCn:"❌"}
            </div>
          </div>
          <div class="list-container">
            <div class="list-title">학력</div>
            <div class="list-content">
              ${policyDetails.accrRqisCn !="null" && !policyDetails.accrRqisCn.isEmpty()? policyDetails.accrRqisCn:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">전공</div>
            <div class="list-content">
              ${policyDetails.majorRqisCn !="null" && !policyDetails.majorRqisCn.isEmpty()? policyDetails.majorRqisCn:"❌"}
            </div>
          </div>
          <div class="list-container">
            <div class="list-title">특화 분야</div>
            <div class="list-content">
              ${policyDetails.splzRlmRqisCn !="null" && !policyDetails.splzRlmRqisCn.isEmpty()? policyDetails.splzRlmRqisCn:"❌"}
            </div>
          </div>

        </li>
        <li>
          <div class="list-container">
            <div class="list-title">거주지 및 소득</div>
            <div class="list-content">
              ${policyDetails.prcpCn !="null" && !policyDetails.prcpCn.isEmpty()? policyDetails.prcpCn:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">참여 제한 대상</div>
            <div class="list-content">
              ${policyDetails.prcpLmttTrgtCn !="null" && !policyDetails.prcpLmttTrgtCn.isEmpty()? policyDetails.prcpLmttTrgtCn:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">추가 단서 사항</div>
            <div class="list-content">
              ${policyDetails.aditRscn !="null" && !policyDetails.aditRscn.isEmpty()? policyDetails.aditRscn:"❌"}

            </div>
          </div>
        </li>


      </ul>
    </div>

    <div class="policy-table-content" id="section3">
      <div class="policy-table-header">
        <h3>신청방법</h3>
      </div>
      <ul>
        <li>
          <div class="list-container">
            <div class="list-title">신청 절차</div>
            <div class="list-content">
              ${policyDetails.rqutProcCn !="null" && !policyDetails.rqutProcCn.isEmpty()? policyDetails.rqutProcCn:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">심사 및 발표</div>
            <div class="list-content">
              ${policyDetails.jdgnPresCn !="null" && !policyDetails.jdgnPresCn.isEmpty()? policyDetails.jdgnPresCn:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">신청 사이트</div>
            <div class="list-content">
              <!-- rqutUrla가 null이 아니고 빈 문자열이 아닌 경우에만 링크를 출력 -->
              <c:if test="${policyDetails.rqutUrla != 'null' && !policyDetails.rqutUrla.isEmpty()}">
                <a href="${policyDetails.rqutUrla}">${policyDetails.rqutUrla}</a>
              </c:if>

              <!-- rqutUrla가 null이거나 빈 문자열이면 "❌" 표시 -->
              <c:if test="${policyDetails.rqutUrla == 'null' || policyDetails.rqutUrla.isEmpty()}">
                ❌
              </c:if>

            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">제출 서류</div>
            <div class="list-content">
              ${policyDetails.pstnPaprCn !="null" && !policyDetails.pstnPaprCn.isEmpty()? policyDetails.pstnPaprCn:"❌"}
            </div>
          </div>
      </ul>
    </div>
    <div class="policy-table-content" id="section4">
      <div class="policy-table-header">
        <h3>기타</h3>
      </div>
      <ul>
        <li>
          <div class="list-container">
            <div class="list-title">기타 유익 정보</div>
            <div class="list-content">
              ${policyDetails.etct !="null" && !policyDetails.etct.isEmpty()? policyDetails.etct:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">주관 기관</div>
            <div class="list-content">
              ${policyDetails.mngtMson !="null" && !policyDetails.mngtMson.isEmpty()? policyDetails.mngtMson:"❌"}
            </div>
          </div>
          <div class="list-container">
            <div class="list-title">운영 기관</div>
            <div class="list-content">
              ${policyDetails.cnsgNmor !="null" && !policyDetails.cnsgNmor.isEmpty()? policyDetails.cnsgNmor:"❌"}
            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">사업관련 참고 사이트1</div>
            <div class="list-content">
              <!-- rqutUrla가 null이 아니고 빈 문자열이 아닌 경우에만 링크를 출력 -->
              <c:if test="${policyDetails.rfcSiteUrla1 != 'null' && !policyDetails.rfcSiteUrla1.isEmpty()}">
                <a href="${policyDetails.rfcSiteUrla1}">${policyDetails.rfcSiteUrla1}</a>
              </c:if>

              <!-- rqutUrla가 null이거나 빈 문자열이면 "❌" 표시 -->
              <c:if test="${policyDetails.rfcSiteUrla1 == 'null' || policyDetails.rfcSiteUrla1.isEmpty()}">
                ❌
              </c:if>

            </div>
          </div>
        </li>
        <li>
          <div class="list-container">
            <div class="list-title">사업관련 참고 사이트2</div>
            <div class="list-content">

              <!-- rqutUrla가 null이 아니고 빈 문자열이 아닌 경우에만 링크를 출력 -->
              <c:if test="${policyDetails.rfcSiteUrla2 != 'null' && !policyDetails.rfcSiteUrla2.isEmpty()}">
                <a href="${policyDetails.rfcSiteUrla2}">${policyDetails.rfcSiteUrla2}</a>
              </c:if>

              <!-- rqutUrla가 null이거나 빈 문자열이면 "❌" 표시 -->
              <c:if test="${policyDetails.rfcSiteUrla2 == 'null' || policyDetails.rfcSiteUrla2.isEmpty()}">
                ❌
              </c:if>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="top-areas">
      <h2>지금 보고 있는 혜택과 비슷한 혜택</h2>
      <div class="areas-list">
        <div class="area-item">
          <div class="area-container">
            <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
          </div>
          <div class="text">
            <p class="region-name">강남구</p>
            <p class="region-tag">#역세권 1위!</p>
          </div>
        </div>
        <div class="area-item">
          <div class="area-container">
            <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
          </div>
          <div class="text">
            <p class="region-name">강남구</p>
            <p class="region-tag">#역세권 1위!</p>
          </div>
        </div>
        <div class="area-item">
          <div class="area-container">
            <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
          </div>
          <div class="text">
            <p class="region-name">강남구</p>
            <p class="region-tag">#역세권 1위!</p>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
