<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Heejung_Projects</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/salguDevelopers/heejung/assets/css/heejung.css"  rel="stylesheet"/>
</head>
<body class="d-flex flex-column h-100 bg-light">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
        <div class="container px-5">
            <a class="navbar-brand" href="../heejung"><span class="fw-bolder text-primary">HeeJung</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                    <li class="nav-item"><a class="nav-link" href="../heejung">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="resume">Resume</a></li>
                    <li class="nav-item"><a class="nav-link" href="projects">Projects</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Projects Section-->
    <section class="py-5">
        <div class="container px-5 mb-5">
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bolder mb-0"><span class="text-gradient d-inline">Projects</span></h1>
            </div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-11 col-xl-9 col-xxl-8">
                    <!-- Project Card 1-->
                    <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                        <div class="card-body p-0">
                            <div class="d-flex align-items-center">
                                <div class="p-5">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/salguDevelopers/heejung/assets/img/How.png" alt="..." />
                                    <h2 class="fw-bolder">HOW</h2>
                                    <div class="text-primary fw-bolder mb-2"> 실시간 화상 통화를 이용하여 함께하는 홈트레이닝 서비스 제작</div>
                                    <p>제작 기간 : 2023.08~2023.11 </p>
                                    <p>개발 인원 : 3명(프론트엔드 2명 , 백엔드 1명) </p>
                                    <p>사용 언어 : React, webRTC , webSocket , Spring boots , EC2 , AWS S3</p>
                                    <h3 class="fw-bolder">내용</h3>
                                    <p>프로젝트 HOW는 혼자서 운동을 시작하기 어려워하는 분들을 대상으로 , 사람드로가 함께 소통하며 운동할 수 있는 플랫폼을 제공하는 서비스 입니다.</p>
                                    <p>프로젝트 명 HOW는 Home과 Workout의 줄임말로 집에서 운동한다는 뜻과 운동을 어떻게 하는지 알려준다는 의미를 내포하고 있습니다.</p>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Project Card 2-->
                    <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                        <div class="card-body p-0">
                            <div class="d-flex align-items-center">
                                <div class="p-5">
                                    <h2 class="fw-bolder">SafeSeoul</h2>
<%--                                    <img class="img-fluid" src="../../../../assets/img/heejung/how.png" alt="..." />--%>
                                    <div class="text-primary fw-bolder mb-2"> 행정안전부_서울시 구청 재난문자 발송 현황 데이터를 활용하여 지난 재난문자들을 한눈에 볼 수 있는 서비스를 목적으로 개발을 진행</div>
                                    <p>제작 기간 : 2021.03~2021.06 </p>
                                    <p>개발 인원 : 3명(프론트엔드 2명 , 백엔드 1명) </p>
                                    <p>사용 언어 : react,spring</p>
                                    <h3 class="fw-bolder">내용</h3>
                                    <p>행정안전부_서울시 구청 재난문자 발송 현황 데이터를 활용하여 지난 재난문자들을 한눈에 볼 수 있는 서비스를 목적으로 개발을 진행</p>
                                    <p>safeseoul로 재난에 대비하여 서울시민들의 안전을 위한다는 뜻을 가지고 있다. </p>
                                    </div>
<%--                                <img class="img-fluid" src="https://dummyimage.com/300x400/343a40/6c757d" alt="..." />--%>
                            </div>
                        </div>
                    </div>

                    <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                        <div class="card-body p-0">
                            <div class="d-flex align-items-center">
                                <div class="p-5">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/salguDevelopers/heejung/assets/img/checkmate.png" alt="..." />
                                    <h2 class="fw-bolder">Checkmate</h2>
                                    <div class="text-primary fw-bolder mb-2"> 회사에서 운영할 수 있는 도서 관리 프로젝트</div>
                                    <p>제작 기간 : 2024.07~2024.08 </p>
                                    <p>개발 인원 : 4명</p>
                                    <p>사용 언어 : java, javaFx , Oracle</p>
                                    <h3 class="fw-bolder">내용</h3>
                                    <p>도서 대여 , 반납 , 관리 , 신청 등의 기능을 가지고 있다.</p>
                                    <p>사용자와 관리자를 나눠 도서와 사원을 관리한다. </p>
                                </div>
                                <%--                                <img class="img-fluid" src="https://dummyimage.com/300x400/343a40/6c757d" alt="..." />--%>
                            </div>
                        </div>
                    </div>

                    <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                        <div class="card-body p-0">
                            <div class="d-flex align-items-center">
                                <div class="p-5">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/salguDevelopers/heejung/assets/img/salgu.png" alt="..." />
                                    <h2 class="fw-bolder">살구</h2>
                                    <div class="text-primary fw-bolder mb-2"> 서울시에서 자신의 맞는 혜택을 추천해주는 프로젝트</div>
                                    <p>제작 기간 : 2024.09~ </p>
                                    <p>개발 인원 : 4명</p>
                                    <p>사용 언어 : SpringBoot , jsp </p>
                                    <h3 class="fw-bolder">내용</h3>
                                    <p>서울시 공공데이터를 가져와 기능 개발</p>
                                    <p>살구는 살기좋은 지역구라는 뜻의 줄임말이다. </p>
                                </div>
                                <%--                                <img class="img-fluid" src="https://dummyimage.com/300x400/343a40/6c757d" alt="..." />--%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Call to action section-->

</main>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
