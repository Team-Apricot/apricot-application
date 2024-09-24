package sandbox.apricot.recommendation.service;

import java.util.List;
import sandbox.apricot.recommendation.dto.RecommendationDTO;

public interface RecommendationService {

    // 회원의 선호 카테고리와 평가를 기반으로 추천 지역구 목록을 반환
    List<RecommendationDTO> getRecommendedDistricts(Long memberId, List<String> interests);

    // 특정 지역구의 정책 평균 평가 점수를 가져옴
    List<RecommendationDTO> getDistrictPolicyRating(String categoryCd);

}
