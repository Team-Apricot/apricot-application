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

  // 검색결과 없을 때 메시지 띄우기
  const policyCnt = parseInt(document.getElementById('policycnt').textContent);
  if(policyCnt===0){
    const noSearchResultDiv = document.querySelector('.noSearchResult');
    const searchDetail = document.querySelector('.search-detail');
    searchDetail.style.minHeight="20px";
    noSearchResultDiv.style.display = "flex";
    noSearchResultDiv.innerHTML="검색 결과가 없습니다.";
    noSearchResultDiv.style.height="500px";
  }


});

//관심있는 정책 눌렀을 때 해당 정책 세부 페이지로 이동
function goToPolicy(policyCode) {
  console.log(policyCode);
  window.location.href = `/policy/detail/${policyCode}`;
}

