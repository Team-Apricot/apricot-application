package sandbox.apricot.recommendation.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.dto.response.PolicyScoreDTO;
import sandbox.apricot.recommendation.dto.response.ScrapGroupSimilarityDTO;


@Mapper
public interface RecommendationMapper {

    // 개인별 지역구 점수(수) 통계를 반환하는 메서드
    List<DistrictScoreDTO> findAllDistrictScoreFromPolicyNumberByMemberId(Long memberId);

    // 개인별 지역구 점수(정책점수반영) 통계를 반환하는 메서드
    List<DistrictScoreDTO> findAllDistrictScoreFromPolicyScoreByMemberId(Long memberId);

    // 찜 행위 기반 유사그룹의 선호 지역구를 추천해주는 메서드
    List<ScrapGroupSimilarityDTO> getDistrictRecommendFromScrapBehaviorByMemberId(
            String originalAgeRange,
            String originalGender);

    List<PolicyScoreDTO> getRelatedPolicyByPolicyScore(String policyCode);
}
