<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>살구 - 살기 좋은 지역구</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> <!-- 구글 폰트 링크 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome 링크 추가 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
    </div>
    
    <nav>
        <sec:authorize access="isAuthenticated()"> <!-- 로그인된 사용자에게 표시할 내비게이션 링크 -->
            <div class="logout">
                <form action="${pageContext.request.contextPath}/member/logout" method="post">
                    <button type="submit">Logout</button>
                </form>
            </div>
        </sec:authorize>

        <sec:authorize access="!isAuthenticated()"> <!-- 비로그인 사용자에게 표시할 내비게이션 링크 -->
            <div class="login">
                <button onclick="openLoginModal()">Sign in</button>
            </div>
        </sec:authorize>
    </nav>
</header>

<script src="${pageContext.request.contextPath}/js/member/login.js"></script>
