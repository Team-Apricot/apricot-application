document.addEventListener('DOMContentLoaded', function () {
  const tocList = document.querySelectorAll('.toc ul li a');
  const policyTitles = document.querySelectorAll('.policy-title');
  const policyTableContents = document.querySelectorAll(
      '.policy-table-content');

  const avgScore = document.getElementById("avg-score").getAttribute("data-score");
  const roundedScore = Math.round(avgScore); // 반올림 처리

  // 해당하는 라디오 버튼을 checked 상태로 설정
  if (roundedScore > 0) {
    const radioButton = document.getElementById(`star${roundedScore}`);
    if (radioButton) {
      radioButton.checked = true;
    }
  }

  tocList.forEach((toc) => {
    // 부드러운 스크롤 기능
    toc.addEventListener('click', function (e) {
      e.preventDefault();
      const targetElement = document.querySelector(this.getAttribute('href'));
      window.scrollTo({
        top: targetElement.offsetTop,
        behavior: 'smooth'
      });
    });
  });

  // Intersection Observer로 등장 애니메이션 적용
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      } else {
        entry.target.classList.remove('visible');
      }
    });
  }, {
    threshold: 0.1 // 요소가 10% 보이면 동작
  });

  // 각 policy-title과 policy-table-content 요소에 관찰자 추가
  [...policyTitles, ...policyTableContents].forEach(section => {
    observer.observe(section);
  });

  /**
   * Navmenu Scrollspy
   */
  let navmenulinks = document.querySelectorAll('.navmenu a');

  function navmenuScrollspy() {
    navmenulinks.forEach(navmenulink => {
      if (!navmenulink.hash) return;
      let section = document.querySelector(navmenulink.hash);
      if (!section) return;
      let position = window.scrollY + 200;
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        document.querySelectorAll('.navmenu a.active').forEach(link => link.classList.remove('active'));
        navmenulink.classList.add('active');
      } else {
        navmenulink.classList.remove('active');
      }
    });
  }

  window.addEventListener('load', navmenuScrollspy);
  document.addEventListener('scroll', navmenuScrollspy);
});
