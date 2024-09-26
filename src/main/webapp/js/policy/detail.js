document.addEventListener('DOMContentLoaded', function () {
  const tocList = document.querySelectorAll('.toc ul li a');
  const policyTitles = document.querySelectorAll('.policy-title');
  const policyTableContents = document.querySelectorAll(
      '.policy-table-content');

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
      if (!navmenulink.hash) {
        return;
      }
      let section = document.querySelector(navmenulink.hash);
      console.log(section);
      if (!section) {
        return;
      }
      let position = window.scrollY + 200;
      if (position >= section.offsetTop && position <= (section.offsetTop
          + section.offsetHeight)) {
        document.querySelectorAll('.navmenu a.active').forEach(
            link => link.classList.remove('active'));
        navmenulink.classList.add('active');
      } else {
        navmenulink.classList.remove('active');
      }
    })
  }

  window.addEventListener('load', navmenuScrollspy);
  document.addEventListener('scroll', navmenuScrollspy);

  // 모든 scrapBtn 요소를 가져옴
  const scrapButtons = document.querySelectorAll('.check');

  scrapButtons.forEach(button => {
    button.addEventListener('click', function (event) {
      // 클릭된 버튼의 policy code 가져오기
      const policyCode = button.getAttribute('data-policy-code');
      const scrapId = button.getAttribute('data-scrap-id');
      const checkbox = document.getElementById('scrapCheck');
      if (!checkbox.checked) {
        // 체크되어 있지 않으면 스크랩 등록 함수 호출
        console.log("Register: ", policyCode);
        registerScrap(policyCode);
      } else {
        // 체크되어 있으면 스크랩 삭제 함수 호출
        console.log("Delete: ", scrapId);
        deleteScrap(scrapId);
      }
    });

  });
});

//찜 API 연결
function registerScrap(policyCode) {
  $.ajax({
    method: 'POST',
    url: '/api/v1/scrap/register',
    contentType: "application/json; charset=utf-8",
    data: policyCode,
    success: function (response) {
      console.log(response);
      history.pushState(null, '', `/policy/detail/${policyCode}`);
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
      Swal.fire({
        title: '스크랩 실패',
        text: '스크랩 실패하였습니다.',
        icon: 'error',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      })
    }
  });
}

function deleteScrap(scrapId) {
  $.ajax({
        type: 'delete',
        url: `/api/v1/scrap/delete/${scrapId}`,
        data: scrapId,
        success: function (response) {
          console.log(response);
        },
        error: function (xhr, status, error) {
          console.log("Error: " + error);
          console.log("Status: " + status);
          console.log(xhr.responseText);
        }
      }
  )
}