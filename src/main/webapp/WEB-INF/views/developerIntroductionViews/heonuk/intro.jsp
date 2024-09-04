<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Hello, I'm Song Heon-uk</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com" rel="preconnect">
	<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
	<link
			href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
			rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link
			href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
	<link
			href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/bootstrap-icons/bootstrap-icons.css"
			rel="stylesheet">
	<link href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/aos/aos.css"
	      rel="stylesheet">
	<link
			href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/glightbox/css/glightbox.min.css"
			rel="stylesheet">
	<link
			href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/swiper/swiper-bundle.min.css"
			rel="stylesheet">
	
	<!-- Main CSS File -->
	<link href="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/css/main.css"
	      rel="stylesheet">
	
	<!-- Portfolio CSS File -->
	<link href="${pageContext.request.contextPath}/salguDevelopers/heonuk/portfolio-styles.css"
	      rel="stylesheet">
	
	<!-- =======================================================
	* Template Name: MyResume
	* Template URL: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/
	* Updated: Jun 29 2024 with Bootstrap v5.3.3
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->
</head>

<body class="index-page">

<header id="header" class="header d-flex flex-column justify-content-center">
	
	<i class="header-toggle d-xl-none bi bi-list"></i>
	
	<nav id="navmenu" class="navmenu">
		<ul>
			<li><a href="#hero" class="active"><i class="bi bi-house navicon"></i><span>Home</span></a>
			</li>
			<li><a href="#about"><i class="bi bi-person navicon"></i><span>About</span></a></li>
			<li><a href="#resume"><i class="bi bi-file-earmark-text navicon"></i><span>Resume</span></a>
			</li>
			<li><a href="#portfolio"><i class="bi bi-images navicon"></i><span>Portfolio</span></a></li>
		</ul>
	</nav>

</header>

<main class="main">
	
	<!-- Hero Section -->
	<section id="hero" class="hero section light-background">
		
		<img src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/hero-bg.png"
		     alt="">
		
		<div class="container" data-aos="zoom-out">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<h2>Song Heon Uk</h2>
					<p class="fst-italic py-1"></p>
					<p>👋 안녕하세요!</p>
					<p>🌱 성장형 <span class="typed"
					               data-typed-items="Back-End, Full-Stack, Server, API, Web"></span>개발자
						'송헌욱' 입니다!<span class="typed-cursor typed-cursor--blink"
						                aria-hidden="true"></span></p>
					<div class="social-links">
						<a href="https://github.com/IToriginal"><i class="bi bi-github"></i></a>
						<a href="https://www.instagram.com/evenaboringlife/"><i
								class="bi bi-instagram"></i></a>
						<a href="https://www.linkedin.com/in/%ED%97%8C%EC%9A%B1-%EC%86%A1-b58654275/"><i
								class="bi bi-linkedin"></i></a>
					</div>
				</div>
			</div>
		</div>
	
	</section><!-- /Hero Section -->
	
	<!-- About Section -->
	<section id="about" class="about section">
		
		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>About</h2>
		</div><!-- End Section Title -->
		
		<div class="container" data-aos="fade-up" data-aos-delay="100">
			<div class="row gy-4 justify-content-center">
				<div class="col-lg-4">
					<img
							src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/profile-img.jpg"
							class="img-fluid" alt="">
				</div>
				<div class="col-lg-8 content">
					<h2>👋 Hello, My Name is Song Heon-uk</h2>
					<p class="fst-italic py-1"></p>
					<div class="row">
						<ul>
							<li><i class="bi bi-chevron-right"></i> <strong>Birthdate:</strong>
								<span>1994. 11. 30</span></li>
							<li><i class="bi bi-chevron-right"></i> <strong>Email:</strong> <span>gitshineit@gmail.com</span>
							</li>
							<li><i class="bi bi-chevron-right"></i> <strong>Github:</strong>
								<span><a
										href="https://github.com/IToriginal">https://github.com/IToriginal</a></span>
							</li>
							<li><i class="bi bi-chevron-right"></i> <strong>Address:</strong>
								<span>서울 강서구 염창동</span>
							</li>
						</ul>
					</div>
					<p></p>
					<p>웹 서비스의 백엔드 설계, 개발 경험을 보유하고 있습니다.</p>
					<p>팀 프로젝트를 통해 팀원들과의 원할한 커뮤니케이션 능력을 키웠습니다.</p>
					<p>기계 설계 업무와 현장 설비 업무를 수행하면서 섬세한 주의력과 문제 해결 능력을 기를 수 있었습니다.</p>
				</div>
			</div>
		</div>
	</section><!-- /About Section -->
	
	<!-- Skills Section -->
	<section id="skills" class="skills section">
		
		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Skills</h2>
		</div><!-- End Section Title -->
		
		<div class="container" data-aos="fade-up" data-aos-delay="100">
			
			<div class="row skills-content skills-animation">
				
				<div class="col-lg-6">
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/HTML-E34F26?style=flat-square&logo=HTML5&logoColor=white"/>
	                <!-- HTML5 -->
                </span>
                <i class="val">60%</i>
              </span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="60"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/CSS-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
	                <!-- CSS3 -->
                </span>
                <i class="val">60%</i>
              </span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="60"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=black"/>
	                <!-- JS -->
                </span>
                <i class="val">60%</i>
              </span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="60"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
				
				</div>
				
				<div class="col-lg-6">
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/Java-000000?style=flat-square&logo=OpenJDK&logoColor=white"/>
	                <!-- JAVA-->
                  <img
		                  src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>
	                <!-- Spring-->
                </span> <i class="val">90%</i></span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="90"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>
	                <!-- Oracle -->
                  <img
		                  src="https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=MariaDB&logoColor=white"/>
	                <!-- MariaDB -->
                </span>
                <i class="val">80%</i>
              </span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="80"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
					
					<div class="progress">
              <span class="skill">
                <span>
                  <img
		                  src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=Docker&logoColor=white"/>
	                <!-- Docker -->
                  <img
		                  src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white"/>
	                <!-- AWS -->
                </span>
                <i class="val">50%</i>
              </span>
						<div class="progress-bar-wrap">
							<div class="progress-bar" role="progressbar" aria-valuenow="50"
							     aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div><!-- End Skills Item -->
				
				</div>
			
			</div>
		
		</div>
	
	</section><!-- /Skills Section -->
	
	<!-- Resume Section -->
	<section id="resume" class="resume section">
		
		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Resume</h2>
			<p>성장을 위해 포기하지 않는 능동적인 자세를 갖추고 있습니다.</p>
			<p>혼자 성장하는 것보다 '함께' 성장해 나가는 것이 의미있다고 생각합니다.
			<p>동료와 함께 문제 상황을 공유하거나 문제 해결 경험을 공유하여 '같이' 성장하는 문화를 조성합니다.</p>
		</div><!-- End Section Title -->
		
		<div class="container">
			
			<div class="row">
				
				<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
					<h3 class="resume-title">Education</h3>
					
					<div class="resume-item">
						<h4>경성대학교</h4>
						<h6>메카트로닉스공학과</h6>
						<h5>2013.03 ~ 2019.08</h5>
					</div>
					
					<div class="resume-item">
						<h4>부산컴퓨터과학고등학교</h4>
						<h6>소프트웨어과</h6>
						<h5>2010.03 ~ 2013.02</h5>
					</div>
					
					<h3 class="resume-title">Training</h3>
					<div class="resume-item">
						<h4>시스원 채용연계형 1기 공공SI SW개발자 전문가 양성과정</h4>
						<h5>2024.06 - Present</h5>
						<p>Java, Spring, MyBatis, HTML, CSS, JavaScript(ES6), JSP, Oracle</p>
					</div><!-- Edn Resume Item -->
					<div class="resume-item">
						<h4>카카오 클라우드 스쿨 2기 개발자 양성과정</h4>
						<h5>2022.11 - 2023.05</h5>
						<p>Java, Springboot, Spring Data JPA, React, Docker, AWS, MaraiDB</p>
					</div><!-- Edn Resume Item -->
				</div>
				
				<div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
					<h3 class="resume-title">Professional Experience</h3>
					<div class="resume-item">
						<h4>수산인더스트리[비개발]</h4>
						<h5>2022.04 - 2022.09</h5>
						<p><em>발전 설비 유지 보수 공사</em></p>
						<ul>
							<li>고리사업소 기계2팀</li>
							<li>원자력 발전소 2차 복수기기 경상정비</li>
						</ul>
					</div><!-- Edn Resume Item -->
					
					<div class="resume-item">
						<h4>KTE[비개발]</h4>
						<h5>2020.07 - 2021.12</h5>
						<p><em>선박 보조 추진 장치 Side Thruster 제품 설계</em></p>
						<ul>
							<li>의장설계팀</li>
							<li>선급 Rule 검토, 기계 제품 설계 및 BOM 작성, 고객사 기술 대응</li>
						</ul>
					</div><!-- Edn Resume Item -->
				
				</div>
			
			</div>
		
		</div>
	
	</section><!-- /Resume Section -->
	
	<!-- Portfolio Section -->
	<section id="portfolio" class="portfolio section">
		
		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Portfolio</h2>
		</div><!-- End Section Title -->
		
		<div class="container">
			<div class="isotope-item blog-card" data-aos="fade-up" data-aos-delay="200">
				<div class="meta">
					<div class="photo"
					     style="background-image: url(${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/portfolio/salgu_logo.png); background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
				</div>
				<div class="description">
					<h1>살구: 살기 좋은 지역구</h1>
					<h2>정보 제공 서비스</h2>
					<p></p>
					<b>🗓️ 2024. 09 ~ 2024. 10 (3 Weeks)</b>
					<p>청년들이 살기 좋은 지역구를 추천 서비스 입니다.</p>
					<p>서울 지역구에서 청년들에게 제공하는 혜택을 공공데이터 API를 통해 분석 후 추천하는 서비스 입니다.</p>
					<p></p>
					<h5>Skills</h5>
					<img
							src="https://img.shields.io/badge/JSP-000000?style=flat-square&logo=Google Docs&logoColor=white"/>
					<!-- JSP -->
					<img
							src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/>
					<!-- Spring Boot -->
					<img
							src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>
					<!-- Oracle -->
					<img
							src="https://img.shields.io/badge/Github Action-2088FF?style=flat-square&logo=Github Actions&logoColor=white"/>
					<!-- Github Action -->
					<img
							src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white"/>
					<!-- AWS -->
					<img
							src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=Docker&logoColor=white"/>
					<!-- Docker -->
					<p class="read-more">
						<a href="https://github.com/Team-Apricot" class="read-more-btn">GitHub
							URL</a>
					</p>
				</div>
			</div>
			
			<div class="isotope-layout" data-default-filter="*" data-layout="masonry"
			     data-sort="original-order">
				<div class="isotope-item blog-card alt" data-aos="fade-up" data-aos-delay="300">
					<div class="meta">
						<div class="photo"
						     style="background-image: url(${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/portfolio/checkmate_logo.png); background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
					</div>
					<div class="description">
						<h1>CheckMate</h1>
						<h2>시스원 도서 관리 시스템</h2>
						<p></p>
						<b>🗓️ 2024. 07 ~ 2024. 08 (2 Weeks)</b>
						<p>사내 복지 시설인 북카페를 활성화하고, 여러 종류의 도서를 관리하는 시스템 프로그램입니다.</p>
						<p>도서를 등록하고 등록한 도서를 대여, 반납할 수 있고, 도서 신청을 통해 사용자가 신청한 도서 정보를 관리자 계정으로 모두 확인
							가능합니다.</p>
						<p></p>
						<h5>Skills</h5>
						<img
								src="https://img.shields.io/badge/JavaFX-000000?style=flat-square&logo=OpenJDK&logoColor=white"/>
						<!-- JAVA FX -->
						<img
								src="https://img.shields.io/badge/Java-000000?style=flat-square&logo=OpenJDK&logoColor=white"/>
						<!-- JAVA-->
						<img
								src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>
						<!-- Oracle -->
						<p class="read-more">
							<a href="https://github.com/SysoneEduTeam4/CheckMate"
							   class="read-more-btn">GitHub URL</a>
						</p>
					</div>
				</div>
				
				<div class="isotope-item blog-card" data-aos="fade-up" data-aos-delay="400">
					<div class="meta">
						<div class="photo"
						     style="background-image: url(${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/portfolio/saramara_logo.png); background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
					</div>
					<div class="description">
						<h1>사라마라</h1>
						<h2>사용자 커뮤니티 서비스</h2>
						<p></p>
						<b>🗓️ 2024. 02 ~ 2024.03 (1 Month)</b>
						<p>어떤 물건이나 제품을 구매하기 전에 "살까? 말까?" 망설이던 고민을 다른 사람들에게 사진 이미지와 텍스트로 공유하고 투표를 진행할
							수 있는 커뮤니티 서비스 입니다.</p>
						<p></p>
						<h5>Skills</h5>
						<img
								src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/>
						<!-- Spring Boot -->
						<img
								src="https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=MariaDB&logoColor=white"/>
						<!-- MariaDB -->
						<img
								src="https://img.shields.io/badge/AWS S3-569A31?style=flat-square&logo=Amazon S3&logoColor=white"/>
						<!-- Amazon S3 -->
						<img
								src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=Docker&logoColor=white"/>
						<!-- Docker -->
						<p class="read-more">
							<a href="https://github.com/four-uncles/saramara-community-server"
							   class="read-more-btn">GitHub URL</a>
						</p>
					</div>
				</div>
				<div class="isotope-item blog-card alt" data-aos="fade-up" data-aos-delay="500">
					<div class="meta">
						<div class="photo"
						     style="background-image: url(${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/img/portfolio/hat_logo.png); background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
					</div>
					<div class="description">
						<h1>HAT: How's the air today</h1>
						<h2>날씨, 대기 정보 제공 서비스</h2>
						<p></p>
						<b>🗓️ 2023. 02 ~ 2023. 04 (2 Months)</b>
						<p>사용자의 위치를 기반으로 한 커뮤니티 서비스를 활용하여 실제 날씨를 이미지로 서로 공유할 수 있습니다.</p>
						<p>공공데이터 API를 활용해 대기 상태의 수치를 색상으로 시각화하여 보여주는 서비스를 제공합니다.</p>
						<p></p>
						<h5>Skills</h5>
						<img
								src="https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=TypeScript&logoColor=white"/>
						<!-- TypeScript -->
						<img
								src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/>
						<!-- Spring Boot -->
						<img
								src="https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=MariaDB&logoColor=white"/>
						<!-- MariaDB -->
						<img
								src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white"/>
						<!-- AWS -->
						<img
								src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=Docker&logoColor=white"/>
						<!-- Docker -->
						<img
								src="https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=Jenkins&logoColor=white"/>
						<!-- Jenkins -->
						<img
								src="https://img.shields.io/badge/ArgoCD-EF7B4D?style=flat-square&logo=Argo&logoColor=white"/>
						<!-- ArgoCD -->
						<p class="read-more">
							<a href="https://github.com/Hows-the-Air-Today" class="read-more-btn">GitHub
								URL</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section><!-- /Portfolio Section -->
</main>

<footer id="footer" class="footer position-relative light-background">
	<h3 class="sitename">Thank you. My name is Song Heon-uk</h3>
	
	<span>Copyright</span> <strong class="px-1 sitename">Alex Smith</strong>
	<span>All Rights Reserved</span>
	<div class="credits">
		<!-- All the links in the footer should remain intact. -->
		<!-- You can delete the links only if you've purchased the pro version. -->
		<!-- Licensing information: https://bootstrapmade.com/license/ -->
		<!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
		Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
	</div>
	</div>
</footer>

<!-- Scroll Top -->
<a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

<!-- Preloader -->
<div id="preloader"></div>

<!-- Vendor JS Files -->
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/aos/aos.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/typed.js/typed.umd.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script
		src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Main JS File -->
<script src="${pageContext.request.contextPath}/salguDevelopers/heonuk/assets/js/main.js"></script>

</body>

</html>