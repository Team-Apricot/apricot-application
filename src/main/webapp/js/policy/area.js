document.addEventListener('DOMContentLoaded', function () {
    const seoulMap = document.getElementById('seoul-map');  // 서울 지도 SVG 파일을 가져오는 요소
    let selectedRegion = null; // 현재 선택된 지역을 저장하는 변수

    // 지역구 제목 및 설명을 업데이트하는 요소
    const selectedRegionTitle = document.getElementById('selected-region-title');
    const selectedRegionDescription = document.getElementById('selected-region-description');

    // 페이지네이션과 카테고리 버튼 상태 관리 변수
    let selectedPageButton = document.querySelector('.pagination li a.selected');
    let selectedCategoryButton = document.querySelector('.details input.selected');

    // 초기 페이지 버튼 스타일 설정
    selectedPageButton.style.backgroundColor = '#FF6347';
    selectedPageButton.style.color = 'white';

    // 페이지네이션 버튼 클릭 시 동작 설정
    const paginationButtons = document.querySelectorAll('.pagination li:not(.arrow) a');
    paginationButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            if (button !== selectedPageButton) {
                // 이전 선택된 페이지 버튼 초기화
                selectedPageButton.classList.remove('selected');
                selectedPageButton.style.backgroundColor = '#FFEFDC';
                selectedPageButton.style.color = '#FF6347';

                // 새로운 선택된 페이지 버튼 업데이트
                button.classList.add('selected');
                button.style.backgroundColor = '#FF6347';
                button.style.color = 'white';
                selectedPageButton = button;
            }
        });
    });

    // 카테고리 버튼 클릭 시 동작 설정
    const categoryButtons = document.querySelectorAll('.details input[type="button"]');
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
            selectedCategoryButton = button;

            // 카테고리를 변경하면 페이지네이션을 1번으로 초기화
            selectedPageButton.classList.remove('selected');
            selectedPageButton.style.backgroundColor = '#FFEFDC';
            selectedPageButton.style.color = '#FF6347';
            selectedPageButton = document.querySelector('.pagination li:not(.arrow) a:first-child');
            selectedPageButton.classList.add('selected');
            selectedPageButton.style.backgroundColor = '#FF6347';
            selectedPageButton.style.color = 'white';
        });
    });

    // SVG 지도 파일이 로드된 후 지역구 선택 이벤트 설정
    seoulMap.addEventListener('load', function () {
        const svgDoc = seoulMap.contentDocument;  // SVG 파일의 문서 객체 가져오기
        const regions = svgDoc.querySelectorAll('path');  // 각 지역구를 나타내는 path 요소

        regions.forEach(region => {
            // 지역구 기본 스타일 설정
            region.style.fill = '#e6cbae';
            region.classList.add('region');

            // 마우스 오버 시 지역구 색상 변경
            region.addEventListener('mouseover', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#D29660';  // 다른 지역구와 구분
                }
            });

            // 마우스 아웃 시 색상 복원
            region.addEventListener('mouseout', function () {
                if (region !== selectedRegion) {
                    region.style.fill = '#e6cbae';
                }
            });

            // 지역구 클릭 시 동작 설정
            region.addEventListener('click', function () {
                if (selectedRegion) {
                    selectedRegion.style.fill = '#e6cbae';  // 이전 선택된 지역 스타일 복원
                }

                selectedRegion = region;
                region.style.fill = '#F9973E';  // 새로운 선택된 지역 표시

                const regionId = region.getAttribute('id');
                const regionName = getRegionName(regionId);

                // 지역구 제목 및 설명 업데이트
                selectedRegionTitle.textContent = `서울시 ` + regionName;
                selectedRegionDescription.textContent = `서울의 심장 다시 뛰는 `+regionName;

                // 페이지네이션을 1번으로 리셋
                selectedPageButton.classList.remove('selected');
                selectedPageButton.style.backgroundColor = '#FFEFDC';
                selectedPageButton.style.color = '#FF6347';
                selectedPageButton = document.querySelector('.pagination li:not(.arrow) a:first-child');
                selectedPageButton.classList.add('selected');
                selectedPageButton.style.backgroundColor = '#FF6347';
                selectedPageButton.style.color = 'white';
            });
        });
    });

    // 지역구 이름 반환 함수
    function getRegionName(regionId) {
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
            default: return '알 수 없는 지역';
        }
    }
});