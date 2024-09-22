// area.js: 서울시 지역구 페이지의 기능을 담당하는 스크립트

document.addEventListener('DOMContentLoaded', function () {
    const seoulMap = document.getElementById('seoul-map'); // 서울 지도 SVG 파일을 가져오는 요소
    let selectedRegion = null; // 현재 선택된 지역을 저장하는 변수
    let searchRegionId = null; // 검색된 지역의 ID
    const selectedRegionTitle = document.getElementById('selected-region-title'); // 지역구 제목
    const selectedRegionDescription = document.getElementById('selected-region-description'); // 지역구 설명
    const eventCardsContainer = document.getElementById('grid'); // 이벤트 카드 그리드
    let selectedPageButton = document.querySelector('.pagination li a.selected'); // 선택된 페이지네이션 버튼
    let selectedCategoryButton = document.querySelector('.category-btn.selected'); // 선택된 카테고리 버튼

    // 1. 페이지에서 지역구가 검색되었을 때 해당 지역구의 ID를 가져옴
    const searchName = document.querySelector('input[name="search-name"]').value; // 검색된 지역구 이름
    searchRegionId = getRegionIdByName(searchName); // 해당 이름으로 지역구 ID를 가져옴

    // 2. SVG 파일이 로드된 후 지역구에 마우스 호버 및 클릭 이벤트를 설정
    seoulMap.addEventListener('load', function () {
        const svgDoc = seoulMap.contentDocument; // SVG 문서 객체 가져오기
        const regions = svgDoc.querySelectorAll('path'); // 모든 지역구를 나타내는 path 요소

        regions.forEach(region => {
            const regionId = region.getAttribute('id'); // 지역구 ID
            const regionName = getRegionName(regionId); // 해당 ID에 따른 지역구 이름

            // 기본 지역 스타일 적용
            region.style.fill = '#e6cbae';

            // 검색된 지역구 ID가 일치하는 경우 (초기 상태로 검색된 지역을 보여줌)
            if (regionId == searchRegionId) {
                selectedRegion = region;
                region.style.fill = '#F9973E'; // 선택된 지역구 색상 적용
                selectedRegionTitle.textContent = `서울시 ${regionName}`; // 제목 업데이트
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`; // 설명 업데이트
                updateEventCards(regionId); // 이벤트 카드 갱신
            }

            // 마우스 오버 시 색상 변경
            region.addEventListener('mouseover', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#D29660'; // 마우스 오버 시 색상 변경
                }
            });

            // 마우스 아웃 시 색상 복원
            region.addEventListener('mouseout', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#e6cbae'; // 기본 색상으로 복원
                }
            });

            // 지역구 클릭 시 동작 (다른 지역을 클릭했을 때)
            region.addEventListener('click', function () {
                if (selectedRegion) {
                    selectedRegion.style.fill = '#e6cbae'; // 이전 선택된 지역 기본 색상 복원
                }

                selectedRegion = region;
                region.style.fill = '#F9973E'; // 선택된 지역구 색상 적용
                selectedRegionTitle.textContent = `서울시 ${regionName}`; // 제목 업데이트
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`; // 설명 업데이트
                updateEventCards(regionId); // 선택된 지역에 따라 이벤트 카드 갱신
                resetPagination(); // 페이지네이션 초기화
            });
        });
    });

    // 3. 지역구 이름에 따른 ID를 반환하는 함수
    function getRegionIdByName(name) {
        switch (name) {
            case '종로구': return '01';
            case '중구': return '02';
            case '강서구': return '16'; // 강서구 regionId
            // 추가 지역구들
            default: return null;
        }
    }

    // 4. 지역구 ID에 따른 이름을 반환하는 함수
    function getRegionName(regionId) {
        switch (regionId) {
            case '01': return '종로구';
            case '02': return '중구';
            case '16': return '강서구'; // 강서구 이름
            // 추가 지역구들
            default: return '알 수 없는 지역';
        }
    }

    // 5. 선택된 지역구에 따라 이벤트 카드를 갱신하는 함수
    function updateEventCards(regionId, category = '전체') {
        eventCardsContainer.innerHTML = ''; // 기존 카드 초기화

        // AJAX 호출로 선택한 지역구에 맞는 데이터를 가져와서 카드 그리드를 생성
        fetch(`/api/policy/area?districtCode=${regionId}&category=${category}`)
            .then(response => response.json())
            .then(data => {
                if (Array.isArray(data)) {
                    data.forEach(card => {
                        const cardElement = document.createElement('div');
                        cardElement.classList.add('event-card');
                        cardElement.innerHTML = `<h3>${card.title}</h3><p>${card.description}</p>`;
                        eventCardsContainer.appendChild(cardElement); // 카드 추가
                    });
                }
            })
            .catch(error => {
                console.error("이벤트 카드를 불러오는 데 실패했습니다:", error);
            });
    }

    // 6. 페이지네이션을 리셋하는 함수 (처음 1번 페이지 선택)
    function resetPagination() {
        const paginationButtons = document.querySelectorAll('.pagination li a');
        paginationButtons.forEach(button => {
            button.classList.remove('selected'); // 모든 버튼을 기본 상태로
            button.style.backgroundColor = '#FFEFDC'; // 기본 색상
        });

        selectedPageButton = paginationButtons[0]; // 첫 번째 페이지를 선택
        selectedPageButton.classList.add('selected');
        selectedPageButton.style.backgroundColor = '#FF6347'; // 선택된 버튼 색상
    }

    // 7. 카테고리 버튼 클릭 시 처리 (전체, 일자리, 주거 등)
    document.querySelectorAll('.category-btn').forEach(button => {
        button.addEventListener('click', function () {
            if (selectedCategoryButton) {
                selectedCategoryButton.classList.remove('selected'); // 이전 선택된 버튼 비활성화
            }

            selectedCategoryButton = this;
            selectedCategoryButton.classList.add('selected'); // 선택한 버튼 활성화

            const category = this.dataset.category; // 선택한 카테고리
            updateEventCards(selectedRegion.getAttribute('id'), category); // 선택된 카테고리로 이벤트 카드 갱신
        });
    });
});

