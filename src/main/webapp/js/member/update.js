//정책관리
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


//비밀번호 수정 버튼
function updatePw(){
  const info={
    oldPassword: document.getElementById('curPassword').value,
    newPassword:document.getElementById('newPassword').value
  };
  $.ajax({
    url: `/api/v1/member/password`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '비밀번호 변경',
        text: '비밀번호를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
      Swal.fire({
        title: '비밀번호 변경 실패',
        text: '비밀번호를 변경에 실패했습니다.',
        icon: 'error',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    }
  });
}

//닉네임 수정 버튼
function updateNickname(memberId) {
  const info = {
    memberId: memberId,
    nickName: document.getElementById('updateNick').value
  };

  $.ajax({
    url: `/api/v1/member/nickname`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '닉네임 변경',
        text: '닉네임을 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//나이 수정 버튼
function updateAgeRange(memberId) {
  const info = {
    memberId: memberId,
    ageRange: document.querySelector('input[name="age"]:checked')?.value,
  };

  $.ajax({
    url: `/api/v1/member/ageRange`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '나이 변경',
        text: '나이를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//직업수정 버튼
function updateCareer(memberId) {
  const info = {
    memberId: memberId,
    career: document.querySelector('input[name="job"]:checked')?.value,
  };

  $.ajax({
    url: `/api/v1/member/career`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '직업 변경',
        text: '직업를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//결혼여부 수정
function updateMarriedStatus(memberId) {
  const info = {
    memberId: memberId,
    marriedStatus: document.querySelector(
        'input[name="marriage"]:checked')?.value,
  };

  $.ajax({
    url: `/api/v1/member/marriedStatus`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '결혼상태 변경',
        text: '결혼상태를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//아이수 수정
function updateNumChild(memberId) {
  const info = {
    memberId: memberId,
    numChild: document.querySelector('input[name="numchild"]:checked')?.value,
  };

  $.ajax({
    url: `/api/v1/member/numChild`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);
      Swal.fire({
        title: '자녀수 변경',
        text: '자녀수를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//성별 수정
function updateGender(memberId) {
  const info = {
    memberId: memberId,
    gender: document.querySelector('input[name="gender"]:checked')?.value,
  };

  $.ajax({
    url: `/api/v1/member/gender`,
    type: "PATCH",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);

      Swal.fire({
        title: '성별 변경',
        text: '성별를 변경하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

function updateInterest() {
  const info = Array.from(
      document.querySelectorAll('input[name="benefits"]:checked')
  ).map(el => el.id);

  $.ajax({
    url: `/api/v1/interest/update`,
    type: "PUT",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(info),
    success: function (response) {
      console.log(response);

      Swal.fire({
        title: '관심사 수정',
        text: '관심사를 수정하였습니다.',
        icon: 'success',  // 성공 아이콘 사용
        confirmButtonText: '확인'  // 확인 버튼 텍스트
      }).then(function(){
        location.href = "/mypage";
      });
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}