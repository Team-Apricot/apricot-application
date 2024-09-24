function getDistrictCodeFromURL() {
  const params = new URLSearchParams(window.location.search);
  return params.get('districtCode');
}

let selectedCategory = '';

document.addEventListener('DOMContentLoaded', function () {
  const seoulMap = document.getElementById('seoul-map'); // 서울 지도 SVG 파일을 가져오는 요소
  let curDistrictCode = null; // 현재 클릭된 지역구
  const districtCodeFromURL = getDistrictCodeFromURL(); // URL에서 districtCode 파라미터 가져오기

  if (districtCodeFromURL) {
    ajaxDistrictPolicies(districtCodeFromURL, 1, selectedCategory); // 정책 데이터 자동 로드
  }

  setupCategoryButtons(); // 카테고리 버튼 클릭 이벤트

  seoulMap.addEventListener('load', function () {
    const svgDoc = seoulMap.contentDocument; // SVG 파일의 문서 객체 가져오기
    const districts = svgDoc.querySelectorAll('path.district'); // 각 지역구를 나타내는 path 요소

    districts.forEach(district => {
      // 마우스 오버 이벤트
      district.addEventListener('mouseover', function () {
        this.style.fill = '#D29660'; // 색상 변경
      });

      // 마우스 아웃 이벤트
      district.addEventListener('mouseout', function () {
        this.style.fill = ''; // 원래 색상으로 되돌리기
      });

      // 클릭 이벤트
      district.addEventListener('click', function () {
        // 기존에 클릭된 지역구의 clicked 상태 해제 (단, 현재 클릭된 지역구는 유지)
        if (curDistrictCode) {
          curDistrictCode.classList.remove('clicked');
        }

        // 새로운 지역구를 클릭 상태로 설정
        this.classList.add('clicked');
        curDistrictCode = this; // 현재 클릭된 지역구를 저장

        // 클릭한 지역구로 변경
        const districtCode = this.id;
        history.pushState(
            null, '',
            `${window.location.origin}/policy?districtCode=${encodeURIComponent(
                districtCode)}`
        );

        currentPage = 1;
        ajaxDistrictPolicies(districtCode, currentPage, selectedCategory);

        $.ajax({
          url: `/api/v1/policy/district`,
          type: 'GET',
          data: {districtCode: districtCode},
          dataType: 'json', // 서버에서 JSON 형식으로 응답
          success: response => {
            const data = response.data;
            $('#region-logo').attr('src', data.districtLogoPath); // 로고 업데이트
            $('#selected-region-title').text(`서울시 ${data.districtName}`); // 제목 업데이트
            $('#selected-region-description').text(data.districtSlogan); // 슬로건 업데이트
          },
          error: function (xhr, status, error) {
            console.error('Error data:', status, error);
          }
        })
      });

      // URL에서 가져온 districtCode에 해당하는 지역구 클릭 상태 유지
      if (districtCodeFromURL) {
        const targetDistrict = svgDoc.getElementById(districtCodeFromURL);
        if (targetDistrict) {
          targetDistrict.classList.add('clicked');
          curDistrictCode = targetDistrict;
        }
      }
    });
  });
});

// 카테고리 버튼 설정 함수
function setupCategoryButtons() {
  const buttons = document.querySelectorAll('.category-btn');

  buttons.forEach(button => {
    button.addEventListener('click', function () {
      selectedCategory = this.dataset.category || ''; // 버튼의 데이터 카테고리 값
      console.log("여기요!!" + selectedCategory);
      const districtCode = getDistrictCodeFromURL();

      ajaxDistrictPolicies(districtCode, 1, selectedCategory); // 선택된 카테고리로 정책 조회

      // 선택된 버튼 스타일 변경
      buttons.forEach(btn => btn.classList.remove('selected'));
      this.classList.add('selected'); // 선택된 버튼에 active 클래스 추가
    });
  });
}

function ajaxDistrictPolicies(districtCode, page = 1, category = '') {
  let data = {
    districtCode: districtCode,
    page: page,
  };

  if (category !== '') {
    data.categoryCode = category;
  }

  $.ajax({
    url: `/api/v1/policy/district-list`,
    type: 'GET',
    data: data,
    dataType: 'json',
    success: response => {
      console.log('Response:', response); // 응답 로그 추가
      renderPolicies(response.data.policies);
      setupPagination(response.data.totalPages, page, selectedCategory);
    },
    error: function (xhr, status, error) {
      console.error('Error data:', status, error);
    }
  });
}

// 정책 정보를 렌더링하는 함수
function renderPolicies(policies) {
  const grid = $('#grid');
  grid.empty(); // 기존 내용 제거

  policies.forEach(policy => {
    let policyClass = "";

    if (policy.prdRpttSecd === "상시") {
      policyClass = "time";
    } else if (
        policy.prdRpttSecd === "연간반복" ||
        policy.prdRpttSecd === "월간반복" ||
        policy.prdRpttSecd === "특정기간"
    ) {
      policyClass = "progress";
    } else if (policy.prdRpttSecd === "미정") {
      policyClass = "end";
    }

    const policyItem =
        `<div class="event-card" onClick="window.location.href='/policy/detail/${policy.policyCode}'">
          <div class="policy-title">${policy.policyName}</div>
          <div class="status ${policyClass}">
            ${policy.prdRpttSecd}
          </div>
        </div>`;
    grid.append(policyItem);
  });
}

// 페이지네이션 설정 함수
let currentPage = 1; // 초기 페이지 설정

function setupPagination(totalPages, currentPage, selectedCategory) {
  const pagination = $('.pagination');
  pagination.empty(); // 기존 내용 제거

  const maxPagesToShow = 5; // 최대 페이지 수
  let startPage = Math.max(1, currentPage - Math.floor(maxPagesToShow / 2));
  let endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

  if (endPage - startPage < maxPagesToShow - 1) {
    startPage = Math.max(1, endPage - maxPagesToShow + 1);
  }

  if (currentPage > 1) {
    pagination.prepend(
        '<li class="arrow"><a href="#" id="prev-page">&lt;</a></li>');
  }

  for (let i = startPage; i <= endPage; i++) {
    const pageItem = `<li><a href="#" class="page-number ${i === currentPage
        ? 'selected' : ''}" data-page="${i}">${i}</a></li>`;
    pagination.append(pageItem);
  }

  if (currentPage < totalPages) {
    pagination.append(
        '<li class="arrow"><a href="#" id="next-page">&gt;</a></li>');
  }

  $('.page-number').on('click', function (e) {
    e.preventDefault();
    const selectedPage = $(this).data('page');
    const districtCode = getDistrictCodeFromURL();
    ajaxDistrictPolicies(districtCode, selectedPage, selectedCategory);
  });

  $('#prev-page').on('click', function (e) {
    e.preventDefault();
    if (currentPage > 1) {
      currentPage--; // 현재 페이지 감소
      ajaxDistrictPolicies(getDistrictCodeFromURL(), currentPage,
          selectedCategory);
    }
  });

  $('#next-page').on('click', function (e) {
    e.preventDefault();
    if (currentPage < totalPages) {
      currentPage++; // 현재 페이지 증가
      ajaxDistrictPolicies(getDistrictCodeFromURL(), currentPage,
          selectedCategory);
    }
  });
}
