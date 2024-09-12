<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/components/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/mypage.css">

<%@ include file="/WEB-INF/components/login.jsp" %>
<div class="mypage-container">

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
                    <div class="my-nickname">살구추노꾼</div>
                    <div class="my-age">(30대)</div>
                    <div class="my-job">직장인</div>
                    <div class="my-id">test@test.com</div>
                </div>

                <!-- 관심 정보 -->
                <div class="interest-info">
                    <div class="title">
                        선택 하신 관심 분야
                    </div>
                    <div class="my-interest">
                        <div class="my-interest-detail">
                            #일자리
                        </div>
                        <div class="my-interest-detail">
                            #문화시설
                        </div>
                        <div class="my-interest-detail">
                            #주거
                        </div>
                    </div>
                </div>
            </div>

            <!-- 추가 정보 -->
            <div class="add-info">
                <div class="info-detail">
                    <i class="fa-solid fa-heart"></i>
                    <div class="info-header">결혼여부</div>
                    <div class="info-content">MARRIED</div>
                </div>
                <div class="info-detail">
                    <i class="fa-solid fa-baby-carriage"></i>
                    <div class="info-header">자녀수</div>
                    <div class="info-content">3</div>
                </div>
                <div class="info-detail">
                    <i class="fa-solid fa-venus-mars"></i>
                    <div class="info-header">성별</div>
                    <div class="info-content">M</div>
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
                    <div class="like-detail">
                        <div class="location-img"><img
                                src="${pageContext.request.contextPath}/assets/img/jongno.png">
                        </div>
                        <div class="location-name">서울시 종로구</div>
                        <div class="policy-name">청년 쿡 비즈니스센터 운영</div>
                        <div class="policy-status time">상시</div>
                    </div>
                    <div class="like-detail">
                        <div class="location-img"><img
                                src="${pageContext.request.contextPath}/assets/img/gangseo.png">
                        </div>
                        <div class="location-name">서울시 강서구</div>
                        <div class="policy-name">강서청년창업센터</div>
                        <div class="policy-status progress">진행중</div>
                    </div>
                    <div class="like-detail">
                        <div class="location-img"><img
                                src="${pageContext.request.contextPath}/assets/img/gangnam.png">
                        </div>
                        <div class="location-name">서울시 강남구</div>
                        <div class="policy-name">청년 쿡 비즈니스센터 운영</div>
                        <div class="policy-status end">신청마감</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="/WEB-INF/components/footer.jsp" %>

