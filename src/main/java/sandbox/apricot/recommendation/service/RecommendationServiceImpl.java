package sandbox.apricot.recommendation.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sandbox.apricot.recommendation.dto.RecommendationDTO;
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
    public List<RecommendationDTO> getDistrictPolicyRating(String categoryCd) {
        List<RecommendationDTO> list = recomendationMapper.getDistrictPolicyRating(categoryCd);

        for (RecommendationDTO d : list) {
            System.out.println(d.toString());
        }
        return recomendationMapper.getDistrictPolicyRating(categoryCd);
    }
}
