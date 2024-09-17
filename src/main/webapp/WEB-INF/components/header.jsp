<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<header>
	<div class="logo" onclick="gotoHome()">
		<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
	</div>
	
	<nav>
		<sec:authorize access="isAuthenticated()"> <!-- 로그인된 사용자에게 표시할 내비게이션 링크 -->
			<div class="my-img" onclick="mymodalclick()">
				<sec:authentication property="principal" var="prc"/>
				<img class="person" src="${pageContext.request.contextPath}/assets/img/person.jpg">
				<div class="triangle"></div>
				<div class="my-modal">
					<div class="my-modal-detail">
						<button class="modal-btn" onclick="gotoMyPage()" type="submit">마이페이지
						</button>
					</div>
					<div class="my-modal-detail">
						<button class="modal-btn" type="submit">정보 수정</button>
					</div>
					<div class="my-modal-detail">
						<form action="${pageContext.request.contextPath}/api/v1/logout"
						      method="post">
							<button class="modal-btn" type="submit">Logout</button>
						</form>
					</div>
				</div>
			</div>
		</sec:authorize>
		
		<sec:authorize access="!isAuthenticated()"> <!-- 비로그인 사용자에게 표시할 내비게이션 링크 -->
			<div class="login">
				<button onclick="openLoginModal()">
					<span class="circle1"></span>
			    <span class="circle2"></span>
			    <span class="circle3"></span>
			    <span class="circle4"></span>
			    <span class="circle5"></span>
			    <span class="text">로그인</span>
				</button>
			</div>
		</sec:authorize>
	</nav>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/member/login.jsp"/>
</header>
