package sandbox.apricot.recommendation.service;

import java.util.ArrayList;
import java.util.Comparator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sandbox.apricot.recommendation.dto.RecommendationDTO;
import sandbox.apricot.recommendation.dto.RecommendationScoreDTO;
import sandbox.apricot.recommendation.mapper.RecomendationMapper;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

    private final RecomendationMapper recomendationMapper;

    // 회원의 선호 카테고리와 평가를 기반으로 추천 지역구 목록을 반환
    @Override
    public List<RecommendationDTO> getRecommendedDistricts(Long memberId, List<String> interests) {
        return recomendationMapper.selectRecommendedDistricts(memberId, interests);
    }

    // 특정 지역구의 정책 평균 평가 점수를 반환
    @Override
    public List<RecommendationDTO> getDistrictPolicyRating(Long memberId, String categoryCd) {
        List<RecommendationDTO> list = recomendationMapper.getDistrictPolicyRating(memberId, categoryCd);

        for (RecommendationDTO recommendationDTO : list) {
            System.out.println(recommendationDTO.toString());
        }
        //return recomendationMapper.getDistrictPolicyRating(memberId,categoryCd);
        return list;
    }

    // 특정 지역구의 총점 결과
    @Override
    public List<RecommendationScoreDTO> getScoreDistrict(String district, String totalScore) {
        // mapper 에서 목록 탐색
        List<RecommendationScoreDTO> list = new ArrayList<>(recomendationMapper.getScoreDistrict(district, totalScore));

        // 총점수 내림차순으로 목록 정렬
        System.out.println(list);
        return list;
    }
}
