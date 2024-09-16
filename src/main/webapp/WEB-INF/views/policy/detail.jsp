<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/components/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정책 지원 페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/policy/detail.css">
    <script src="${pageContext.request.contextPath}/js/policy/detail.js"></script>
</head>
<body>

<div class="policy-detail-page">
    <div class="policy-header">
        <div class="policy-title">
            <h2>서울시 청년수당</h2>
        </div>
        <div class="button-link">
        <%-- 공유와 찜하기 버튼 위치 우상단.--%>
            <button type="button" class="sns-share">
                <img src="${pageContext.request.contextPath}/assets/img/share_icon_0.8.png" alt="공유하기">
            </button>
            <div class="share-group" style="display: none;">
                <p class="title"> 공유하기</p>
                <ul>
                    <li>
                        <a href="" title="새 창 열기">아이콘1</a>
                    </li>
                    <li>
                        <a href="" title="새 창 열기">아이콘2</a>
                    </li>
                    <li>
                        <a href="" title="새 창 열기">아이콘3</a>
                    </li>
                </ul>
            </div>
                <button type="button" class="wish-list">
                    <img src="${pageContext.request.contextPath}/assets/img/heart_icon_0.8.png" alt="찜하기">
                </button>
        </div>
    </div>

    <div class="policy-table-header">
        <h3>한 눈에 보는 정책 요약</h3>
    </div>
    <div class="policy-table-content">
        <ul>
            <li>
                <div class="list-container">
                    <div class="list-title">정책 번호</div>
                    <div class="list-content">R2024022820205</div>
                </div>
                <div class="list-container">
                    <div class="list-title">정책 분야</div>
                    <div class="list-content">일자리분야</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">사업 운영 기간</div>
                    <div class="list-content">2024.03.~2024.12.</div>
                </div>
                <div class="list-container">
                    <div class="list-title">사업 신청 기간</div>
                    <div class="list-content">2024년 06월 11일 ~ 2024년 06월 13일</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">지원 규모</div>
                    <div class="list-content">20,000명 내외</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                <div class="list-title">지원 내용</div>
                <div class="list-content">
                    ㅇ (금전적 지원) 매월 50만원 × 최대 6개월
                    <br>
                    ㅇ 사용방법
                    <br>
                    - 체크카드 사용이 원칙이며, 사업 목적에 부합한 범위에서 자유롭게 사용 가능
                    <br>
                    - 현금사용은 금지되며, 특정 항목에 한하여 예외적 계좌이체 허용
                    <br>
                    * (특정항목: ①주거(전·월세비, 주거 관리비, 주거 관련 대출), ②생활·공과금(전기·가스·수도요금, 통신비, 건강보험료), ③교육(학자금 대출, 자격증·시험 응시료) 에만 현금사용 가능, 나머지 항목엔 현금사용 금지
                    <br><br>
                    - 현금으로 사용(계좌이체)한 경우 항목에 적합한 증빙서류를 자기활동기록서에 제출해야 하며, 개별적으로도 증빙자료를 2024.12.31.까지 보관 바람
                    <br>
                    * 전·월세비 : 전·월세 관련 계약서 + 이체내역서
                    <br>
                    * 전기·가스·수도요금, 건강보험료, 통신비 : 납부고지서 + 이체내역서
                    <br>
                    * 주거 관련 대출, 학자금대출 납부 : 대출 계약서류 + 이체내역서
                    <br>
                    * 자격증·시험 응시료 : 수험표 및 응시서류 + 이체내역서
                    <br>
                    - 추후 모니터링을 통해 부정사용으로 적발될 시 청년수당 지급 중단 또는 환수 조치 예정
                    <br><br>
                    ㅇ 유의사항
                    <br>
                    - 진로탐색 및 구직활동 등 사업 목적에 맞게 사용, 사업 목적에 벗어난 용도(주점, 귀금속, 호텔, 재산축적 등) 사용 제한
                    <br>
                    - 다른 통장으로 청년수당을 이체하여 사용하는 행위 금지
                    <br>
                    - 호텔, 주점, 총포류 판매업, 카지노, 상품권 판매(기프티콘 포함), 귀금속, 백화점, 면세점, 안마시술소 등 유흥, 사행 목적 사용 금지
                    <br>
                    - 청년수당 카드는 클린카드 기능이 적용되어 제한업종에서 결제가 되지 않습니다.
                    <br>
                    - 개인재산 축적 용도 사용 제한: 예금, 적금, 민간보험·국민연금 납입, 상품권 구입(기프트콘 포함)
                    <br>
                    - 서울 외 지역에서도 사용 가능하나, 해외 결제 불가
                    <br>
                    ※ 청년수당은 반드시 사업 목적에 맞게 사용해 주시기 바랍니다.
                    <br><br>
                    ㅇ 청년수당 사용 불가 항목:
                    <br>
                    - 지출내역 및 자금 흐름을 확인할 수 없도록 수당 사용
                    <br>
                    (ex: 타계좌로 이체, 휴대폰 소액결제, 카카오페이, 더치페이 등),
                    <br>
                    - 현금사용내역 증빙이 어려운 경우(중고거래, 경조사비, 종교 헌금, 기부 등),
                    <br>
                    - 기타 사회 정서상 허용되기 어려운 용도로 수당사용(진로와 무관한 고가의 사치품 구입, 단순 미용 목적등)</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                <div class="list-title">비고</div>
                <div class="list-content">2024년 06월 11일 10:00 ~ 2024년 06월 13일 16:00
                </div>
                </div>
            </li>

        </ul>
    </div>

    <div class="policy-table-header">
        <h3>신청자격</h3>
    </div>
    <div class="policy-table-content">
        <ul>
            <li>
                <div class="list-container">
                    <div class="list-title">연령</div>
                    <div class="list-content">만 19세 ~ 34세</div>
                </div>
                <div class="list-container">
                    <div class="list-title">취업 상태</div>
                    <div class="list-content">미취업자, 단기근로자는 지원대상 포함(주 30시간 또는 3개월 이하로 계약된 근로자</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">학력</div>
                    <div class="list-content">	고교, 대학, 대학원 졸업(예정)
                        최종학력 졸업</div>
                </div>
                <div class="list-container">
                    <div class="list-title">전공</div>
                    <div class="list-content">제한없음</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">특화 분야</div>
                    <div class="list-content">제한없음</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">거주지 및 소득</div>
                    <div class="list-content">
                        □ 거주요건 : 신청일 기준, 서울시 주민등록상 거주자
                        <br>
                        ※ 사업 신청 시 기입한 신청자 주민등록번호로 서울거주 여부 일괄 조회
                        <br>
                        ※ 외국 국적 등 주민등록번호가 없는 청년은 신청 불가
                        <br><br>
                        □ 신청연령 : 만 19세 ~ 만 34세(출생일이 1989년 6월 1일 ~ 2005년 6월 30일인 자)
                        <br><br>
                        □ 소득요건 : 중위소득 150%이하
                        <br><br>
                        □ 기타요건 :미취업자만 신청가능 단, 주30시간 이하 또는 3개월 이하 단기근로자 신청 가능
                        ※ 단, 주 30시간 이하 또는 3개월 이하 근로시간 확인이 가능한 별도의 증빙자료 (ex.근로계약서,퇴직증명서 등) 제출 시만 인정</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">참여 제한 대상</div>
                    <div class="list-content">
                        - 주민등록상 서울시 미거주자(신청 시점 기준)
                        <br>
                        - 재학생 및 휴학생
                        <br>
                        ※ 단, 방송통신대학·사이버대학·학점은행제는 이전 최종학력 졸업 증빙하여 신청 가능
                        <br>
                        - 고용보험에 가입된, 3개월 초과 그리고 주 30시간 초과 근로하는 취업자
                        <br>
                        - 유사사업 참여중인 자 (2024년 3월 1일부터 사업 참여 종료일까지)
                        <br>
                        · 서울시 ｢청년월세지원｣ 사업 참여자
                        <br>
                        · 서울시 ｢희망두배 청년통장｣ 사업 참여자
                        <br>
                        · 고용노동부 ｢청년내일채움공제｣ 사업 참여자
                        <br>
                        · 고용노동부 ｢국민취업지원제도｣ 1유형 및 2유형 참여자
                        <br>
                        - 2017년~2023년 서울시 청년수당 사업 참여자 (생애 1회 지원)
                        <br>
                        - 중위소득 150% 초과 가구 청년
                        <br>
                        ※ ’24년 2월 건강보험료 본인부담금(노인장기요양보험료 제외) 기준
                        <br><br>
                        - 기초생활수급자(생계·의료·교육·주거급여자) 및 차상위계층 (신청 시점 기준)
                        <br>
                        - 실업급여 수급중인 자 (신청 시점 기준)
                        <br><br>
                        * 2024년 2월까지 구직촉진수당을 받고 3월부터는 미수령 상태라면 청년수당 신청 가능합니다.</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">추가 단서 사항</div>
                    <div class="list-content">
                        취업여부 : 최종학력 졸업(중퇴·제적·수료) 후 미취업자
                        <br>
                        미취업자(고용보험 미가입자) 및 단기근로자(주 30시간 이하 또는 3개월 이하로 근로계약된 근로자) 신청 가능
                        - 고용보험에 가입된 단기근로자는 주 30시간 이하 또는 3개월 이하 근로시간 확인이 가능한 별도의 증빙자료(ex.근로계약서 등) 제출 시만 인정
                        <br>
                        ※ 사업참여 제외대상 : 공고문의 붙임 참고</div>
                </div>
            </li>


        </ul>
    </div>

    <div class="policy-table-header">
        <h3>신청방법</h3>
    </div>
    <div class="policy-table-content">
        <ul>
            <li>
                <div class="list-container">
                <div class="list-title">신청 절차</div>
                <div class="list-content">
                    서울청년몽땅정보통(youth.seoul.go.kr) 접속 후, 온라인 접수
                    <br>
                    접수기간 내 온라인 신청만 가능(직접 접수 및 우편접수 등 불가능)
                    <br><br>
                    △서울시 청년수당 콜센터(☎1566-3344)
                    <br>
                    △서울시 다산콜센터(☎120)
                    <br>
                    △온라인 서울청년몽땅정보통 ‘청년수당 Q&A’로 문의
                    <br>
                    △ 온통청년 카카오톡 상담하기 (온라인 실시간 상담 이용하기➡ https://url.kr/r8bcva )</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                <div class="list-title">심사 및 발표</div>
                <div class="list-content">
                    선정 및 발표
                    <br>
                    - 예비선정자 발표 : 4. 5.(금) 18:00 (예정)
                    <br>
                    * 변동사항은 청년몽땅정보통 공지사항 게시판 안내
                    <br>
                    * 확인방법 : 청년몽땅정보통 접속 후 “마이페이지”에서 확인
                    <br>
                    - 필수 이행사항
                    <br>
                    ① 청년수당 참여자 사전교육
                    <br>
                    ② 계좌 개설 및 카드발급
                    <br>
                    * 청년수당 전용계좌 미개설한 예비선정자는 최종 미 선정
                    <br>
                    - 청년수당 1회차 첫 지급 : 4. 29.(월) (예정)
                    <br>
                    * 매월 29일 지급 원칙(29일이 휴일인 경우, 직전 평일에 지급)</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">신청 사이트</div>
                    <div class="list-content">https://youth.seoul.go.kr/youthPnsn/step1.do?key=2308160001</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">제출 서류</div>
                    <div class="list-content">
                        □ 제출서류 (2종)
                        <br>
                        ※ 모든 제출서류는 원본 서류를 스캔하여 업로드, ‘화면캡쳐본, 컴퓨터 화면을 찍은 사진 등’은 인정되지 않음
                        <br>
                        (필수) 최종학력 졸업증명서 또는 수료증 1부
                        <br>
                        졸업예정자는 졸업 학점 이수 완료를 증빙할 성적증명서 또는 성적증명서+재학증명서를 대체 서류로 제출
                        <br><br>
                        (선택) 근로계약서 1부 *단기근로자만 제출
                    </div>
                </div>
        </ul>
    </div>
    <div class="policy-table-header">
        <h3>기타</h3>
    </div>
    <div class="policy-table-content">
        <ul>
            <li>
                <div class="list-container">
                    <div class="list-title">기타 유익 정보</div>
                    <div class="list-content">
                        신청 시 기입 정보
                        <br>
                        - 주민등록상 이름, 거주지, 연락처, 주민등록번호, 졸업일자 등 정확히 입력
                        <br>
                        - 접수 후 주민등록상 정보와 다를 경우 선정 취소될 수 있음
                        <br>
                        - 안내사항에 대한 문자를 받을 수 있도록 연락처 정확히 기재 필요</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">주관 기관</div>
                    <div class="list-content">서울시청 미래청년기획단</div>
                </div>
                <div class="list-container">
                    <div class="list-title">운영 기관</div>
                    <div class="list-content">주관기관과 동일</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">사업관련 참고 사이트1</div>
                    <div class="list-content">https://youth.seoul.go.kr/youthConts.do?key=2310100061&sc_pbancSeCd=012&sc_bbsStngSn=2212200001&sc_bbsCtgrySn=2310200011&sc_qnaCtgryCd=004&sc_faqCtgryCd=005</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">사업관련 참고 사이트2</div>
                    <div class="list-content">https://youth.seoul.go.kr/youthConts.do?key=2310100061&sc_pbancSeCd=012&sc_bbsStngSn=2212200001&sc_bbsCtgrySn=2310200011&sc_qnaCtgryCd=004&sc_faqCtgryCd=005</div>
                </div>
            </li>
            <li>
                <div class="list-container">
                    <div class="list-title">첨부 파일</div>
                    <div class="list-content">https://youth.seoul.go.kr/youthConts.do?key=2310100061&sc_pbancSeCd=012&sc_bbsStngSn=2212200001&sc_bbsCtgrySn=2310200011&sc_qnaCtgryCd=004&sc_faqCtgryCd=005</div>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="top-areas">
    <h2>지금 보고 있는 혜택과 비슷한 혜택</h2>
    <div class="areas-list">
        <div class="area-item">
            <div class="area-container">
                <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
            </div>
            <div class="text">
                <p class="region-name">강남구</p>
                <p class="region-tag">#역세권 1위!</p>
            </div>
        </div>
        <div class="area-item">
            <div class="area-container">
                <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
            </div>
            <div class="text">
                <p class="region-name">강남구</p>
                <p class="region-tag">#역세권 1위!</p>
            </div>
        </div>
        <div class="area-item">
            <div class="area-container">
                <img src="${pageContext.request.contextPath}/assets/img/gangnam.png" alt="지역구"/>
            </div>
            <div class="text">
                <p class="region-name">강남구</p>
                <p class="region-tag">#역세권 1위!</p>
            </div>
        </div>

    </div>
</div>
</body>
<footer>

</footer>
</html>
