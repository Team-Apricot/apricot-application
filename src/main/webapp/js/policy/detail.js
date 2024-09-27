document.addEventListener('DOMContentLoaded', function () {
  const tocList = document.querySelectorAll('.toc ul li a');
  const policyTitles = document.querySelectorAll('.policy-title');
  const policyTableContents = document.querySelectorAll(
      '.policy-table-content');

  const avgScore = parseFloat(
      document.getElementById("avg-score").getAttribute("data-score")).toFixed(
      2); // 소수점 둘째 자리까지
  document.getElementById("avg-score").innerText = avgScore; // 평균 점수 업데이트

  const roundedScore = Math.round(avgScore * 2) / 2; // 반올림 처리 (0.5 단위로)

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

//리뷰 모달 열기
function openReviewModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const reviewModal = document.querySelector('.review-modal');

  hiddenBackground.style.display = 'flex';
  reviewModal.style.display = 'flex';
}

//리뷰 모달 닫기
function closeReviewModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const reviewModal = document.querySelector('.review-modal');

  hiddenBackground.style.display = 'none';
  reviewModal.style.display = 'none';
}

//hidden-background 클릭시 모달 닫기
document.addEventListener('DOMContentLoaded', function () {
  const hiddenBackground = document.querySelector('.hidden-background');
  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeReviewModal);
  }
});

// 정책 평점 리뷰 저장 기능.
$(document).ready(function () {
  // URL에서 policyCode 추출
  const policyCode = getPolicyCodeFromUrl();

  // "확인" 버튼 클릭 시 실행되는 함수
  $('.btn').on('click', function () {
    // 선택된 별점 값을 가져옴
    const selectedStar = $('input[name="reviewStar"]:checked').val();

    // 별점이 선택되지 않았을 경우 경고 표시
    if (!selectedStar) {
      alert('별점을 선택해주세요.');
      return;
    }

    // policyCode가 null이 아닌지 확인
    if (!policyCode) {
      alert('정책 코드를 찾을 수 없습니다.');
      return;
    }

    // AJAX 요청을 통해 서버로 평점 데이터를 전송
    $.ajax({
      url: '/api/v1/policy',  // 서버의 엔드포인트 URL
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        policyCode: policyCode, // URL에서 추출한 정책 코드
        policyScore: selectedStar // 선택한 별점 값
      }),
      success: function (response) {
        console.log(response);
        if (response.code == 200) {
          Swal.fire('평점이 성공적으로 제출되었습니다.','리뷰해주셔서 감사합니다!','success').then(
              function () {
                closeReviewModal(); // 모달 닫기 함수 호출
                // 페이지 새로 고침
                location.reload();
              }
          );

        } else {
          Swal.fire('평점 제출에 실패했습니다.','다시 시도해 주세요', 'failure');
        }
      },
      error: function (xhr, status, error) {
        console.error('AJAX Error: ', error);
        alert('서버 요청 중 오류가 발생했습니다.');
      }
    });
  });
});

// 현재 URL에서 policyCode를 추출하는 함수
function getPolicyCodeFromUrl() {
  const url = window.location.href; // 현재 페이지의 URL 가져오기
  const segments = url.split('/');  // 슬래시(/)를 기준으로 URL을 분리
  return segments[segments.length - 1];  // 마지막 부분이 policyCode라고 가정
}