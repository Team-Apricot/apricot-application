package sandbox.apricot.recommendation.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class RecommendationDTO {

    private String district;  // 추천할 지역구 이름
    //private Long averageRating;  // 해당 지역구의 평균 평가 점수
    private Long memberId; // 회원 ID
    //private String policyId; // 정책 ID
    private String categoryCd;
    private String priority;
    //private String districtCd; // 지역구 코드
    private String totalScore; // 지역구 총점
    private String district01; //종로구
    private String district02; //중구
    private String district03; //용산구
    private String district04; //성동구
    private String district05; //광진구
    private String district06; //동대문구
    private String district07; //중랑구
    private String district08; //성북구
    private String district09; //강북구
    private String district10; //도봉구
    private String district11; //노원구
    private String district12; //은평구
    private String district13; //서대문구
    private String district14; //마포구
    private String district15; //양천구
    private String district16; //강서구
    private String district17; //구로구
    private String district18; //금천구
    private String district19; //영등포구
    private String district20; //동작구
    private String district21; //관악구
    private String district22; //서초구
    private String district23; //강남구
    private String district24; //송파구
    private String district25; //강동구
    //private String categoryCode;

    // 기본 생성자
    public RecommendationDTO(String district) {
        this.district = district;
    }

    // @Builder 패턴을 적용한 생성자
    @Builder
    public RecommendationDTO(String district, Long averageRating, String categoryCd, Long memberId, String districtCd, String totalScore, String policyId, String priority, String categoryCode, String district01, String district02, String district03, String district04, String district05, String district06, String district07, String district08, String district09, String district10, String district11, String district12, String district13, String district14, String district15, String district16, String district17, String district18, String district19, String district20, String district21, String district22, String district23, String district24, String district25) {
        this.district = district;
        //this.averageRating = averageRating;
        this.categoryCd = categoryCd;
        this.memberId = memberId;
        //this.districtCd = districtCd;
        this.totalScore = totalScore;
        //this.policyId = policyId;
        this.priority = priority;
        //this.categoryCode = categoryCode;
        this.district01 = district01;
        this.district02 = district02;
        this.district03 = district03;
        this.district04 = district04;
        this.district05 = district05;
        this.district06 = district06;
        this.district07 = district07;
        this.district08 = district08;
        this.district09 = district09;
        this.district10 = district10;
        this.district11 = district11;
        this.district12 = district12;
        this.district13 = district13;
        this.district14 = district14;
        this.district15 = district15;
        this.district16 = district16;
        this.district17 = district17;
        this.district18 = district18;
        this.district19 = district19;
        this.district20 = district20;
        this.district21 = district21;
        this.district22 = district22;
        this.district23 = district23;
        this.district24 = district24;
        this.district25 = district25;
    }
}
