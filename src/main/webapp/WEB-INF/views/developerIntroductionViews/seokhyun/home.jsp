<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - shhwang Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/favicon.png' />" rel="icon">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/apple-touch-icon.png' />" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Poppins:wght@100;300;400;500;600;700;900&family=Raleway:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/bootstrap-icons/bootstrap-icons.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/aos/aos.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/swiper/swiper-bundle.min.css' />" rel="stylesheet">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/vendor/glightbox/css/glightbox.min.css' />" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/css/main.css' />" rel="stylesheet">

</head>

<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <h1 class="sitename">shhwang</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/resume/seokhyun/home' />" class="active">Home</a></li>
          <li><a href="<c:url value='/resume/seokhyun/about' />">About</a></li>
          <li><a href="<c:url value='/resume/seokhyun/resume' />">Resume</a></li>
          <!--
          <li><a href="services.html">Services</a></li>
          <li><a href="portfolio.html">Portfolio</a></li>
          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#">Dropdown 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="#">Deep Dropdown 1</a></li>
                  <li><a href="#">Deep Dropdown 2</a></li>
                  <li><a href="#">Deep Dropdown 3</a></li>
                  <li><a href="#">Deep Dropdown 4</a></li>
                  <li><a href="#">Deep Dropdown 5</a></li>
                </ul>
              </li>
              <li><a href="#">Dropdown 2</a></li>
              <li><a href="#">Dropdown 3</a></li>
              <li><a href="#">Dropdown 4</a></li>
            </ul>
          </li>
          <li><a href="contact.html">Contact</a></li>
          -->
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
    </div>
  </header>

  <main class="main">
    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <!--<img src="<c:url value='/salguDevelopers/seokhyun/assets/img/seokhyun.jpg' />" alt="" data-aos="fade-in">-->
      <img src="<c:url value='/salguDevelopers/seokhyun/assets/img/koong.png' />" alt="" data-aos="fade-in">
      <div class="container" data-aos="zoom-out" data-aos-delay="100">
        <h2>Seokhyun Hwang</h2>
        <p>I <span class="typed" data-typed-items=" am Developer, love my Koong">I love my Koong</span><span class="typed-cursor typed-cursor--blink"></span></p>
        <div class="social-links">
          <a href="#"><i class="bi bi-twitter-x"></i></a>
          <a href="#"><i class="bi bi-facebook"></i></a>
          <a href="#"><i class="bi bi-instagram"></i></a>
          <a href="#"><i class="bi bi-linkedin"></i></a>
        </div>
      </div>
    </section><!-- /Hero Section -->
  </main>

  <footer id="footer" class="footer dark-background">
    <div class="container">
      <h3 class="sitename">shhwnag</h3>
      <p>누군가 다가와주길 기다리기보다 먼저 다가가 건네는 사람이 되고 싶었습니다.
      그래서 어려움을 겪는 동료들과 소통하며 대인관계에서 신뢰를 쌓았고
         이후에도 일을 추진함에 있어서 큰 성과를 가졌습니다.</p>
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
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
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
