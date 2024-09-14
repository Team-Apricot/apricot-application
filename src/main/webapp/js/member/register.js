/**
 * 회원 가입 유효성 검사
 */
document.addEventListener('DOMContentLoaded', function () {
  const fields = {
    username: document.getElementById('username'),
    nickname: document.getElementById('nickname'),
    password: document.getElementById('password'),
    passwordChk: document.getElementById('passwordCheck'),
  };

  // 필드 유효성 검사 함수
  function validateField(field) {
    const value = field.value;
    let errorMessage = '';
    let isValid = true;

    switch (field.id) {
      case 'username':
        isValid = value !== '';
        errorMessage = isValid ? '' : "이메일을 입력해주세요.";
        break;
      case 'nickname':
        isValid = value !== '';
        errorMessage = isValid ? '' : "닉네임을 입력해주세요.";
        break;
      case 'password':
        isValid = value !== ''; // TODO: 비밀번호 유효성 검사 조건 추가
        errorMessage = isValid ? '' : "비밀번호를 입력해주세요.";
        break;
      case 'passwordCheck':
        isValid = value !== '' && value === fields.password.value;
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
    username: document.getElementById('username').value,
    nickname: document.getElementById('nickname').value,
    password: document.getElementById('password').value,
    passwordChk: document.getElementById('passwordCheck').value
  }

  const isValid = Object.values(fields)
    .every(value => value !== '') && fields.password === fields.passwordChk;

  if (isValid) {
    const param = {
      email: fields.username,
      nickName: fields.nickname,
      password: fields.password
    };

    console.log(param);

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

  return Object.keys(groups).every(group =>
      validateGroup(groups[group], `${group}Valid`));
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
    alert("모든 필수 항목을 선택해 주세요.");
    return;
  }

  /*
  // Ajax 요청을 통해 회원 가입 정보를 서버로 전송
  const param = {
    ageRange: completeInfo.ageRange,
    gender: completeInfo.gender,
    career: completeInfo.career,
    marriedStatus: completeInfo.marriedStatus,
    numChild: completeInfo.numChild,
    interests: completeInfo.interests
  };

  console.log(param);
  */

  $.ajax({
    url: `/api/v1/member/register`,
    type: "POST",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(completeInfo),
    success: function (response) {
      console.log(response);
      location.href = "/"; // TODO: 로그인 모달 이동 필요
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
      alert("최대 3개까지만 선택가능합니다!");
      benefit.checked = false;
      return;
    }
    count++;
    checkList.push(benefit.id);
  } else {
    count--;
    checkList = checkList.filter(item => item !== benefit.id);
  }
  console.log(checkList);
  updateOrderNumbers();
}

//선택한 순서 대로 화면에 표시
function updateOrderNumbers() {
  document.querySelectorAll('.order-number').forEach(order => {
    order.textContent = '';
  });

  checkList.forEach((checkboxId, index) => {
    const label = document.querySelector(`label[for='${checkboxId}']`);
    const orderDisplay = label.querySelector('.order-number');
    orderDisplay.textContent = `${index + 1}`;
  });
}
