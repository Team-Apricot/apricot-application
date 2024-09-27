package sandbox.apricot.recommendation.dto.response;

import java.util.List;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RecommendationInfo {

    private String nickName;
    private List<DistrictScoreDTO> listByDistrictPolicyCnt; // 지역구 별 혜택수 추천
    private List<DistrictScoreDTO> listByDistrictPolicyScore; // 혜택 평가 점수 추천
    private List<ScrapGroupSimilarityDTO> listByDistrictPolicyScrapOfScrapGroup; // 스크랩 점수 추천

    @Builder
    public RecommendationInfo(String nickName, List<DistrictScoreDTO> listByDistrictPolicyCnt,
            List<DistrictScoreDTO> listByDistrictPolicyScore,
            List<ScrapGroupSimilarityDTO> listByDistrictPolicyScrapOfScrapGroup) {
        this.nickName = nickName;
        this.listByDistrictPolicyCnt = listByDistrictPolicyCnt;
        this.listByDistrictPolicyScore = listByDistrictPolicyScore;
        this.listByDistrictPolicyScrapOfScrapGroup = listByDistrictPolicyScrapOfScrapGroup;
    }

}
