// area.js: 서울시 지역구 페이지의 기능을 담당하는 스크립트

document.addEventListener('DOMContentLoaded', function () {
    const seoulMap = document.getElementById('seoul-map'); // 서울 지도 SVG 파일을 가져오는 요소
    let selectedRegion = null; // 현재 선택된 지역을 저장하는 변수
    const initialDistrictCodeValue = initialDistrictCode || null; // JSP에서 전달된 districtCode
    const initialDistrictNameValue = initialDistrictName || ''; // JSP에서 전달된 districtName

    // 지역구 제목 및 설명을 업데이트하는 요소
    const selectedRegionTitle = document.getElementById('selected-region-title');
    const selectedRegionDescription = document.getElementById('selected-region-description');

    // 페이지네이션과 카테고리 버튼 상태 관리 변수
    let selectedPageButton = null;
    let selectedCategoryButton = null; // 선택된 카테고리 버튼

    // 이벤트 카드 그리드
    const eventCardsContainer = document.getElementById('grid');

    // SVG 지도 파일이 로드된 후 지역구 선택 이벤트 설정
    seoulMap.addEventListener('load', function () {
        const svgDoc = seoulMap.contentDocument; // SVG 파일의 문서 객체 가져오기
        const regions = svgDoc.querySelectorAll('path'); // 각 지역구를 나타내는 path 요소

        regions.forEach(region => {
            const regionId = region.getAttribute('id'); // 지역구 ID 가져오기
            const regionName = getRegionName(regionId); // 지역구 이름 가져오기

            // 기본 지역구 스타일 설정
            region.style.fill = '#e6cbae'; // 기본 색상

            // 만약 regionId가 initialDistrictCodeValue라면 선택된 상태로 보여줌
            if (regionId === initialDistrictCodeValue) {
                selectedRegion = region; // 초기 선택된 지역 설정
                region.style.fill = '#F9973E'; // 선택된 지역구 색상 적용

                // 선택된 지역구 제목 및 설명 업데이트
                selectedRegionTitle.textContent = `서울시 ${regionName}`;
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`;

                // 관련 이벤트 카드 갱신 (페이지 1, 카테고리 '전체')
                updateEventCards(regionId, '전체', 1);

                // '전체' 버튼 선택
                selectCategoryButton('전체');
            }

            // 마우스 오버 시 색상 변경 및 텍스트 확대
            region.addEventListener('mouseover', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#D29660'; // 마우스 오버 시 색상 변경
                    region.style.transform = 'translateY(-5px)'; // 마우스 오버 시 위로 떠오르는 효과

                    // 숫자로 시작하는 ID를 제대로 찾기 위해 getElementById 사용
                    const textElement = svgDoc.getElementById(`${regionId}`);
                    if (textElement) {
                        textElement.classList.add('text-hover-effect'); // 텍스트 확대 클래스 추가
                    }
                }
            });

            // 마우스 아웃 시 색상 복원 및 텍스트 원래 크기로 복원
            region.addEventListener('mouseout', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#e6cbae'; // 마우스 아웃 시 기본 색상 복원
                    region.style.transform = 'translateY(0)'; // 원래 위치로 복원
                    const textElement = svgDoc.getElementById(`${regionId}`);
                    if (textElement) {
                        textElement.classList.remove('text-hover-effect'); // 텍스트 확대 클래스 제거
                    }
                }
            });

            // 지역구 클릭 시 동작
            region.addEventListener('click', function () {
                // 이전 선택된 지역 스타일 초기화
                if (selectedRegion) {
                    selectedRegion.style.fill = '#e6cbae';
                    selectedRegion.style.transform = 'translateY(0)'; // 원래 위치로 복원
                }

                selectedRegion = region;
                region.style.fill = '#F9973E'; // 현재 선택된 지역구 스타일 적용

                // 제목 및 설명 업데이트
                selectedRegionTitle.textContent = `서울시 ${regionName}`;
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`;

                // 이벤트 카드 갱신 (페이지 1, 카테고리 '전체')
                updateEventCards(regionId, '전체', 1);

                // 페이지네이션 리셋
                resetPagination();

                // '전체' 버튼 선택
                selectCategoryButton('전체');
            });
        });
    });

    // 지역구 이름 반환 함수
    function getRegionName(regionId) {
        switch (regionId) {
            case '01': return '종로구';
            case '02': return '중구';
            case '03': return '용산구';
            case '04': return '성동구';
            case '05': return '광진구';
            case '06': return '동대문구';
            case '07': return '중랑구';
            case '08': return '성북구';
            case '09': return '강북구';
            case '10': return '도봉구';
            case '11': return '노원구';
            case '12': return '은평구';
            case '13': return '서대문구';
            case '14': return '마포구';
            case '15': return '양천구';
            case '16': return '강서구';
            case '17': return '구로구';
            case '18': return '금천구';
            case '19': return '영등포구';
            case '20': return '동작구';
            case '21': return '관악구';
            case '22': return '서초구';
            case '23': return '강남구';
            case '24': return '송파구';
            case '25': return '강동구';
            default: return '알 수 없는 지역';
        }
    }

    // 이벤트 카드 갱신 함수
    function updateEventCards(regionId, category = '전체', page = 1) {
        // 기존 카드 초기화
        eventCardsContainer.innerHTML = '';

        // AJAX 호출로 이벤트 카드 가져오기 (카테고리 및 페이지 포함)
        fetch(`/api/policy/area?districtCode=${regionId}&category=${category}&page=${page}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const contentType = response.headers.get("content-type");
                if (contentType && contentType.indexOf("application/json") === -1) {
                    throw new Error("Unexpected response format: Not JSON");
                }
                return response.json(); // 응답이 JSON이면 처리
            })
            .then(data => {
                if (Array.isArray(data)) {
                    data.forEach(card => {
                        const cardElement = document.createElement('div');
                        cardElement.classList.add('event-card');
                        cardElement.innerHTML = `<h3>${card.policyName}</h3><p>${card.policyContent}</p>`;
                        eventCardsContainer.appendChild(cardElement);
                    });
                }
            })
            .catch(error => {
                console.error("Failed to fetch event cards:", error);
            });
    }

    // 페이지네이션 리셋 함수
    function resetPagination() {
        const paginationButtons = document.querySelectorAll('.pagination li a');
        paginationButtons.forEach(button => {
            button.classList.remove('selected');
            button.style.backgroundColor = '#FFEFDC'; // 기본 색상으로 초기화
        });

        // 첫 번째 페이지 버튼 선택
        selectedPageButton = paginationButtons[0];
        selectedPageButton.classList.add('selected');
        selectedPageButton.style.backgroundColor = '#FF6347'; // 선택된 버튼 색상
    }

    // 카테고리 버튼 클릭 시 처리
    document.querySelectorAll('.category-btn').forEach(button => {
        button.addEventListener('click', function () {
            if (selectedCategoryButton) {
                selectedCategoryButton.classList.remove('selected'); // 이전 선택된 버튼 비활성화
                selectedCategoryButton.style.backgroundColor = '#FFBB6A'; // 이전 선택된 버튼 색상 복원
            }
            selectedCategoryButton = this;
            selectedCategoryButton.classList.add('selected'); // 현재 클릭된 버튼 활성화
            selectedCategoryButton.style.backgroundColor = '#FF6347'; // 현재 선택된 버튼 색상 적용

            const category = this.dataset.category; // 선택한 카테고리
            const regionId = selectedRegion.getAttribute('id'); // 현재 선택된 지역구 ID
            updateEventCards(regionId, category, 1); // 선택된 카테고리로 이벤트 카드 갱신, 페이지 1로 설정

            // 페이지네이션 리셋
            resetPagination();
        });
    });

    // 카테고리 버튼을 선택하는 함수
    function selectCategoryButton(category) {
        document.querySelectorAll('.category-btn').forEach(button => {
            if (button.dataset.category === category) {
                if (selectedCategoryButton) {
                    selectedCategoryButton.classList.remove('selected');
                    selectedCategoryButton.style.backgroundColor = '#FFBB6A';
                }
                selectedCategoryButton = button;
                selectedCategoryButton.classList.add('selected');
                selectedCategoryButton.style.backgroundColor = '#FF6347';
            }
        });
    }
});
