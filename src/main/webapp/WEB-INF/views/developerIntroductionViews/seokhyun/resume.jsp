<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Resume - shhwang Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/favicon.png' />" rel="icon">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/apple-touch-icon.png' />" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/bootstrap-icons/bootstrap-icons.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/aos/aos.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/swiper/swiper-bundle.min.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/glightbox/css/glightbox.min.css' />" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/css/main.css' />" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Personal
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="resume-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/index.html' />" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="/salguDevelopers/seokhyun/assets/img/logo.png" alt=""> -->
        <h1 class="sitename">shhwang</h1>
      </a>

      <nav id="navmenu" class="navmenu">

        <ul>
          <li><a href="<c:url value='/resume/seokhyun/home' />" class="<c:choose><c:when test='${pageContext.request.requestURI eq "/resume/seokhyun/home"}'>active</c:when><c:otherwise></c:otherwise></c:choose>">Home</a></li>
          <li><a href="<c:url value='/resume/seokhyun/about' />" class="<c:choose><c:when test='${pageContext.request.requestURI eq "/resume/seokhyun/about"}'>active</c:when><c:otherwise></c:otherwise></c:choose>">About</a></li>
          <li><a href="<c:url value='/resume/seokhyun/resume' />" class="<c:choose><c:when test='${pageContext.request.requestURI eq "/resume/seokhyun/resume"}'>active</c:when><c:otherwise></c:otherwise></c:choose>">Resume</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="heading">
        <div class="container">
          <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-8">
              <h1>기술경력서</h1>
              <p class="mb-0">고객입장에서 생각하는 전문개발자.</p>
            </div>
          </div>
        </div>
      </div>
      <nav class="breadcrumbs">
        <div class="container">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Resume</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Page Title -->

    <!-- Resume Section -->
    <section id="resume" class="resume section">

      <div class="container">

        <div class="row">

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <h3 class="resume-title">Professional Experience</h3>

            <div class="resume-item pb-0">
              <h4>서울주택도시공사 전사자원통합관리 시스템</h4>
              <h5>2023.12 - 2024.04</h5>
              <p><em>주관처(납품처) : 쌍용정보통신(서울주택토지공사)</em></p>
              <ul>

                <li> 프로젝트 개요 및 역할 : 시스템 구축 </li>
                <li> 개발 인원 : 11 </li>
                <li> 기술 스택 : 언어 - JAVA, Jscript </li>
                <li> DBMS - Oracle </li>
                <li> TOOL/통신/기타 - Spring, websquare, SVN </li>
                <li> 상세 내용 : 건설설계시공/설계용역/환경 부문 개발 작업일보, 감리, 공종 등
                    ERP 인터페이스, 업무결재 시스템, 기상정보 배치 스케줄러, 마이그레이션, 프로시저 작성</li>
              </ul>
            </div><!-- Edn Resume Item -->

            <div class="resume-item">
              <h4>포스코 신설그룹 HRM</h4>
              <h5>2023.02 - 2023.06</h5>
              <p><em>주관처(납품처) : 새롬씨앤씨(포스코ICT)</em></p>
              <ul>
                <li> 프로젝트 개요 및 역할 : 시스템 구축 </li>
                <li> 개발 인원 : 9 </li>
                <li> 기술 스택 : 언어 - JAVA, JPA, JQuery, Ajax, JSP </li>
                <li> DBMS - Oracle, Tibero </li>
                <li> TOOL/통신/기타 - STS, Jenkins, Bamboo, Jira, GIT </li>
                <li> 상세 내용 : 인사/조직 부문 구축, 컨버팅, 마이그레이션, 프로시저 작성</li>
              </ul>
            </div><!-- Edn Resume Item -->

            <div class="resume-item">
              <h4>포스코 AI원료가격 예측</h4>
              <h5>2022.11 ~ 2023.01</h5>
              <p><em>주관처(납품처) : 새롬씨앤씨(포스코ICT)</em></p>
              <ul>

                <li> 프로젝트 개요 및 역할 : 시스템 구축 </li>
                <li> 개발 인원 : 4 </li>
                <li> 기술 스택 : 언어 - JAVA, JQuery, Ajax, Jscript </li>
                <li> DBMS - PostgreSQL </li>
                <li> TOOL/통신/기타 - STS, Jenkins, Bamboo, Jira, GIT </li>
                <li> 상세 내용 :  데이터 시각화 및 사용자 관리 Batch PGM개발
                             ERP 인터페이스 배치 Quartz Scheduler, 시각화 구글Chart 라이브러리</li>
              </ul>
            </div><!-- Edn Resume Item -->

          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <div class="resume-item">
              <h4>SECUI CRM</h4>
              <h5>2022.07 ~ 2022.11</h5>
              <p><em>주관처(납품처) : 새롬씨앤씨(시큐아이)</em></p>
              <ul>
                <li> 프로젝트 개요 및 역할 : 시스템 구축 </li>
                <li> 개발 인원 : 7 </li>
                <li> 기술 스택 : 언어 - Apex(Java 유사언어) </li>
                <li> DBMS - Salesforce Cloud </li>
                <li> TOOL/통신/기타 - Salesforce Cloud, Salesforce Dev, GIT </li>
                <li> 상세 내용 :  고객사 SaaS 클라우드 CRM 구축</li>
              </ul>
            </div><!-- Edn Resume Item -->
            <div class="resume-item">
              <h4>LG Twins Digit Locker 웹에이전시</h4>
              <h5>2020.12 - 2021.06</h5>
              <p><em>주관처(납품처) : 쏠트(LG CNS)</em></p>
              <ul>
                <li> 프로젝트 개요 및 역할 : 시스템 구축 </li>
                <li> 개발 인원 : 3 </li>
                <li> 기술 스택 : 언어 - JAVA, JQuery Ajax, JSP </li>
                <li> DBMS - MS-SQL </li>
                <li> TOOL/통신/기타 - 전자정부프레임워크(Spring), SVN, Bizactor </li>
                <li> 상세 내용 : 선수 스티커 응원 및 투표 시스템, 게시판, 이벤트(선착 및 추첨), 포인트 지급, 회원관리 구축</li>
              </ul>
            </div><!-- Edn Resume Item -->


            <h3 class="resume-title">Education</h3>
            <div class="resume-item">
              <h4>한국소프트웨어산업현회</h4>
              <h5>2024.06 - 2024.11</h5>
              <p><em>교육과정명 - 공공SI SW개발 전문가 과정</em></p>
            </div><!-- Edn Resume Item -->

            <div class="resume-item">
              <h4>비트교육센터</h4>
              <h5>2022.02 - 2022.06</h5>
              <p><em>교육과정명 - AWS기반 스프링부트 백엔드 전문가 과정</em></p>
            </div><!-- Edn Resume Item -->

          </div>

        </div>

      </div>

    </section><!-- /Resume Section -->

  </main>

  <footer id="footer" class="footer dark-background">
    <div class="container">
      <h3 class="sitename">shhwang</h3>
      <p>그룹사업내 경험을 기반으로 다양한 업무지식을 축적하고 신기술을 적극 도입하여 적용하는 등 이러한 주요업무에 참여하게 된다면 제게
                  는 커다란 기회라고 생각합니다.</p>
      <div class="social-links d-flex justify-content-center">
        <a href=""><i class="bi bi-twitter-x"></i></a>
        <a href=""><i class="bi bi-facebook"></i></a>
        <a href=""><i class="bi bi-instagram"></i></a>
        <a href=""><i class="bi bi-skype"></i></a>
        <a href=""><i class="bi bi-linkedin"></i></a>
      </div>
      <div class="container">
        <div class="copyright">
          <span>Copyright</span> <strong class="px-1 sitename">shhwang</strong> <span>All Rights Reserved</span>
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you've purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
          Designed by <a href="https://bootstrapmade.com/">shhwang</a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/php-email-form/validate.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/aos/aos.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/typed.js/typed.umd.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/purecounter/purecounter_vanilla.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/waypoints/noframework.waypoints.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/swiper/swiper-bundle.min.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/glightbox/js/glightbox.min.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js' />"></script>
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/vendor/isotope-layout/isotope.pkgd.min.js' />"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/salguDevelopers/seokhyun/assets/js/main.js' />"></script>

</body>

</html>