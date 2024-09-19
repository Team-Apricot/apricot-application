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

//비밀변경 모달 열기
function openUpdatePwModal(){
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

//정보수정 모달 열기
function openUpdateInfoModal(){
  document.querySelector('.hidden-background').style.display = 'block';
  document.querySelector('.updateInfo-modal').style.display = 'block';
  document.querySelector('.mypage-container').style.pointerEvents = 'none';

}

//정보수정 모달 닫기
function closeUpdateInfoModal() {
  document.querySelector('.hidden-background').style.display = 'none';
  document.querySelector('.updateInfo-modal').style.display = 'none';
  document.querySelector('.mypage-container').style.pointerEvents = 'auto';
}

//모달 밖에 선택했을 때 모달창 닫기
document.querySelector('.hidden-background').addEventListener('click', closeUpdatePwModal);
document.querySelector('.hidden-background').addEventListener('click', closeUpdateInfoModal);
