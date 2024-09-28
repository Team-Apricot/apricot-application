<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>About - shhwang Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/favicon.png'/>" rel="icon">
  <link href="<c:url value='/salguDevelopers/seokhyun/assets/img/apple-touch-icon.png'/>" rel="apple-touch-icon">

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

<body class="about-page">

  <!-- Header -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <!--<a href="index.html" class="logo d-flex align-items-center"> -->
      <a href="<c:url value='/resume/seokhyun/home' />" class="logo d-flex align-items-center">
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
    <!-- Page content here -->
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="heading">
        <div class="container">
          <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-8">
              <h1>정확히 알고 즐겁게 일하는 개발자 황석현입니다.</h1>
              <p class="mb-0">먼저 서버와 통신하기 위해서는 엔티티 관계를 파악해야합니다.<br>이러한 관계와 프로세스를 파악하기 위해 시스템 분석설계와 메시지 추적하는 것을 좋아합니다.</p>
            </div>
          </div>
        </div>
      </div>
      <nav class="breadcrumbs">
        <div class="container">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">About</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Page Title -->

    <!-- About Section -->
    <section id="about" class="about section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4 justify-content-center">
          <div class="col-lg-4">
            <img src="<c:url value='/salguDevelopers/seokhyun/assets/img/seokhyun(2).jpg' />" alt="" data-aos="fade-in">
          </div>
          <div class="col-lg-8 content">
            <h2>Full Stack Developer &amp; SI Developer.</h2>
            <p class="fst-italic py-3">
              고객입장에서 생각하는 전문개발자
            </p>
            <div class="row">
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Birthday:</strong> <span>1994.10.04</span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>City:</strong> <span>경기 성남시 분당구</span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Certificate:</strong> <span>Salesforce Administrator</span></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Age:</strong> <span>31</span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Degree:</strong> <span>상명대학교 소프트웨어학 학사</span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Email:</strong> <span>dev.shhwang@gmail.com</span></li>
                </ul>
              </div>
            </div>
            <p class="py-3">
              향후 IT전문개발자로 성장하여 회사 발전에 기여하고 싶습니다. 이를 위해서 특히 IT 부분에 대한 업무 경험과 이해도를 높여야 하므로 해당 프로세스
              와 전문 분야의 기술을 더 많이 습득하고 싶고 시스템의 분석 설계를 많이 다루어 그것을 기반으로 개발하고 운영을 하며 해당 분야의 전문가가 되고
              싶습니다.
            </p>
          </div>
        </div>

      </div>

    </section><!-- /About Section -->

    <!-- Stats Section -->
    <section id="stats" class="stats section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-emoji-smile"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="2" data-purecounter-duration="1" class="purecounter"></span>
              <p>My career period</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-journal-richtext"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="5" data-purecounter-duration="1" class="purecounter"></span>
              <p>Projects</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-headset"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" class="purecounter"></span>
              <p>Hours Of Support</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-people"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" class="purecounter"></span>
              <p>Hard Workers</p>
            </div>
          </div><!-- End Stats Item -->

        </div>

      </div>

    </section><!-- /Stats Section -->

    <!-- Skills Section -->
    <section id="skills" class="skills section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Skills</h2>
        <div><span>My</span> <span class="description-title">Skills</span></div>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row skills-content skills-animation">

          <div class="col-lg-6">

            <div class="progress">
              <span class="skill"><span>JAVA</span> <i class="val">100%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

            <div class="progress">
              <span class="skill"><span>JavaScript/JSP/Jquery/Ajax</span> <i class="val">90%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

            <div class="progress">
              <span class="skill"><span>Jenkins/Bomboo/Jira/GIT/SVN</span> <i class="val">75%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

          </div>

          <div class="col-lg-6">

            <div class="progress">
              <span class="skill"><span>RDBMS</span> <i class="val">80%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

            <div class="progress">
              <span class="skill"><span>SPRING/SPRING BOOT/STS</span> <i class="val">90%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

            <div class="progress">
              <span class="skill"><span>Websquare</span> <i class="val">55%</i></span>
              <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div><!-- End Skills Item -->

          </div>

        </div>

      </div>

    </section><!-- /Skills Section -->

    <!-- Interests Section -->
    <section id="interests" class="interests section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Features</h2>
        <div><span>I'm</span> <span class="description-title">interested in</span></div>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="100">
            <div class="features-item">
              <i class="bi bi-eye" style="color: #ffbb2c;"></i>
              <h3><a href="" class="stretched-link">POSCO ICT</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="200">
            <div class="features-item">
              <i class="bi bi-infinity" style="color: #5578ff;"></i>
              <h3><a href="" class="stretched-link">SYSONE</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="300">
            <div class="features-item">
              <i class="bi bi-mortarboard" style="color: #e80368;"></i>
              <h3><a href="" class="stretched-link">SECUI</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="400">
            <div class="features-item">
              <i class="bi bi-nut" style="color: #e361ff;"></i>
              <h3><a href="" class="stretched-link">KOSA</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="500">
            <div class="features-item">
              <i class="bi bi-shuffle" style="color: #47aeff;"></i>
              <h3><a href="" class="stretched-link">BOOT STRAP</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="600">
            <div class="features-item">
              <i class="bi bi-star" style="color: #ffa76e;"></i>
              <h3><a href="" class="stretched-link">SCM</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="700">
            <div class="features-item">
              <i class="bi bi-x-diamond" style="color: #11dbcf;"></i>
              <h3><a href="" class="stretched-link">ERP</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="800">
            <div class="features-item">
              <i class="bi bi-camera-video" style="color: #4233ff;"></i>
              <h3><a href="" class="stretched-link">GIT</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="900">
            <div class="features-item">
              <i class="bi bi-command" style="color: #b2904f;"></i>
              <h3><a href="" class="stretched-link">Jenkins</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1000">
            <div class="features-item">
              <i class="bi bi-dribbble" style="color: #b20969;"></i>
              <h3><a href="" class="stretched-link">Bamboo</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1100">
            <div class="features-item">
              <i class="bi bi-activity" style="color: #ff5828;"></i>
              <h3><a href="" class="stretched-link">Atlassian</a></h3>
            </div>
          </div><!-- End Feature Item -->

          <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1200">
            <div class="features-item">
              <i class="bi bi-brightness-high" style="color: #29cc61;"></i>
              <h3><a href="" class="stretched-link">Flavor Nivelanda</a></h3>
            </div>
          </div><!-- End Feature Item -->

        </div>

      </div>

    </section><!-- /Interests Section -->

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Testimonials</h2>
        <div><span>Check my</span> <span class="description-title">Testimonials</span></div>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper" data-speed="600" data-delay="5000" data-breakpoints="{ &quot;320&quot;: { &quot;slidesPerView&quot;: 1, &quot;spaceBetween&quot;: 40 }, &quot;1200&quot;: { &quot;slidesPerView&quot;: 3, &quot;spaceBetween&quot;: 40 } }">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "1200": {
                  "slidesPerView": 3,
                  "spaceBetween": 20
                }
              }
            }
          </script>
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item" "="">
            <p>
              <i class=" bi bi-quote quote-icon-left"></i>
                <span>Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.</span>
                <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <img src="/salguDevelopers/seokhyun/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Founder</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <img src="/salguDevelopers/seokhyun/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <img src="/salguDevelopers/seokhyun/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <img src="/salguDevelopers/seokhyun/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <img src="/salguDevelopers/seokhyun/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->

  </main>

  <!-- Footer -->
  <footer id="footer" class="footer dark-background">
    <div class="container">
      <h3 class="sitename">shhwang</h3>
      <p>수행했던 CRM과 HRM 구축시 유치고객 확보와 잠재고객 마케팅에 필요한 고객성향 분석 등을 공유, 이들 정보를 조직내 처리하며 프로세스 업무 에 대해 문서화 및 체계화 하는 관리의 중요성을 체감했습니다.</p>
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
          Designed by <a href="https://bootstrapmade.com/">shhwang</a>
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
