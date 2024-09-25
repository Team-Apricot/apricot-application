package sandbox.apricot.recommendation.service;

import java.util.List;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.dto.response.PolicyScoreDTO;
import sandbox.apricot.recommendation.dto.response.ScrapGroupSimilarityDTO;

public interface RecommendationService {

    // 회원의 선호 혜택에 따라 각 지역구의 점수(정책 수 비례)을 가져 오는 메서드
    List<DistrictScoreDTO> getDistrictScoreByPolicyNumber(Long memberId);

    // 회원의 선호 혜택에 따라 각 지역구의 점수(각 지역구의 정책들 평가를 통해 지역구를 평가)을 가져 오는 메서드
    List<DistrictScoreDTO> getDistrictScoreByPolicyScore(Long memberId);

    // 회원의 찜하기 수에 따라, 그 이후는 지역구 점수에 따라 지역구를 가져옵니다.
    List<ScrapGroupSimilarityDTO> getRecommendationByScrapGroup(String ageRange, String gender);

    List<PolicyScoreDTO> getPolicyRecommendation(String policyCode);
}
