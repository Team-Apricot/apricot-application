<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>살구 - MyPage</title>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/myPage-env.jsp"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<%@ include file="/WEB-INF/views/member/updatePassword.jsp" %>
<%@ include file="/WEB-INF/views/member/updateInfo.jsp" %>

<section>
	<div class="hidden-background"></div>
	<video class="background-video" autoplay muted loop>
		<source src="${pageContext.request.contextPath}/assets/video/index-page-background.mp4" type="video/mp4">
	</video>
	<div class="overlay"></div>
	<div class="mypage-container blur-background">
		<div class="mypage-title">
			My Page
		</div>
		
		<!-- 내정보 확인-->
		<div class="mypage-info">
			<div class="mypage-left-side">
				<div class="my-info">
					
					<!-- 기본 정보 -->
					<div class="basic-info">
						<i class="fa-solid fa-user"></i>
						<div class="my-nickname">${memberInfo.nickName} </div>
						<div class="my-id">${memberInfo.email}</div>
						<div class="my-age">(${memberInfo.ageRange})</div>
						<div class="my-job">${memberInfo.career}</div>
					</div>
					
					<!-- 관심 정보 -->
					<div class="interest-info">
						<div class="title">
							선택 하신 관심 분야
						</div>
						<div class="my-interest">
							<c:forEach items="${memberInfo.interests}" var="interest">
								<div class="my-interest-detail">#${interest}</div>
							</c:forEach>
						</div>
						<div class="update-info">
							<div class="update-btn" onclick="openUpdateInfoModal()">정보 수정</div>
							<div class="update-btn" onclick="openUpdatePwModal()">비밀번호 수정</div>
						</div>
					</div>
				</div>
				
				<!-- 추가 정보 -->
				<div class="add-info">
					<div class="info-detail">
						<div class="updateIcon">
							<i class="fa-solid fa-pen"></i>
						</div>
						<div class="add-info-detail">
							<i class="fa-solid fa-heart"></i>
							<div class="info-header">결혼여부</div>
							<div class="info-content">${memberInfo.marriedStatus}</div>
						</div>
					</div>
					
					<div class="info-detail">
						<div class="updateIcon">
							<i class="fa-solid fa-pen"></i>
						</div>
						<div class="add-info-detail">
							<i class="fa-solid fa-baby-carriage"></i>
							<div class="info-header">자녀수</div>
							<div class="info-content">${memberInfo.numChild}</div>
						</div>
					</div>
					
					<div class="info-detail">
						<div class="updateIcon">
							<i class="fa-solid fa-pen"></i>
						</div>
						<div class="add-info-detail">
							<i class="fa-solid fa-venus-mars"></i>
							<div class="info-header">성별</div>
							<div class="info-content">${memberInfo.gender}</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--찜 정보 -->
			<div class="mypage-right-side">
				<div class="like-info">
					<div class="title">
						눈 여겨 보고 있는 정책
					</div>
					<div class="my-like">
						<c:forEach items="${scrapInfo}" var="scrap">
							<div class="like-detail">
								<div class="location-img">
									<img src="${pageContext.request.contextPath}${scrap.districtLogoPath}">
								</div>
								<div class="location-name">${scrap.districtName}</div>
								<div class="policy-name">${scrap.policyName}</div>
								<div class="policy-status">${scrap.prdRpttSecd}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
