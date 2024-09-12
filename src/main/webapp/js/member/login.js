// 로그인 모달 열기
function openLoginModal() {
  document.querySelector('.hidden-background').style.display = 'block';
  document.querySelector('.login-modal').style.display = 'block';
  document.querySelector('.mainContent').style.pointerEvents = 'none';
}

// 로그인 모달 닫기
function closeLoginModal() {
  document.querySelector('.hidden-background').style.display = 'none';
  document.querySelector('.login-modal').style.display = 'none';
  document.querySelector('.mainContent').style.pointerEvents = 'auto';
}

//회원가입 버튼 클릭시 회원가입 페이지로 이동
function gotoSignUp() {
  location.href = "/register";
}

// hiddenBackground 클릭 시 모달 닫기
document.querySelector('.hidden-background').addEventListener('click', closeLoginModal);
