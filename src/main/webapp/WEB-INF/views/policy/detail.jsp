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
<section>
	<div class="layout">
		<div class="policy-detail-page" id="section1">
			<div class="toc" id="toc">
				<span class="toc-title">목차</span>
			</div>
			<div class="policy-header">
				<div class="policy-title">
					<h2>${policyDetails.policyName !="null" && !policyDetails.policyName.isEmpty()? policyDetails.policyName:"❌"}</h2>
					<h3>${policyDetails.policyContent !="null" && !policyDetails.policyContent.isEmpty()? policyDetails.policyContent:"❌"}</h3>
				</div>
				<div class="button-link">
					<%-- 공유와 찜하기 버튼 위치 우상단.--%>
					<button type="button" class="sns-share">
						<img src="${pageContext.request.contextPath}/assets/img/share_icon2_0.8.png"
						     width="30"
						     alt="공유하기">
					</button>
					<div class="share-group" style="display: none;">
						<p class="title"> 공유하기</p>
						<ul>
							<li>
								<a href="" title="새 창 열기">아이콘1</a>
							</li>
							<li>
								<a href="" title="새 창 열기">아이콘2</a>
							</li>
							<li>
								<a href="" title="새 창 열기">아이콘3</a>
							</li>
						</ul>
					</div>
					<button type="button" class="wish-list">
						<img src="${pageContext.request.contextPath}/assets/img/heart_icon_0.8.png"
						     width="30"
						     alt="찜하기">
					</button>
				</div>
			</div>
			
			<div class="policy-table-content" id="section2">
				<div class="policy-table-header">
					<h3>한 눈에 보는 정책 요약</h3>
				</div>
				<ul>
					<li>
						<div class="list-container">
							<div class="list-title">정책 번호</div>
							<div
									class="list-content">${policyDetails.policyCode !="null" && !policyDetails.policyCode.isEmpty()? policyDetails.policyCode:"❌"}</div>
						</div>
						<div class="list-container">
							<div class="list-title">정책 분야</div>
							<div
									class="list-content">${policyDetails.categoryCode !="null" && !policyDetails.categoryCode.isEmpty()? policyDetails.categoryCode:"❌"}</div>
						</div>
						<div class="list-container">
							<div class="list-title">사업 운영 기간</div>
							<div
									class="list-content">${policyDetails.prdRpttSecd !="null" && !policyDetails.prdRpttSecd.isEmpty()? policyDetails.prdRpttSecd:"❌"}</div>
						</div>
					</li>
					<li>
						<div class="list-container">
							<div class="list-title">사업 신청 기간</div>
							<div
									class="list-content">${policyDetails.schedule !="null" && !policyDetails.schedule.isEmpty()? policyDetails.schedule:"❌"}</div>
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
				
				</ul>
			</div>
			
			<div class="policy-table-content" id="section3">
				<div class="policy-table-header">
					<h3>신청자격</h3>
				</div>
				<ul>
					<li>
						<div class="list-container">
							<div class="list-title">연령</div>
							<div
									class="list-content">${policyDetails.ageInfo !="null" && !policyDetails.ageInfo.isEmpty()? policyDetails.ageInfo:"❌"}</div>
						</div>
						<div class="list-container">
							<div class="list-title">취업 상태</div>
							<div class="list-content">
								${policyDetails.empmSttsCn !="null" && !policyDetails.empmSttsCn.isEmpty()? policyDetails.empmSttsCn:"❌"}
							</div>
						</div>
					</li>
					<li>
						<div class="list-container">
							<div class="list-title">학력</div>
							<div class="list-content">
								${policyDetails.accrRqisCn !="null" && !policyDetails.accrRqisCn.isEmpty()? policyDetails.accrRqisCn:"❌"}
							</div>
						</div>
						<div class="list-container">
							<div class="list-title">전공</div>
							<div class="list-content">
								${policyDetails.majorRqisCn !="null" && !policyDetails.majorRqisCn.isEmpty()? policyDetails.majorRqisCn:"❌"}
							</div>
						</div>
					</li>
					<li>
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
			
			<div class="policy-table-content" id="section4">
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
								${policyDetails.rqutUrla !="null" && !policyDetails.rqutUrla.isEmpty()? policyDetails.rqutUrla:"❌"}
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
			<div class="policy-table-content" id="section5">
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
								${policyDetails.rfcSiteUrla1 !="null" && !policyDetails.rfcSiteUrla1.isEmpty()? policyDetails.rfcSiteUrla1:"❌"}
							</div>
						</div>
					</li>
					<li>
						<div class="list-container">
							<div class="list-title">사업관련 참고 사이트2</div>
							<div class="list-content">
								${policyDetails.rfcSiteUrla2 !="null" && !policyDetails.rfcSiteUrla2.isEmpty()? policyDetails.rfcSiteUrla2:"❌"}
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
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
</section>
</body>
<script>
  ScrollOut();
</script>
</html>
