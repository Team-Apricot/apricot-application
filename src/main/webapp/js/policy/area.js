function getDistrictCodeFromURL() {
  const params = new URLSearchParams(window.location.search);
  return params.get('districtCode');
}

document.addEventListener('DOMContentLoaded', function () {
  const seoulMap = document.getElementById('seoul-map'); // 서울 지도 SVG 파일을 가져오는 요소
  let curDistrictCode = null; // 현재 클릭된 지역구
  const districtCodeFromURL = getDistrictCodeFromURL(); // URL에서 districtCode 파라미터 가져오기

  seoulMap.addEventListener('load', function () {
    const svgDoc = seoulMap.contentDocument; // SVG 파일의 문서 객체 가져오기
    const districts = svgDoc.querySelectorAll('path.district'); // 각 지역구를 나타내는 path 요소

    districts.forEach(district => {
      // 마우스 오버 이벤트
      district.addEventListener('mouseover', function () {
        this.style.fill = '#D29660'; // 색상 변경
      });

      // 마우스 아웃 이벤트
      district.addEventListener('mouseout', function () {
        this.style.fill = ''; // 원래 색상으로 되돌리기
      });

      // 클릭 이벤트
      district.addEventListener('click', function () {
        // 기존에 클릭된 지역구의 clicked 상태 해제 (단, 현재 클릭된 지역구는 유지)
        if (curDistrictCode) {
          curDistrictCode.classList.remove('clicked');
        }

        // 새로운 지역구를 클릭 상태로 설정
        this.classList.add('clicked');
        curDistrictCode = this; // 현재 클릭된 지역구를 저장

        // 클릭한 지역구로 변경
        const districtCode = this.id;
        history.pushState(null, '',
            `${window.location.origin}/policy?districtCode=${encodeURIComponent(
                districtCode)}`);

        $.ajax({
          url: `/api/v1/policy/district`,
          type: 'GET',
          data: {districtCode: districtCode},
          dataType: 'json', // 서버에서 JSON 형식으로 응답
          success: response => {
            const data = response.data;
            $('#region-logo').attr('src', data.districtLogoPath); // 로고 업데이트
            $('#selected-region-title').text(`서울시 ${data.districtName}`); // 제목 업데이트
            $('#selected-region-description').text(data.districtSlogan); // 슬로건 업데이트
          },
          error: function (xhr, status, error) {
            console.error('Error fetching data:', status, error);
          }

        });
      });

      // URL에서 가져온 districtCode에 해당하는 지역구 클릭 상태 유지
      if (districtCodeFromURL) {
        const targetDistrict = svgDoc.getElementById(districtCodeFromURL);
        if (targetDistrict) {
          targetDistrict.classList.add('clicked');
          curDistrictCode = targetDistrict;
        }
      }

    });
  });
});

// SVG 지도 파일이 로드된 후 지역구 선택 이벤트 설정
// seoulMap.addEventListener('load', function () {
//   const svgDoc = seoulMap.contentDocument;
//   const regions = svgDoc.querySelectorAll('path');
//
//   regions.forEach(region => {
//     const regionId = region.getAttribute('id'); // 지역구 ID 가져오기
//     const regionName = getRegionName(regionId); // 지역구 이름 가져오기
//
//     // 기본 지역구 스타일 설정
//     region.style.fill = '#e6cbae'; // 기본 색상
//
//     // 만약 regionId가 initialDistrictCodeValue라면 선택된 상태로 보여줌
//     if (regionId === initialDistrictCodeValue) {
//       selectedRegion = region; // 초기 선택된 지역 설정
//       region.style.fill = '#F9973E'; // 선택된 지역구 색상 적용
//       region.style.transform = 'translateY(-10px)'; // 선택된 지역구를 위로 이동
//
//       // 선택된 지역구 제목 및 설명 업데이트
//       selectedRegionTitle.textContent = `서울시 ${regionName}`;
//       //selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`;
//       selectedRegionDescription.textContent = regionDescriptions[regionId]
//           || '기본 설명';
//       regionLogo.src = `/assets/img/region/${regionImages[regionId]
//       || 'logo.png'}`;
//
//       // 관련 이벤트 카드 갱신 (페이지 1, 카테고리 '전체')
//       updateEventCards(regionId, '전체', 1);
//
//       // '전체' 버튼 선택
//       selectCategoryButton('전체');
//     }
//
//     // 마우스 오버 시 색상 변경 및 텍스트 확대
//     region.addEventListener('mouseover', function () {
//       if (region !== selectedRegion) {
//         region.style.fill = '#D29660'; // 마우스 오버 시 색상 변경
//       }
//     });
//
//     // 마우스 아웃 시 색상 복원
//     region.addEventListener('mouseout', function () {
//       if (region !== selectedRegion) {
//         region.style.fill = '#e6cbae'; // 마우스 아웃 시 기본 색상 복원
//       }
//     });
//
//     // 지역구 클릭 시 동작 (선택된 경우만 위로 띄움)
//     region.addEventListener('click', function () {
//       // 이전 선택된 지역 스타일 초기화
//       if (selectedRegion) {
//         selectedRegion.style.fill = '#e6cbae';
//         selectedRegion.style.transform = 'translateY(0)'; // 원래 위치로 복원
//       }
//
//       selectedRegion = region;
//       region.style.fill = '#F9973E'; // 현재 선택된 지역구 스타일 적용
//       region.style.transform = 'translateY(-10px)'; // 선택된 지역구를 위로 이동
//
//       window.location.href = `${window.location.origin}/policy?districtCode=${encodeURIComponent(
//           regionId)}`;
//
//       // 이벤트 카드 갱신 (페이지 1, 카테고리 '전체')
//       updateEventCards(regionId, '전체', 1);
//
//       // 페이지네이션 리셋
//       resetPagination();
//
//       // '전체' 버튼 선택
//       selectCategoryButton('전체');
//     });
//   });
// });
//
//   // 이벤트 카드 갱신 함수
//   function updateEventCards(regionId, category = '전체', page = 1) {
//     // 기존 카드 초기화
//     eventCardsContainer.innerHTML = '';
//
//     // Jquery를 이용한 AJAX 호출
//     $.ajax({
//       url: `/api/policy/area`,
//       type: 'GET',
//       data: {
//         districtCode: regionId,
//         category: category,
//         page: page
//       },
//       success: function (data) {
//         if (Array.isArray(data)) {
//           data.forEach(card => {
//             const cardElement = document.createElement('div');
//             cardElement.classList.add('event-card');
//             cardElement.innerHTML = `<h3>${card.policyName}</h3><p>${card.policyContent}</p>`;
//             eventCardsContainer.appendChild(cardElement);
//           });
//         }
//       },
//       error: function (xhr, status, error) {
//         console.error("Failed to fetch event cards. Error:", error);
//       }
//     });
//   }
//
//   // 페이지네이션 버튼 클릭 동작 설정 (기존 코드에서 개선된 부분 통합)
//   const paginationButtons = document.querySelectorAll(
//       '.pagination li:not(.arrow) a');
//   paginationButtons.forEach(button => {
//     button.addEventListener('click', function (e) {
//       e.preventDefault(); // 기본 링크 동작 방지
//       if (button !== selectedPageButton) {
//         // 이전 선택된 페이지 버튼 초기화
//         if (selectedPageButton) {
//           selectedPageButton.classList.remove('selected');
//           selectedPageButton.style.backgroundColor = '#FFEFDC';
//           selectedPageButton.style.color = '#FF6347';
//         }
//
//         // 새로운 선택된 페이지 버튼 업데이트
//         button.classList.add('selected');
//         button.style.backgroundColor = '#FF6347';
//         button.style.color = 'white';
//         selectedPageButton = button; // 현재 선택된 페이지 버튼 업데이트
//
//         // 페이지 이동 로직 (페이지 번호에 따른 이벤트 카드 갱신)
//         const pageNumber = button.textContent;
//         const regionId = selectedRegion.getAttribute('id');
//         const category = selectedCategoryButton
//             ? selectedCategoryButton.dataset.category : '전체';
//         updateEventCards(regionId, category, pageNumber);
//       }
//     });
//   });
//
//   // 페이지네이션 리셋 함수
//   function resetPagination() {
//     paginationButtons.forEach(button => {
//       button.classList.remove('selected');
//       button.style.backgroundColor = '#FFEFDC'; // 기본 색상으로 초기화
//       button.style.color = '#FF6347';
//     });
//
//     // 첫 번째 페이지 버튼 선택
//     selectedPageButton = paginationButtons[0];
//     selectedPageButton.classList.add('selected');
//     selectedPageButton.style.backgroundColor = '#FF6347'; // 선택된 버튼 색상
//     selectedPageButton.style.color = 'white';
//   }
//
//   // 카테고리 버튼 클릭 시 처리
//   document.querySelectorAll('.category-btn').forEach(button => {
//     button.addEventListener('click', function () {
//       if (selectedCategoryButton) {
//         selectedCategoryButton.classList.remove('selected'); // 이전 선택된 버튼 비활성화
//         selectedCategoryButton.style.backgroundColor = '#FFBB6A'; // 이전 선택된 버튼 색상 복원
//       }
//       selectedCategoryButton = this;
//       selectedCategoryButton.classList.add('selected'); // 현재 클릭된 버튼 활성화
//       selectedCategoryButton.style.backgroundColor = '#FF6347'; // 현재 선택된 버튼 색상 적용
//
//       // 카테고리에 따른 이벤트 카드 갱신 (페이지는 1로 리셋)
//       const category = this.dataset.category;
//       const regionId = selectedRegion ? selectedRegion.getAttribute('id')
//           : initialDistrictCodeValue;
//       updateEventCards(regionId, category, 1); // 1페이지부터 다시 시작
//
//       // 페이지네이션 리셋
//       resetPagination();
//     });
//   });
//
//   // 기본적으로 '전체' 카테고리 버튼이 선택된 상태로 설정
//   function selectCategoryButton(category) {
//     const categoryButtons = document.querySelectorAll('.category-btn');
//     categoryButtons.forEach(button => {
//       if (button.dataset.category === category) {
//         button.classList.add('selected');
//       } else {
//         button.classList.remove('selected');
//       }
//     });
//   }
//
//   function resetPagination() {
//     paginationButtons.forEach(button => {
//       if (button.textContent === '1') {
//         button.classList.add('selected');
//         button.style.backgroundColor = '#FF6347';
//         button.style.color = 'white';
//         selectedPageButton = button;
//       } else {
//         button.classList.remove('selected');
//         button.style.backgroundColor = '#FFEFDC';
//         button.style.color = '#FF6347';
//       }
//     });
//   }
//
//   const categoryButtons = document.querySelectorAll('.category-btn');
//   categoryButtons.forEach(button => {
//     button.addEventListener('click', function () {
//       const category = button.dataset.category;
//       const regionId = selectedRegion.getAttribute('id');
//       const page = 1;
//
//       updateEventCards(regionId, category, page);
//       resetPagination();
//       selectCategoryButton(category);
//     });
//   });
// });
