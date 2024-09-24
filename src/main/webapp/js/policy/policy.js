document.addEventListener('DOMContentLoaded', () => {
  const statusElements = document.querySelectorAll('.policy-status'); //정책 상태 받아오기

  statusElements.forEach(element => {
    const statusText = element.textContent.trim();

    let statusClass = '';

    switch (statusText) { //statusText 메시지에 따라 class네임 변경하기 위한 switch문
      case '상시':
        statusClass = 'time';
        break;
      case '진행중':
        statusClass = 'progress';
        break;
      case '마감':
        statusClass = 'end';
        break;
      default:
        statusClass = 'end'; // 기본 클래스 또는 처리 없음
        break;
    }

    // 동적으로 클래스 추가
    if (statusClass) {
      element.classList.add(statusClass);
    }
  });
});

document.addEventListener('DOMContentLoaded', function () {
  // 모든 scrapBtn 요소를 가져옴
  const scrapButtons = document.querySelectorAll('.scrapBtn');

  scrapButtons.forEach(button => {
    button.addEventListener('click', function (event) {
      // 클릭된 버튼의 policy code 가져오기
      const policyCode = button.getAttribute('data-policy-code');

      // 스크랩 버튼 안에 있는 아이콘 요소 가져오기
      const icon = button.querySelector('i');

      // 아이콘 클래스 토글
      if (icon.classList.contains('fa-regular')) {
        icon.classList.remove('fa-regular');
        icon.classList.add('fa-solid'); // 눌렀을 때의 아이콘 클래스
      } else {
        icon.classList.remove('fa-solid');
        icon.classList.add('fa-regular'); // 원래 상태로 돌아갈 클래스
      }

      // 검색 필드에서 policyName 가져오기
      const policyName = document.getElementById('search-id').value;

      // 스크랩 등록 함수 호출
      console.log(policyCode);
      registerScrap(policyCode);

      // 이벤트 전파 막기
      event.stopPropagation();
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
      location.href = "/policy/searchpolicy?policy-search-name="; //화면 이동 ( 변경 필요)
      alert("찜이 성공적으로 되었습니다..");
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//관심있는 정책 눌렀을 때 해당 정책 세부 페이지로 이동
function goToPolicy(policyCode) {
  console.log(policyCode);
  window.location.href = `/policy/detail/${policyCode}`;
}

