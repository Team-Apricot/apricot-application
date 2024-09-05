<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ProMan - Personal Portfolio HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/favicon.ico"
          rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/animate/animate.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/lightbox/css/lightbox.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/css/style.css"
          rel="stylesheet">
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="51">
<!-- Spinner Start -->
<div id="spinner"
     class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->


<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light fixed-top shadow py-lg-0 px-4 px-lg-5 wow fadeIn"
     data-wow-delay="0.1s">
    <a href="intro.jsp" class="navbar-brand d-block d-lg-none">
        <h1 class="text-primary fw-bold m-0">ProMan</h1>
    </a>
    <button type="button" class="navbar-toggler" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between py-4 py-lg-0" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <a href="#home" class="nav-item nav-link active">Home</a>
            <a href="#about" class="nav-item nav-link">About ME</a>
            <a href="#skill" class="nav-item nav-link">Skills</a>

        </div>
        <a href="intro.jsp" class="navbar-brand bg-secondary py-3 px-4 mx-3 d-none d-lg-block">
            <h1 class="text-primary fw-bold m-0">WELCOME</h1>
        </a>
        <div class="navbar-nav me-auto py-0">
            <a href="#project" class="nav-item nav-link">Projects</a>
            <a href="#service" class="nav-item nav-link">Services</a>
        </div>
    </div>
</nav>
<!-- Navbar End -->


<!-- Header Start -->
<div class="container-fluid bg-light my-6 mt-0" id="home">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 py-6 pb-0 pt-lg-0">
                <h3 class="text-primary mb-3">안녕하세요</h3>
                <h1 class="display-3 mb-3">이서호입니다, 저는</h1>
                <h2 class="typed-text-output d-inline"></h2>
                <div class="typed-text d-none"> 알고리즘을 좋아하는 백엔드 개발자,
                    새로운 걸 추구하는 프론트 개발자,끝없이 성장하는 신입 개발자
                </div>
                <h3 class="text-primary mb-3">입니다.</h3>
                <div class="d-flex align-items-center pt-5">
                    <a href="" class="btn btn-primary py-3 px-4 me-5">Download CV</a>
                </div>
            </div>
            <div class="col-lg-6">
<%--                <img class="img-fluid"--%>
<%--                     src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/profile.jpg"--%>
<%--                     alt="">--%>
            </div>

        </div>
    </div>
</div>
<!-- Header End -->

<!-- About Start -->
<div class="container-xxl py-6" id="about">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="d-flex align-items-center mb-5">
                    <div class="years flex-shrink-0 text-center me-4">
<%--                        <h4 class="display-1 mb-0">개발자</h4>--%>
                        <h5 class="mb-0"></h5>
                    </div>
                    <h3 class="lh-base mb-0">개발자가 되기 위해 노력한 것들</h3>
                </div>
                <p class="mb-4">본래 생명공학을 전공했던 저는 생물정보학이라는 학문을 접하며, 프로그래밍에 관심을 갖기 시작했습니다.
                그리고 이제 그 꿈을 실현하려고 합니다.</p>
                <p class="mb-3"><i class="far fa-check-circle text-primary me-3"></i>정보처리기사 자격증 (2023.09.01)</p>
                <p class="mb-3"><i class="far fa-check-circle text-primary me-3"></i>리눅스 마스터 2급 (2023.10.06)</p>
                <p class="mb-3"><i class="far fa-check-circle text-primary me-3"></i>정보보안기사 필기(24.03.05)</p>
                <p class="mb-3"><i class="far fa-check-circle text-primary me-3"></i>백준 알고리즘 Platinum (상위 4.3%)</p>
                <a class="btn btn-primary py-3 px-5 mt-3" href="">Read More</a>
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="row g-3 mb-4">
<%--                    <div class="col-sm-6">--%>
<%--                        <img class="img-fluid rounded"--%>
<%--                             src="http://mazassumnida.wtf/api/v2/generate_badge?boj=ssoulistic"--%>
<%--                             alt="">--%>
<%--                    </div>--%>
<%--                    <div class="col-sm-6">--%>
<%--                        <img class="img-fluid rounded"--%>
<%--                             src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/about-2.jpg"--%>
<%--                             alt="">--%>
<%--                    </div>--%>
                </div>
                <div class="d-flex align-items-center mb-3">
                    <h5 class="border-end pe-3 me-3 mb-0">Happy Clients</h5>
                    <h2 class="text-primary fw-bold mb-0" data-toggle="counter-up">1234</h2>
                </div>
                <p class="mb-4">Stet no et lorem dolor et diam, amet duo ut dolore vero eos. No stet
                    est diam amet diam ipsum clita labore dolor duo clita.</p>
                <div class="d-flex align-items-center mb-3">
                    <h5 class="border-end pe-3 me-3 mb-0">Projects Completed</h5>
                    <h2 class="text-primary fw-bold mb-0" data-toggle="counter-up">1234</h2>
                </div>
                <p class="mb-0">Stet no et lorem dolor et diam, amet duo ut dolore vero eos. No stet
                    est diam amet diam ipsum clita labore dolor duo clita.</p>
            </div>
        </div>
    </div>
</div>
<!-- About End -->


<!-- Expertise Start -->
<div class="container-xxl py-6 pb-5" id="skill">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <h1 class="display-5 mb-5">Skills & Experience</h1>
<%--                <p class="mb-4">저의 기술스택입니다.</p>--%>
                <h3 class="mb-4">My Skills</h3>
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">Python</h6>
                                <h6 class="font-weight-bold">95%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-primary" role="progressbar"
                                     aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">JAVA</h6>
                                <h6 class="font-weight-bold">90%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar"
                                     aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">HTML</h6>
                                <h6 class="font-weight-bold">80%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar"
                                     aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">Javascript</h6>
                                <h6 class="font-weight-bold">80%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar"
                                     aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">CSS</h6>
                                <h6 class="font-weight-bold">80%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-dark" role="progressbar"
                                     aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-bold">Flask</h6>
                                <h6 class="font-weight-bold">80%</h6>
                            </div>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar"
                                     aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <ul class="nav nav-pills rounded border border-2 border-primary mb-5">
                    <li class="nav-item w-50">
                        <button class="nav-link w-100 py-3 fs-5 active" data-bs-toggle="pill"
                                href="#tab-1">Experience
                        </button>
                    </li>
                    <li class="nav-item w-50">
                        <button class="nav-link w-100 py-3 fs-5" data-bs-toggle="pill"
                                href="#tab-2">Education
                        </button>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row gy-5 gx-4">
                            <div class="col-sm-6">
                                <h5>UI Designer</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Apex Software Inc</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>Product Designer</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Apex Software Inc</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>Web Designer</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Apex Software Inc</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>Apps Designer</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Apex Software Inc</h6>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane fade show p-0">
                        <div class="row gy-5 gx-4">
                            <div class="col-sm-6">
                                <h5>UI Design Course</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Cambridge University</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>IOS Development</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Cambridge University</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>Web Design</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Cambridge University</h6>
                            </div>
                            <div class="col-sm-6">
                                <h5>Apps Design</h5>
                                <hr class="text-primary my-2">
                                <p class="text-primary mb-1">2000 - 2045</p>
                                <h6 class="mb-0">Cambridge University</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Expertise End -->

<!-- Projects Start -->
<div class="container-xxl py-6 pt-5" id="project">
    <div class="container">
        <div class="row g-5 mb-5 align-items-center wow fadeInUp" data-wow-delay="0.1s">
            <div class="col-lg-6">
                <h1 class="display-5 mb-0">My Projects</h1>
            </div>
            <div class="col-lg-6 text-lg-end">
                <ul class="list-inline mx-n3 mb-0" id="portfolio-flters">
                    <li class="mx-3 active" data-filter="*">All Projects</li>
                    <li class="mx-3" data-filter=".first">UI/UX Design</li>
                    <li class="mx-3" data-filter=".second">Graphic Design</li>
                </ul>
            </div>
        </div>
        <div class="row g-4 portfolio-container wow fadeInUp" data-wow-delay="0.1s">
            <div class="col-lg-4 col-md-6 portfolio-item first">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-1.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-1.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item second">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-2.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-2.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item first">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-3.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-3.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item second">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-4.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-4.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item first">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-5.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-5.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item second">
                <div class="portfolio-img rounded overflow-hidden">
                    <img class="img-fluid"
                         src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-6.jpg"
                         alt="">
                    <div class="portfolio-btn">
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1"
                           href="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/img/project-6.jpg"
                           data-lightbox="portfolio"><i
                                class="fa fa-eye"></i></a>
                        <a class="btn btn-lg-square btn-outline-secondary border-2 mx-1" href=""><i
                                class="fa fa-link"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Projects End -->


<!-- Service Start -->
<%--<div class="container-fluid bg-light my-5 py-6" id="service">--%>
<%--    <div class="container">--%>
<%--        <div class="row g-5 mb-5 wow fadeInUp" data-wow-delay="0.1s">--%>
<%--            <div class="col-lg-6">--%>
<%--                <h1 class="display-5 mb-0">나의 강점</h1>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 text-lg-end">--%>
<%--                <a class="btn btn-primary py-3 px-5" href="">Hire Me</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row g-4">--%>
<%--            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">--%>
<%--                <div class="service-item d-flex flex-column flex-sm-row bg-white rounded h-100 p-4 p-lg-5">--%>
<%--                    <div class="bg-icon flex-shrink-0 mb-3">--%>
<%--                        <i class="fa fa-crop-alt fa-2x text-dark"></i>--%>
<%--                    </div>--%>
<%--                    <div class="ms-sm-4">--%>
<%--                        <h4 class="mb-3">Creative Design</h4>--%>
<%--                        <h6 class="mb-3">Start from <span class="text-primary">$199</span></h6>--%>
<%--                        <span>Stet lorem dolor diam amet vero eos. No stet est diam amet diam ipsum. Clita dolor duo clita sit sed sit dolor eos.</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">--%>
<%--                <div class="service-item d-flex flex-column flex-sm-row bg-white rounded h-100 p-4 p-lg-5">--%>
<%--                    <div class="bg-icon flex-shrink-0 mb-3">--%>
<%--                        <i class="fa fa-code-branch fa-2x text-dark"></i>--%>
<%--                    </div>--%>
<%--                    <div class="ms-sm-4">--%>
<%--                        <h4 class="mb-3">Graphic Design</h4>--%>
<%--                        <h6 class="mb-3">Start from <span class="text-primary">$199</span></h6>--%>
<%--                        <span>Stet lorem dolor diam amet vero eos. No stet est diam amet diam ipsum. Clita dolor duo clita sit sed sit dolor eos.</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">--%>
<%--                <div class="service-item d-flex flex-column flex-sm-row bg-white rounded h-100 p-4 p-lg-5">--%>
<%--                    <div class="bg-icon flex-shrink-0 mb-3">--%>
<%--                        <i class="fa fa-code fa-2x text-dark"></i>--%>
<%--                    </div>--%>
<%--                    <div class="ms-sm-4">--%>
<%--                        <h4 class="mb-3">Web Design</h4>--%>
<%--                        <h6 class="mb-3">Start from <span class="text-primary">$199</span></h6>--%>
<%--                        <span>Stet lorem dolor diam amet vero eos. No stet est diam amet diam ipsum. Clita dolor duo clita sit sed sit dolor eos.</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">--%>
<%--                <div class="service-item d-flex flex-column flex-sm-row bg-white rounded h-100 p-4 p-lg-5">--%>
<%--                    <div class="bg-icon flex-shrink-0 mb-3">--%>
<%--                        <i class="fa fa-laptop-code fa-2x text-dark"></i>--%>
<%--                    </div>--%>
<%--                    <div class="ms-sm-4">--%>
<%--                        <h4 class="mb-3">UI/UX Design</h4>--%>
<%--                        <h6 class="mb-3">Start from <span class="text-primary">$199</span></h6>--%>
<%--                        <span>Stet lorem dolor diam amet vero eos. No stet est diam amet diam ipsum. Clita dolor duo clita sit sed sit dolor eos.</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Service End -->


<!-- Copyright Start -->
<div class="container-fluid bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                &copy; <a class="border-bottom text-secondary" href="#">Your Site Name</a>, All
                Right Reserved.
            </div>
            <div class="col-md-6 text-center text-md-end">
                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                Designed By <a class="border-bottom text-secondary" href="https://htmlcodex.com">HTML
                Codex</a>
                <br>Distributed By: <a class="border-bottom" href="https://themewagon.com"
                                       target="_blank">ThemeWagon</a>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Copyright End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/typed/typed.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/counterup/counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/salguDevelopers/seoho/assets/js/main.js"></script>
</body>

</html>