document.addEventListener('DOMContentLoaded', () => {
  const statusElements = document.querySelectorAll('.policy-status'); //정책 상태 받아오기

  statusElements.forEach(element => {
    const statusText = element.textContent.trim();

    let statusClass = '';

    switch (statusText) { //statusText 메시지에 따라 class네임 변경하기 위한 switch문
      case '상시':
        statusClass = 'time';
        break;
      case '월간반복':
      case '연간반복':
      case '특정기간':
        statusClass = 'progress';
        break;
      case '미정':
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

  const hiddenBackground = document.querySelector('.hidden-background');
  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeUpdatePwModal);
  } else {
    console.error('.hidden-background not found');
  }
});

//비밀변경 모달 열기
function openUpdatePwModal() {
  document.querySelector('.hidden-background').style.display = 'block';
  document.querySelector('.updatePassword-modal').style.display = 'block';
  document.querySelector('.mypage-container').style.pointerEvents = 'none';
}

//비밀변경 모달 닫기
function closeUpdatePwModal() {
  document.querySelector('.hidden-background').style.display = 'none';
  document.querySelector('.updatePassword-modal').style.display = 'none';
  document.querySelector('.mypage-container').style.pointerEvents = 'auto';
}

document.querySelector('.hiddenBackground').addEventListener('click',
    closeUpdatePwModal);

//정보수정 페이지 이동
function goToUpdateInfo() {
  location.href = "/update";
}

// 모달 밖에 선택했을 때 모달창 닫기
document.addEventListener('DOMContentLoaded', () => {

  const hiddenBackground = document.querySelector('.hidden-background');
  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeUpdatePwModal);
  } else {
    console.error('.hidden-background not found');
  }
})



//관심있는 정책 눌렀을 때 해당 정책 세부 페이지로 이동
function goToPolicy(policyCode) {
  console.log(policyCode);
  window.location.href = `/policy/detail/${policyCode}`;
}

