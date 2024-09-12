
/*회원가입 유효성 검사 */


document.addEventListener('DOMContentLoaded', function() {
  const usernameField = document.getElementById('username');
  const nicknameField = document.getElementById('nickname');
  const passwordField = document.getElementById('password');
  const passwordCheckField = document.getElementById('passwordCheck');
  function validateField(field) {
    const value = field.value;
    let errorMessage = '';
    let isValid = true;
    switch (field.id) {
      case 'username':
        if (value === '') {
          errorMessage = "이메일을 입력해주세요.";
          isValid = false;
        }
        break;
      case 'nickname':
        if (value === '') {
          errorMessage = "닉네임을 입력해주세요.";
          isValid = false;
        }
        break;
      case 'password':
        if (value === '') {
          errorMessage = "비밀번호를 입력해주세요.";
          isValid = false;
        }
        break;
      case 'passwordCheck':
        const password = passwordField.value;
        if (value === '') {
          errorMessage = "비밀번호를 다시 입력해주세요.";
          isValid = false;
        } else if (value !== password) {
          errorMessage = "비밀번호가 일치하지 않습니다.";
          isValid = false;
        }
        break;

    }

    document.getElementById(`${field.id}Valid`).innerHTML = errorMessage;
    document.getElementById(`${field.id}Valid`).style.color = isValid ? "green" : "red";
    return isValid;
  }


/* input focus가 잡혔을 때 */
  function validateOnFocus(event) {
    validateField(event.target);
  }

  /* input blur가 잡혔을 떄 */
  function validateOnBlur(event) {
    validateField(event.target);
  }

  usernameField.addEventListener('focus', validateOnFocus);
  nicknameField.addEventListener('focus', validateOnFocus);
  passwordField.addEventListener('focus', validateOnFocus);
  passwordCheckField.addEventListener('focus', validateOnFocus);

  usernameField.addEventListener('blur', validateOnBlur);
  nicknameField.addEventListener('blur', validateOnBlur);
  passwordField.addEventListener('blur', validateOnBlur);
  passwordCheckField.addEventListener('blur', validateOnBlur);

  usernameField.addEventListener('input', validateOnBlur);
  nicknameField.addEventListener('input', validateOnBlur);
  passwordField.addEventListener('input', validateOnBlur);
  passwordCheckField.addEventListener('input', validateOnBlur);


});

/* 회원가입 다음 페이지로 이동 */
function gotoSecondSignUp() {
  let username = document.getElementById('username').value;
  let nickname = document.getElementById('nickname').value;
  let password = document.getElementById('password').value;
  let passwordCheck = document.getElementById('passwordCheck').value;

  if (username !=='' && nickname!==''
      && password!=='' && passwordCheck!==''
      && password=== passwordCheck) {
    location.href = "/register-interest";
  } else {
    document.getElementById('buttonCheck').innerHTML = '다음단계로 넘어갈 수 없습니다. 회원가입 입력을 계속 해주세요.';
    document.getElementById('buttonCheck').style.color = "red";
  }
}


/* 두번째 회원가입 유효성 검사 */

document.addEventListener('DOMContentLoaded', function() {
  const ageRadios = document.getElementsByName('age');
  const genderRadios = document.getElementsByName('gender');
  const jobRadios = document.getElementsByName('job');
  const marriageRadios = document.getElementsByName('marriage');
  const benefitsCheckboxes = document.querySelectorAll('input[name="benefits"]');


  ageRadios.forEach(radio => radio.addEventListener('focus', () => validateRadioGroup(ageRadios, 'ageValid')));
  genderRadios.forEach(radio => radio.addEventListener('focus', () => validateRadioGroup(genderRadios, 'genderValid')));
  jobRadios.forEach(radio => radio.addEventListener('focus', () => validateRadioGroup(jobRadios, 'jobValid')));
  marriageRadios.forEach(radio => radio.addEventListener('focus', () => validateRadioGroup(marriageRadios, 'marriageValid')));
  benefitsCheckboxes.forEach(cb => cb.addEventListener('focus', () => validateCheckboxGroup(benefitsCheckboxes, 'benefitsValid')));

 
});

// validateAllFields 함수 전역으로 이동
function validateAllFields() {
  const ageRadios = document.getElementsByName('age');
  const genderRadios = document.getElementsByName('gender');
  const jobRadios = document.getElementsByName('job');
  const marriageRadios = document.getElementsByName('marriage');
  const benefitsCheckboxes = document.querySelectorAll('input[name="benefits"]');

  const ageValid = validateRadioGroup(ageRadios, 'ageValid');
  const genderValid = validateRadioGroup(genderRadios, 'genderValid');
  const jobValid = validateRadioGroup(jobRadios, 'jobValid');
  const marriageValid = validateRadioGroup(marriageRadios, 'marriageValid');
  const benefitsValid = validateCheckboxGroup(benefitsCheckboxes, 'benefitsValid');

  return ageValid && genderValid && jobValid && marriageValid && !benefitsValid;
}

//라디오 버튼 유효성 검사
function validateRadioGroup(radios, errorDivId) {
  const isValid = Array.from(radios).some(radio => radio.checked);
  document.getElementById(errorDivId).innerHTML = isValid ? '' : '필수 항목입니다.';
  document.getElementById(errorDivId).className = isValid ? 'valid' : 'error';
  document.getElementById(errorDivId).style.color = isValid ? "green" : "red";

  return isValid;
}

//checkbox 유효성 검사
function validateCheckboxGroup(checkboxes, errorDivId) {
  const checkedCount = Array.from(checkboxes).filter(cb => cb.checked).length;
  const isValid = checkedCount ===0 ;
  document.getElementById(errorDivId).innerHTML = isValid
      ? '필수항목입니다.'
      : '';
  document.getElementById(errorDivId).className = isValid ? 'error' : 'valid';
  document.getElementById(errorDivId).style.color = isValid ? "red" : "green";

  return isValid;
}

//회원가입 완료 버튼 
function finishSignUp() {
  if (validateAllFields()) {
    location.href = "/";
    alert('회원가입에 성공했습니다.')
  } else {
    document.getElementById('buttonCheck').innerHTML = '모든 필드를 올바르게 입력해주세요.';
    document.getElementById('buttonCheck').className = 'error';
    document.getElementById('buttonCheck').style.color = "red";

  }
}

//박스 눌렀을 때 상세 정보 보여줌
function toggleCategory(categoryId, iconId) {
  var categoryList = document.getElementById(categoryId);
  var icon = document.getElementById(iconId);
  if (categoryList.style.display === "" || categoryList.style.display === "none") {
    categoryList.style.display = "flex";
    icon.className = "fa-solid fa-sort-up";
  } else {
    categoryList.style.display = "none";
    icon.className = "fa-solid fa-sort-down";
  }
}

// 정책 관리
let checkList = [];
let count = 0;
function getCheckedCnt(benefit) {
  if (benefit.checked) {
    count += 1;
    if (count > 3) {
      alert("최대 3개까지만 선택가능합니다!");
      benefit.checked = false;
      count -= 1;
    } else {
      checkList.push(benefit.id);
    }
  } else {
    count -= 1;
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
    const label = document.querySelector(`label[for=${checkboxId}]`);
    const orderDisplay = label.querySelector('.order-number');
    orderDisplay.textContent = `${index + 1}`;
  });
}
