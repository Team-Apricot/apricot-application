package sandbox.apricot.recommendation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.recommendation.dto.RecommendationDTO;
import sandbox.apricot.recommendation.dto.RecommendationScoreDTO;

@Mapper
public interface RecomendationMapper {

    // 전체 회원의 지역구 추천 정보를 가져오는 메서드
    List<MemberInfo> selectAllRecommendation();

    // 사용자 선호 카테고리에 따른 지역구 추천 메서드
    List<RecommendationDTO> selectRecommendedDistricts(@Param("memberId") Long memberId, @Param("interests") List<String> interests);

    // 지역구별 정책 평가 점수를 가져오는 메서드
    List<RecommendationDTO> getDistrictPolicyRating(@Param("memberId") Long memberId, @Param("categoryCd") String categoryCd);
    
    // 지역구별 정책 총점을 가져오는 메서드
    List<RecommendationScoreDTO> getScoreDistrict(@Param("district") String district, @Param("totalScore") String totalScore);

}
