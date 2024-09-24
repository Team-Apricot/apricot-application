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
    private Long averageRating;  // 해당 지역구의 평균 평가 점수
    private String memberId; // 회원 ID
    private String policyId; // 정책 ID
    private String categoryCd;
    private String priority;

    public RecommendationDTO(String district) {
        this.district = district;
    }

    private String categoryCode;

    @Builder
    public RecommendationDTO(String district, Long averageRating, String categoryCd) {
        this.district = district;
        this.averageRating = averageRating;
        this.categoryCd = categoryCd;
    }
}
