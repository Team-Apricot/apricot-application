package sandbox.apricot.recommendation.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PolicyScoreDTO {

    private String policyCode;
    private String districtCode;
    private double totalScore;
    private int reviewCount;
    private double averageScore;
    private String categoryCode;

    @Builder
    PolicyScoreDTO(String policyCode, String districtCode, double totalScore, int reviewCount,
            double averageScore, String categoryCode) {
        this.policyCode = policyCode;
        this.districtCode = districtCode;
        this.totalScore = totalScore;
        this.reviewCount = reviewCount;
        this.averageScore = averageScore;
        this.categoryCode = categoryCode;
    }

}
