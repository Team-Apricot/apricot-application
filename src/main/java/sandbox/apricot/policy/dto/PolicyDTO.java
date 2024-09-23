package sandbox.apricot.policy.dto;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class PolicyDTO {

    private String policyCode; // 정책 번호
    private String categoryCode; // 정책 분야
    private String districtCode; // 🏭 지역구
    private String policyName; // 정책명
    private String policyContent; // 정책 부연 설명
    private String supportContent; // 지원 내용

    private String prdRpttSecd; // 사업 신청 기간 - 반복 구분 내용
    private String schedule; // 사업 운영 기간 TODO: 가공 후 삭제. 일정 -> 정책 시작, 마감일 가공 패턴 찾기
    private String policyStartDate; // 🏭 정책 시작일
    private String policyEndDate; // 🏭 정책 마감일

    private String ageInfo; // 연령 TODO: 가공 후 삭제. 연령 정보 가공 패턴 찾기
    private Integer minAge; // 🏭 최소 연령
    private Integer maxAge; // 🏭 최대 연령

    private String majorRqisCn; // 전공
    private String empmSttsCn; // 취업 상태
    private String splzRlmRqisCn; // 특화 분야
    private String accrRqisCn; // 학력
    private String prcpCn; // 거주지 및 소득
    private String aditRscn; // 추가 단서 사항
    private String prcpLmttTrgtCn; // 참여 제한 대상
    private String rqutProcCn; // 신청 절차
    private String pstnPaprCn; // 제출 서류
    private String jdgnPresCn; // 심사 및 발표

    private String rqutUrla; // 신청 사이트
    private String rfcSiteUrla1; // 참고 사이트 URL 주소1
    private String rfcSiteUrla2; // 참고 사이트 URL 주소2

    private String mngtMson; // 주관 기관
    private String mngtMrofCherCn; // ➕ 주관 부처 담당자 이름
    private String cherCtpcCn; // ➕ 주관 부처 담당자 연락처

    private String cnsgNmor; // 운영 기관
    private String tintCherCn; // ➕ 운영 기관 담당자 이름
    private String tintCherCtpcCn; // ➕ 운영 기관 담당자 연락처

    private String etct; // 기타 유익 정보

}

