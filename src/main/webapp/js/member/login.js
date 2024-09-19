// 로그인 폼 제출
// $(document).ready(() => {
  $('.login-form').off('submit').on('submit', function (e) {
    e.preventDefault();
    if (!validateEmail()) { return; }
    const formData = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/api/v1/login', // 로그인 요청을 처리하는 URL
      data: formData,
      success: function () {
        window.location.href = '/'; // 로그인 성공 시 홈
      },
      error: function (xhr, status, error) {
        let errorMessage;
        try {
          const responseJSON = JSON.parse(xhr.responseText);
          errorMessage = responseJSON.error;
        } catch (e) {
          errorMessage = "알 수 없는 오류가 발생하였습니다.";
        }
        $('#loginErrorMessage').text(errorMessage).show();
        console.error('AJAX Error:', status, error); // AJAX 요청의 상태 및 오류 출력
      }
    });
  });
// });

// 로그인 모달 열기
function openLoginModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const loginModal = document.querySelector('.login-modal');
  const mainContent = document.querySelector('.mainContent');

  hiddenBackground.style.display = 'block';
  loginModal.style.display = 'block';
  mainContent.style.pointerEvents = 'none';

  $.ajax({
    url: '/login',
    type: 'GET',
    success: function (data) {
      $('#login-modal-content').html(data);
      $('#login-modal').show();
    },
    error: function (xhr, status, error) {
      console.error('AJAX Error:', status, error);
      alert('로그인 폼을 로드하는데 문제가 있습니다.');
      window.location.href = '/';
    }
  });
}

// 로그인 모달 닫기
function closeLoginModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const loginModal = document.querySelector('.login-modal');
  const mainContent = document.querySelector('.mainContent');

  hiddenBackground.style.display = 'none';
  loginModal.style.display = 'none';
  mainContent.style.pointerEvents = 'auto';
}

// hidden-background 클릭 시 모달 닫기
document.addEventListener('DOMContentLoaded', function() {
  const hiddenBackground = document.querySelector('.hidden-background');
  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeLoginModal);
  }
});

// 회원가입 버튼 클릭 시 회원가입 페이지로 이동
function gotoSignUp() {
  location.href = "/register";
}

// 이메일 유효성 검사 함수
function validateEmail() {
  const emailInput = document.getElementById('username');
  const email = emailInput.value;
  const errorMessage = document.getElementById('loginErrorMessage');

  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (!emailPattern.test(email)) {
    errorMessage.textContent = '유효한 이메일 주소를 입력해 주세요.';
    errorMessage.style.display = 'block';
    return false;
  }
  errorMessage.style.display = 'none';
  return true;
}
