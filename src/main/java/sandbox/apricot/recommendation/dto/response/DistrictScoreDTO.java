package sandbox.apricot.recommendation.dto.response;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class DistrictScoreDTO {

    private String districtCode;
    private Double districtScore;

    @Builder
    public DistrictScoreDTO(String districtCode, Double districtScore) {
        this.districtCode = districtCode;
        this.districtScore = districtScore;
    }

}