function mymodalclick() { //모달 클릭시
  let modal = document.querySelector('.my-modal');
  modal.style.display = (modal.style.display === 'flex') ? 'none' : 'flex';

  let triangle = document.querySelector('.triangle');
  triangle.style.display = (triangle.style.display === 'flex') ? 'none'
      : 'flex';

}

function gotoMyPage() { //마이페이지 버튼 클릭시
  location.href = "/mypage";
}

function gotoHome() { //홉 로고 클릭시
  location.href = "/";
}


// TODO: 혜택 검색 작업 이후 삭제 예정
// document.addEventListener('DOMContentLoaded', function() {
//   const searchButton = document.querySelector('.search-btn');
//   const searchInput = document.getElementById('search-id');
//
//   searchButton.addEventListener('click', function(e) {
//     e.preventDefault(); // 폼 제출 방지
//     const query = searchInput.value.trim();
//     const districtCode = districtMapping[query];
//
//     if (districtCode) {
//       window.location.href = `${window.location.origin}/policy?districtCode=${encodeURIComponent(districtCode)}`;
//     } else {
//       alert('서울시 지역구 이름을 정확하게 입력해주세요.')
//     }
//   });
// });
