package sandbox.apricot.recommendation.dto.response;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScrapGroupSimilarityDTO {

    private String originalGender;
    private String originalAgeRange;
    private String comparisonGender;
    private String comparisonAgeRange;
    private int preferenceCount;
    private String districtCode;
    private double cosineSimilarity;

    @Builder
    public ScrapGroupSimilarityDTO(String originalGender, String originalAgeRange,
            String comparisonGender, String comparisonAgeRange, int preferenceCount,
            String districtCode, double cosineSimilarity) {
        this.originalGender = originalGender;
        this.originalAgeRange = originalAgeRange;
        this.comparisonGender = comparisonGender;
        this.comparisonAgeRange = comparisonAgeRange;
        this.preferenceCount = preferenceCount;
        this.districtCode = districtCode;
        this.cosineSimilarity = cosineSimilarity;
    }
}
