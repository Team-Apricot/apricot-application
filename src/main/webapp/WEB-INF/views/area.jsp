<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/components/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울시 지역구 이벤트</title>
    <link rel="stylesheet" href="styles.css">
    <script src="script.js" defer></script>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #FFF7E6;
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 1440px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 40px;
        }

        header img {
            width: 50px;
            height: 50px;
        }

        h1 {
            color: #FF6347;
            font-size: 32px;
            display: flex;
            align-items: center;
        }

        .content {
            display: flex;
            justify-content: space-between;
        }

        .map {
            width: 45%;
        }

        .details {
            width: 50%;
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .details h2 {
            font-size: 24px;
            color: #FF6347;
        }

        .details p {
            font-size: 18px;
            color: #666;
            margin-bottom: 20px;
        }

        /* region 클래스에 입체 효과 추가 */
        .region {
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .region:hover {
          transform: scale(1.05); /* 살짝 확대 */
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2), 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        /* 클릭된 구역의 스타일 */
        .region.clicked {
          fill: #F9973E; /* 클릭된 구역의 색상 */
          transform: scale(1.1); /* 클릭 시 확대 */
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2), 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        /*모달 구성 스타일*/
        .categories {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .categories button {
            background-color: #FF6347;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 20px;
            font-size: 16px;
        }

        .categories button:hover {
            background-color: #FF4500;
        }

        .event-card {
            background-color: #FFEFDC;
            padding: 20px;
            border-radius: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .event-card button {
            background-color: #FF6347;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }

        footer {
            text-align: center;
            margin-top: 50px;
            color: #555;
            background-color: #FFEFDC;
            padding: 10px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            list-style-type: none;
            padding: 0;
        }

        .pagination li {
            margin: 0 5px;
        }

        .pagination li a {
            text-decoration: none;
            color: #FF6347;
            padding: 10px 15px;
            border-radius: 50%;
            background-color: #FFEFDC;
        }

        .pagination li a:hover {
            background-color: #FF6347;
            color: white;
        }


        /* 모달 스타일 */
        #modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 80%;
            max-width: 600px;
        }

        .modal-content {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        #close-modal {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <section class="content">
            <div class="map">
                <!-- 서울시 지역구 SVG -->
                <object type="image/svg+xml" data="${pageContext.request.contextPath}/assets/img/Seoul_districts.svg" id="seoul-map"></object>
            </div>
        </section>

        <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
        </ul>

        <footer>
            <p>Team Github | <a href="https://github.com">github.com</a></p>
        </footer>
    </div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const seoulMap = document.getElementById('seoul-map');
        let selectedRegion = null;  // 클릭한 구역 저장

        // 모달 관련 요소
        const modal = document.createElement('div');
        modal.setAttribute('id', 'modal');
        modal.style.display = 'none';  // 모달 숨기기
        modal.innerHTML = `
            <div class="modal-content">
                <span id="close-modal" style="cursor: pointer;">&times;</span>
                <h2 id="region-name">서울시 종로구</h2>
                <p id="region-description">서울의 심장 다시 뛰는 종로</p>
                <!-- 카테고리 버튼 및 이벤트 카드 -->
                <div class="categories">
                    <button>일자리</button>
                    <button>주거</button>
                    <button>교육</button>
                    <button>복지</button>
                    <button>참여·권리</button>
                </div>
                <div class="events">
                    <div class="event-card">
                        청년 콕 비즈니스센터 운영
                        <button>신청마감</button>
                    </div>
                    <div class="event-card">
                        대학생 아르바이트 사업
                        <button>상시</button>
                    </div>
                    <div class="event-card">
                        종로청년창업센터
                        <button>진행중</button>
                    </div>
                </div>
            </div>
        `;
        document.body.appendChild(modal);

        const closeModal = document.getElementById('close-modal');
        const modalElement = document.getElementById('modal');

        // 모달 닫기 버튼 클릭 이벤트
        closeModal.addEventListener('click', function () {
            modalElement.style.display = 'none';
            // 클릭한 구역의 색상과 입체 효과 원래대로 복구
            if (selectedRegion) {
                selectedRegion.classList.remove('clicked');
                selectedRegion.style.fill = '#e6cbae'; // 원래 색상으로 복구
                selectedRegion = null;
            }
        });

        // SVG 파일 로드 시 실행
        seoulMap.addEventListener('load', function () {
            const svgDoc = seoulMap.contentDocument;
            const regions = svgDoc.querySelectorAll('path');

            regions.forEach(region => {
                // 초기 색상 및 효과 설정
                region.style.fill = '#e6cbae';
                region.classList.add('region'); // 입체 효과를 위한 클래스 추가

                // 마우스 오버 시 입체 효과 적용
                region.addEventListener('mouseover', function () {
                    if (region !== selectedRegion) {
                        region.style.fill = '#D29660';
                    }
                });

                // 마우스 아웃 시 원래 색상으로 복귀
                region.addEventListener('mouseout', function () {
                    if (region !== selectedRegion) {
                        region.style.fill = '#e6cbae';
                    }
                });

                // 클릭 시 색상 및 입체 효과 고정하고 모달 표시
                region.addEventListener('click', function () {
                    // 이전에 클릭된 구역이 있으면 원래 상태로 복귀
                    if (selectedRegion) {
                        selectedRegion.classList.remove('clicked');
                        selectedRegion.style.fill = '#e6cbae'; // 원래 색상으로 복구
                    }

                    // 현재 클릭한 구역을 저장하고 색상 및 입체 효과 적용
                    selectedRegion = region;
                    region.classList.add('clicked');
                    region.style.fill = '#F9973E'; // 클릭 시 색상 변경

                    // 모달 표시
                    modalElement.style.display = 'block';
                    document.getElementById('region-name').textContent = `서울시 ${region.getAttribute('data-name')}`;
                    document.getElementById('region-description').textContent = `${region.getAttribute('data-description')}`;
                });

                // 각 지역에 대한 데이터 추가
                switch (region.getAttribute('id')) {
                    case 'jongro':
                        region.setAttribute('data-name', '종로구');
                        region.setAttribute('data-description', '서울의 심장 다시 뛰는 종로');
                        break;
                    case 'gangnam':
                        region.setAttribute('data-name', '강남구');
                        region.setAttribute('data-description', '패션과 비즈니스의 중심 강남');
                        break;
                    case 'mapo':
                        region.setAttribute('data-name', '마포구');
                        region.setAttribute('data-description', '문화와 청춘의 메카 마포');
                        break;
                    // 다른 구역들에 대한 데이터 추가
                    // 예: region.setAttribute('data-name', '서초구');
                    // region.setAttribute('data-description', '문화와 비즈니스의 중심 서초');
                }
            });
        });
    });

</script>

</body>
</html>


