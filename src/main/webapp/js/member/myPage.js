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

//정보수정 페이지 이동
function goToUpdateInfo() {
  location.href = "/update";
}

// 모달 밖에 선택했을 때 모달창 닫기 - TODO: 현재 작동되지 않음. 해결 필요
document.addEventListener('DOMContentLoaded', () => {
  const hiddenBackground = document.querySelector('.hidden-background');

  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeUpdatePwModal);
  } else {
    console.error('.hidden-background not found');
  }
})

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
      location.href = "/mypage";
      alert("닉네임이 성공적으로 변경되었습니다.");
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
      location.href = "/mypage";
      alert("나이가 성공적으로 변경되었습니다.");
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
      location.href = "/mypage";
      alert("직업이 성공적으로 변경되었습니다.");
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
      location.href = "/mypage";
      alert("결혼상태가 성공적으로 변경되었습니다.");
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
      location.href = "/mypage";
      alert("자녀수가 성공적으로 변경되었습니다.");
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
      location.href = "/mypage";
      alert("성별이 성공적으로 변경되었습니다.");
    },
    error: function (xhr, status, error) {
      console.log("Error: " + error);
      console.log("Status: " + status);
      console.log(xhr.responseText);
    }
  });
}

//관심있는 정책 눌렀을 때 해당 정책 세부 페이지로 이동
function goToPolicy(policyCode) {
  console.log(policyCode);
  window.location.href = `/policy/detail/${policyCode}`;
}

