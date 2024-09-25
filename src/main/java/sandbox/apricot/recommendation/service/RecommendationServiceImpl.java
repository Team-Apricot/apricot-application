package sandbox.apricot.recommendation.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.mapper.RecommendationMapper;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

    private final RecommendationMapper recommendationMapper;

    @Override
    public List<DistrictScoreDTO> getDistrictScoreByPolicyNumber(Long memberId) {
        return recommendationMapper.findAllDistrictScoreFromPolicyNumberByMemberId(memberId);
    }

    @Override
    public List<DistrictScoreDTO> getDistrictScoreByPolicyReputation(Long memberId) {
        return recommendationMapper.findAllDistrictScoreFromPolicyReputationByMemberId(memberId);
    }
}
