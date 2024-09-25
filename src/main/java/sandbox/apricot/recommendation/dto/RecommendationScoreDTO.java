package sandbox.apricot.recommendation.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class RecommendationScoreDTO {

    private String district;  // 추천할 지역구 이름
    private String totalScore; // 지역구 총점

    // 기본 생성자
    public RecommendationScoreDTO(String district) {
        this.district = district;
    }

    // @Builder 패턴을 적용한 생성자
    @Builder
    public RecommendationScoreDTO(String district, String totalScore) {
        this.district = district;
        this.totalScore = totalScore;
    }
}
