/**
 * 회원 가입 유효성 검사
 */
document.addEventListener('DOMContentLoaded', function () {
  const fields = {
    email: document.getElementById('email'),
    nickname: document.getElementById('nickname'),
    pwd: document.getElementById('pwd'),
    pwdChk: document.getElementById('pwdChk'),
  };

  // 필드 유효성 검사 함수
  function validateField(field) {
    const value = field.value;
    let errorMessage = '';
    let isValid = true;

    switch (field.id) {
      case 'email':
        isValid = value !== '';
        errorMessage = isValid ? '' : "이메일을 입력해주세요.";
        break;
      case 'nickname':
        isValid = value !== '';
        errorMessage = isValid ? '' : "닉네임을 입력해주세요.";
        break;
      case 'pwd':
        isValid = value !== ''; // TODO: 비밀번호 유효성 검사 조건 추가
        errorMessage = isValid ? '' : "비밀번호를 입력해주세요.";
        break;
      case 'pwdChk':
        isValid = value !== '' && value === fields.pwd.value;
        errorMessage = isValid ? '' : "비밀번호가 일치하지 않습니다.";
        break;
    }

    const feedbackElement = document.getElementById(`${field.id}Valid`);
    feedbackElement.innerHTML = errorMessage;
    feedbackElement.style.color = isValid ? "green" : "red";
    return isValid;
  }

  // 입력 필드 이벤트 핸들러
  function handleFieldEvent(event) {
    validateField(event.target);
  }

  // 이벤트 리스너 등록
  Object.values(fields).forEach(field => {
    field.addEventListener('focus', handleFieldEvent);
    field.addEventListener('blur', handleFieldEvent);
    field.addEventListener('input', handleFieldEvent);
  });
});

/**
 * 회원 가입 - 기본 정보 입력, 유효성 검사, 다음 페이지 이동
 */
function gotoSecondSignUp() {
  const fields = {
    email: document.getElementById('email').value,
    nickName: document.getElementById('nickname').value,
    password: document.getElementById('pwd').value,
    passwordChk: document.getElementById('pwdChk').value
  }

  const isValid = Object.values(fields)
  .every(value => value !== '') && fields.password === fields.passwordChk;

  if (isValid) {
    const param = {
      email: fields.email,
      nickName: fields.nickName,
      password: fields.password
    };

    // AJAX 요청을 통해 기본 정보 저장
    $.ajax({
      url: `/api/v1/member/register-basic`,
      type: "POST",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(param),
      success: function (data) {
        console.log(data);
        location.href = "/register-interest";
      },
      error: function (xhr, status, error) {
        console.log("Error: " + error);
        console.log("Status: " + status);
        console.log(xhr.responseText);
      }
    });
  } else {
    const buttonChk = document.getElementById('buttonCheck');
    buttonChk.innerHTML = '다음단계로 넘어갈 수 없습니다. 회원가입 입력을 계속 해주세요.';
    buttonChk.style.color = "red";
  }
}

/**
 * 회원 가입 - 나머지 정보 입력, 유효성 검사
 */
document.addEventListener('DOMContentLoaded', function () {
  const groups = {
    age: document.getElementsByName('age'),
    gender: document.getElementsByName('gender'),
    job: document.getElementsByName('job'),
    married: document.getElementsByName('marriage'),
    benefit: document.querySelectorAll('input[name="benefits"]')
  }

  Object.keys(groups).forEach(group => {
    groups[group].forEach(input => {
      input.addEventListener('focus',
          () => validateGroup(groups[group], `${group}Valid`));
    });
  });
});

/**
 * 모든 필드 유효성 검사 함수
 */
function validateAllFields() {
  const groups = {
    age: document.getElementsByName('age'),
    gender: document.getElementsByName('gender'),
    job: document.getElementsByName('job'),
    marriage: document.getElementsByName('marriage'),
    benefits: document.querySelectorAll('input[name="benefits"]')
  };

// 모든 라디오 그룹 유효성 검사
  return Object.keys(groups).every(group => {
    if (group === 'benefits') {
      return validateCheckboxGroup(groups[group], `${group}Valid`);
    } else {
      return validateGroup(groups[group], `${group}Valid`);
    }
  });
}

// 라디오 그룹 유효성 검사
function validateGroup(group, errorDivId) {
  const isValid = Array.from(group).some(input => input.checked);
  const feedbackElement = document.getElementById(errorDivId);
  feedbackElement.innerHTML = isValid ? '' : '필수 항목입니다.';
  feedbackElement.style.color = isValid ? "green" : "red";
  feedbackElement.className = isValid ? 'valid' : 'error';
  return isValid;
}

// Checkbox 유효성 검사
function validateCheckboxGroup(checkboxes, errorDivId) {
  const isValid = Array.from(checkboxes).filter(cb => cb.checked).length > 0;
  const feedbackElement = document.getElementById(errorDivId);
  feedbackElement.innerHTML = isValid ? '' : '필수 항목입니다.';
  feedbackElement.style.color = isValid ? "green" : "red";
  feedbackElement.className = isValid ? 'valid' : 'error';
  return isValid;
}

// 회원 가입 완료 버튼 클릭 시
function finishSignUp() {
  // 모든 필드 유효성 검사
  if (!validateAllFields()) {
    const buttonChk = document.getElementById('buttonCheck');
    buttonChk.innerHTML = '다음단계로 넘어갈 수 없습니다. 회원가입 입력을 계속 해주세요.';
    buttonChk.style.color = "red";
    return;
  }
  // 각 입력 값을 읽어서 객체로 정리
  const completeInfo = {
    ageRange: document.querySelector('input[name="age"]:checked')?.value,
    gender: document.querySelector('input[name="gender"]:checked')?.value,
    career: document.querySelector('input[name="job"]:checked')?.value,
    marriedStatus: document.querySelector(
        'input[name="marriage"]:checked')?.value,
    numChild: document.getElementById("son").value,
    interests: Array.from(
        document.querySelectorAll('input[name="benefits"]:checked')
    ).map(el => el.id)
  };

  // 필수 항목에 대한 유효성 검사
  if (!completeInfo.ageRange || !completeInfo.gender || !completeInfo.career
      || !completeInfo.marriedStatus) {
    Swal.fire({
      title: '유효성 검사',
      text: '모든 필수 항목을 입력해주세요',
      icon: 'error',
      confirmButtonText: '확인'  // 확인 버튼 텍스트
    })
    return;
  }

  $.ajax({
    url: `/api/v1/member/register`,
    type: "POST",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(completeInfo),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '회원가입',
        text: '회원가입을 성공했습니다.',
        icon: 'success',
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/"; // TODO: 로그인 모달 이동 필요
      });

    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

// Category 토글 - 박스 눌렀을 때 상세 정보 보여줌
function toggleCategory(categoryId, iconId) {
  const categoryList = document.getElementById(categoryId);
  const icon = document.getElementById(iconId);
  const isHidden = categoryList.style.display === ""
      || categoryList.style.display === "none";

  categoryList.style.display = isHidden ? "flex" : "none";
  icon.className = isHidden ? "fa-solid fa-sort-up" : "fa-solid fa-sort-down";
}

// 정책 관리
let checkList = [];
let count = 0;

function getCheckedCnt(benefit) {
  if (benefit.checked) {
    if (count >= 3) {
      Swal.fire({
        title: '혜택 선택 수',
        text: '최대 3개까지만 선택 가능합니다.',
        icon: 'error',
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      })
      benefit.checked = false;
      return;
    }
    count++;
    checkList.push(benefit.id);
  } else {
    count--;
    checkList = checkList.filter(item => item !== benefit.id);
  }
  updateOrderNumbers();
}

//선택한 순서 대로 화면에 표시
function updateOrderNumbers() {
  document.querySelectorAll('.order-number').forEach(order => {
    order.textContent = '';
  });

  checkList.forEach((checkboxId, count) => {
    const label = document.querySelector(`label[for='${checkboxId}']`);
    const orderDisplay = label.querySelector('.order-number');
    orderDisplay.textContent = `${count + 1}`;
  });
}

//초기화 버튼
function resetForm() {

  const inputs = document.querySelectorAll(
      'input[type="radio"], input[type="checkbox"], input[type="range"]');

  inputs.forEach(input => {
    if (input.type === 'radio' || input.type === 'checkbox') {
      input.checked = false; // 선택 해제
    } else if (input.type === 'range') {
      input.value = 0; // 0으로 초기화
    }
  });

  // 유효성 검사 메시지 초기화
  document.getElementById('ageValid').textContent = '';
  document.getElementById('genderValid').textContent = '';
  document.getElementById('jobValid').textContent = '';
  document.getElementById('marriageValid').textContent = '';
  document.getElementById('benefitsValid').textContent = '';

  resetOrder();
}

function resetOrder() {
  count = 0;  // 선택한 체크박스의 개수를 0으로 초기화
  checkList = [];  // 선택된 체크박스 ID 목록을 초기화

  // 선택 순서 표시 부분을 모두 초기화
  document.querySelectorAll('.order-number').forEach(order => {
    order.textContent = '';  // 선택 순서 표시 제거
  });
}


