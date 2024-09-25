package sandbox.apricot.recommendation.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;


@Mapper
public interface RecommendationMapper {

    // 개인별 지역구 점수(수) 통계를 반환하는 메서드
    List<DistrictScoreDTO> findAllDistrictScoreFromPolicyNumberByMemberId(Long memberId);

    // 개인별 지역구 점수(정책점수반영) 통계를 반환하는 메서드
    List<DistrictScoreDTO> findAllDistrictScoreFromPolicyReputationByMemberId(Long memberId);

}
