// area.js: 서울시 지역구 페이지의 기능을 담당하는 스크립트

document.addEventListener('DOMContentLoaded', function () {
    const seoulMap = document.getElementById('seoul-map'); // 서울 지도 SVG 파일을 가져오는 요소
    let selectedRegion = null; // 현재 선택된 지역을 저장하는 변수

    // 지역구 제목 및 설명을 업데이트하는 요소
    const selectedRegionTitle = document.getElementById('selected-region-title');
    const selectedRegionDescription = document.getElementById('selected-region-description');

    // 페이지네이션과 카테고리 버튼 상태 관리 변수
    let selectedPageButton = document.querySelector('.pagination li a.selected');
    let selectedCategoryButton = null; // 처음엔 선택된 카테고리 버튼 없음

    // 이벤트 카드 그리드
    const eventCards = document.querySelectorAll('.event-card');

    // 페이지네이션 버튼 스타일 설정 (선택된 페이지)
    if (selectedPageButton) {
        selectedPageButton.style.backgroundColor = '#FF6347';
        selectedPageButton.style.color = 'white';
    }

    // 페이지네이션 버튼 클릭 시 동작 설정
    const paginationButtons = document.querySelectorAll('.pagination li:not(.arrow) a');
    paginationButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault(); // 기본 링크 동작 방지
            if (button !== selectedPageButton) {
                // 이전 선택된 페이지 버튼 초기화
                selectedPageButton.classList.remove('selected');
                selectedPageButton.style.backgroundColor = '#FFEFDC';
                selectedPageButton.style.color = '#FF6347';

                // 새로운 선택된 페이지 버튼 업데이트
                button.classList.add('selected');
                button.style.backgroundColor = '#FF6347';
                button.style.color = 'white';
                selectedPageButton = button; // 현재 선택된 페이지 버튼 업데이트

                // 페이지 이동 로직 (여기서 페이지 번호 출력)
                const pageNumber = button.textContent;
                console.log(`페이지 번호: ${pageNumber}`);
            }
        });
    });

    // 카테고리 버튼 클릭 시 동작 설정
    const categoryButtons = document.querySelectorAll('.category-btn');
    categoryButtons.forEach(button => {
        button.addEventListener('click', function () {
            // 이전 선택된 카테고리 버튼 초기화
            if (selectedCategoryButton) {
                selectedCategoryButton.classList.remove('selected');
                selectedCategoryButton.style.backgroundColor = '#FFBB6A';
            }

            // 새로운 선택된 버튼 스타일 적용
            button.classList.add('selected');
            button.style.backgroundColor = '#FF6347';
            selectedCategoryButton = button; // 현재 선택된 카테고리 버튼 업데이트

            // 카테고리 필터링 로직 (카테고리별로 이벤트 카드 필터링)
            const selectedCategory = button.value;
            console.log(`선택된 카테고리: ${selectedCategory}`);
            eventCards.forEach(card => {
                if (card.getAttribute('categoryCode') === selectedCategory || selectedCategory === '전체') {
                    card.style.display = 'block'; // 해당 카테고리 카드만 표시
                } else {
                    card.style.display = 'none'; // 다른 카테고리 카드는 숨김
                }
            });

            // 페이지네이션을 1번으로 초기화
            selectedPageButton.classList.remove('selected');
            selectedPageButton.style.backgroundColor = '#FFEFDC';
            selectedPageButton.style.color = '#FF6347';

            selectedPageButton = paginationButtons[0]; // 첫 번째 페이지 버튼 선택
            selectedPageButton.classList.add('selected');
            selectedPageButton.style.backgroundColor = '#FF6347';
            selectedPageButton.style.color = 'white';
        });
    });

    // 카드에 마우스 오버 및 클릭 이벤트 추가
    eventCards.forEach(card => {
        // 마우스 오버 시 음영 효과 추가
        card.addEventListener('mouseover', function () {
            card.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.2)';
            card.style.transform = 'translateY(-5px)';
        });

        // 마우스 아웃 시 원래 상태로 복귀
        card.addEventListener('mouseout', function () {
            card.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.1)';
            card.style.transform = 'translateY(0)';
        });

        // 카드 클릭 시 동작 설정 (클릭된 카드 정보 출력)
        card.addEventListener('click', function () {
            card.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)'; // 클릭 시 눌린 상태로 보이게 설정
            card.style.transform = 'translateY(2px)';
            // 카드 클릭 시 동작하는 함수: 콘솔에 카드 제목을 출력하도록 함 (실제 값 들어가는지 확인, 디버깅 용도)
            const cardTitle = card.querySelector('h3').innerText;
            console.log(`"${cardTitle}" 카드 클릭됨`);
        });
    });

    // SVG 지도 파일이 로드된 후 지역구 선택 이벤트 설정
    seoulMap.addEventListener('load', function () {
        const svgDoc = seoulMap.contentDocument; // SVG 파일의 문서 객체 가져오기
        const regions = svgDoc.querySelectorAll('path'); // 각 지역구를 나타내는 path 요소

        regions.forEach(region => {
            // 지역구 기본 스타일 설정
            region.style.fill = '#e6cbae'; // 기본 색상 설정
            region.classList.add('region');

            // 마우스 오버 시 지역구 색상 변경
            region.addEventListener('mouseover', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#D29660'; // 마우스 오버 시 색상 변경
                    region.classList.add('hover-effect'); // 음영 효과 추가
                }
                const textElement = svgDoc.querySelector(`text#${region.id}`); // 관련 텍스트 요소 가져오기
                if (textElement) {
                    textElement.style.transform = 'scale(1.2)'; // 텍스트 확대
                }
            });

            // 마우스 아웃 시 색상 복원
            region.addEventListener('mouseout', function () {
                const textElement = svgDoc.querySelector(`text#${region.id}`);
                if (textElement) {
                    textElement.style.transform = 'scale(1)'; // 텍스트 크기 복원
                }
                if (region !== selectedRegion) {
                    region.style.fill = '#e6cbae'; // 마우스 아웃 시 기본 색상으로 복원
                    region.classList.remove('hover-effect'); // 음영 효과 제거
                }
            });

            // 지역구 클릭 시 동작 설정
            region.addEventListener('click', function () {
                // 이전에 선택된 지역이 있으면 스타일 초기화
                if (selectedRegion) {
                    selectedRegion.style.fill = '#e6cbae'; // 이전 선택된 지역 색상 초기화
                    selectedRegion.classList.remove('clicked');
                }

                // 현재 클릭된 지역 업데이트 및 스타일 변경
                selectedRegion = region;
                region.style.fill = '#F9973E'; // 선택된 지역구 색상 변경
                region.classList.add('clicked'); // 선택된 상태 표시

                const regionId = region.getAttribute('id'); // 지역구 ID 가져오기
                const regionName = getRegionName(regionId); // 지역구 이름 가져오기

                // 선택된 지역구 제목 및 설명 업데이트
                selectedRegionTitle.textContent = `서울시 ${regionName}`;
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 ${regionName}`;

                // 선택된 지역구 ID 출력
                console.log(`선택된 지역구 ID: ${regionId}`);

                // 관련 이벤트 카드를 갱신
                updateEventCards(regionId);

                // 페이지네이션을 1번으로 리셋
                selectedPageButton.classList.remove('selected');
                selectedPageButton.style.backgroundColor = '#FFEFDC';
                selectedPageButton.style.color = '#FF6347';

                selectedPageButton = paginationButtons[0]; // 첫 번째 페이지 버튼 선택
                selectedPageButton.classList.add('selected');
                selectedPageButton.style.backgroundColor = '#FF6347';
                selectedPageButton.style.color = 'white';
            });
        });
    });

    // 지역구 이름 반환 함수
    function getRegionName(regionId) {
        // 지역구 ID에 따른 이름 반환
        switch (regionId) {
            case 'Jongno-gu': return '종로구';
            case 'Jung-gu': return '중구';
            case 'Yongsan-gu': return '용산구';
            case 'Seongdong-gu': return '성동구';
            case 'Gwangjin-gu': return '광진구';
            case 'Dongdaemun-gu': return '동대문구';
            case 'Jungnang-gu': return '중랑구';
            case 'Seongbuk-gu': return '성북구';
            case 'Gangbuk-gu': return '강북구';
            case 'Dobong-gu': return '도봉구';
            case 'Nowon-gu': return '노원구';
            case 'Eunpyeong-gu': return '은평구';
            case 'Seodaemun-gu': return '서대문구';
            case 'Mapo-gu': return '마포구';
            case 'Yangcheon-gu': return '양천구';
            case 'Gangseo-gu': return '강서구';
            case 'Guro-gu': return '구로구';
            case 'Geumcheon-gu': return '금천구';
            case 'Yeongdeungpo-gu': return '영등포구';
            case 'Dongjak-gu': return '동작구';
            case 'Gwanak-gu': return '관악구';
            case 'Seocho-gu': return '서초구';
            case 'Gangnam-gu': return '강남구';
            case 'Songpa-gu': return '송파구';
            case 'Gangdong-gu': return '강동구';
            default: return '알 수 없는 지역'; // 알 수 없는 지역 처리
        }
    }

    // 이벤트 카드 갱신 함수 (regionId에 맞는 이벤트 카드를 보여주는 함수)
    function updateEventCards(regionId) {
        const eventCardsContainer = document.getElementById('grid');
        eventCardsContainer.innerHTML = ''; // 기존 카드 초기화

        const eventCards = getEventCards(regionId); // 지역구에 따른 이벤트 카드를 불러옴
        eventCards.forEach(card => {
            const cardElement = document.createElement('div');
            cardElement.classList.add('event-card');
            cardElement.innerHTML = `<h3>${card.title}</h3><p>${card.description}</p>`;
            eventCardsContainer.appendChild(cardElement);
        });
    }

    // TODO 예시 데이터 (실제 데이터로 대체 필요)
    function getEventCards(regionId) {
        return [
            {
                title: `청년 쿡 비즈니스센터 운영`,
                description: '청년 스타트업 육성... <div class="deadline-btn" data-status="deadline">신청마감</div>'
            },
            {
                title: `대학생 아르바이트 사업`,
                description: '서울시 대학생을 위한... <div class="deadline-btn" data-status="progress">진행중</div>'
            },
        ];
        console.log(`${regionId}`);
    }

});
