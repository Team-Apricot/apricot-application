<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>살구 - 살기 좋은 지역구</title>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/env/common-env.jsp"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/header.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/salgu-main.jsp"/>

<%-- TODO: 소개 페이지 필요시 사용(일정 보고 진행 예정) --%>
<%--<sec:authorize access="isAuthenticated()"> <!-- 로그인된 사용자에게 표시할 내비게이션 링크 -->--%>
<%--	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/salgu-main.jsp"/>--%>
<%--</sec:authorize>--%>

<%--<sec:authorize access="!isAuthenticated()"> <!-- 비로그인 사용자에게 표시할 내비게이션 링크 -->--%>
<%--	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/salgu-intro.jsp"/>--%>
<%--</sec:authorize>--%>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/components/footer.jsp"/>
</body>
</html>
