package sandbox.apricot.recommendation.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sandbox.apricot.member.mapper.MemberMapper;
import sandbox.apricot.member.util.exception.MemberBusinessException;
import sandbox.apricot.member.vo.Member;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.dto.response.PolicyScoreDTO;
import sandbox.apricot.recommendation.dto.response.RecommendationInfo;
import sandbox.apricot.recommendation.dto.response.ScrapGroupSimilarityDTO;
import sandbox.apricot.recommendation.mapper.RecommendationMapper;

import java.util.List;
import sandbox.apricot.recommendation.util.DataPreprocess;

@Service
@RequiredArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

    private final RecommendationMapper recommendationMapper;
    private final MemberMapper memberMapper;

    @Override
    public RecommendationInfo getRecommendationInfo(Long memberId) {
        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));

        String nickName = member.getNickName();
        String ageRange = member.getAgeRange();
        String gender = member.getGender();

        List<DistrictScoreDTO> listByDistrictPolicyCnt = getDistrictScoreByPolicyNumber(memberId);
        List<DistrictScoreDTO> listByDistrictPolicyScore = getDistrictScoreByPolicyScore(memberId);
        List<ScrapGroupSimilarityDTO> listByDistrictPolicyScrapOfScrapGroup =
                getRecommendationByScrapGroup(ageRange, gender); // 스크랩 점수 추천

        return RecommendationInfo.builder()
                .nickName(nickName)
                .listByDistrictPolicyCnt(listByDistrictPolicyCnt)
                .listByDistrictPolicyScore(listByDistrictPolicyScore)
                .listByDistrictPolicyScrapOfScrapGroup(listByDistrictPolicyScrapOfScrapGroup)
                .build();
    }

    @Override
    public List<DistrictScoreDTO> getDistrictScoreByPolicyNumber(Long memberId) {
        List<DistrictScoreDTO> districtScores = recommendationMapper.findAllDistrictScoreFromPolicyNumberByMemberId(
                memberId);
        Double maxPolicyCnt = districtScores.stream()
                .mapToDouble(DistrictScoreDTO::getDistrictScore)
                .max()
                .orElse(1.0);

        districtScores.forEach(districtScore -> {
            Double normalizedScore = DataPreprocess.normalizeScore(districtScore.getDistrictScore(),
                    maxPolicyCnt);
            normalizedScore = Math.round(normalizedScore * 100.0) / 100.0;
            districtScore.setDistrictScore(normalizedScore);
        });

        districtScores.forEach(districtCode -> {
            String districtName = DataPreprocess.getDistrictNameByCode(
                    districtCode.getDistrictCode());
            districtCode.setDistrictCode(districtName);
        });

        return districtScores;
    }

    @Override
    public List<DistrictScoreDTO> getDistrictScoreByPolicyScore(Long memberId) {
        List<DistrictScoreDTO> districtScores =
                recommendationMapper.findAllDistrictScoreFromPolicyScoreByMemberId(memberId);
        Double maxPolicyCnt = districtScores.stream()
                .mapToDouble(DistrictScoreDTO::getDistrictScore)
                .max()
                .orElse(1.0);

        districtScores.forEach(districtScore -> {
            Double normalizedScore = DataPreprocess.normalizeScore(districtScore.getDistrictScore(),
                    maxPolicyCnt);
            normalizedScore = Math.round(normalizedScore * 100.0) / 100.0;
            districtScore.setDistrictScore(normalizedScore);
        });

        districtScores.forEach(districtCode -> {
            String districtName = DataPreprocess.getDistrictNameByCode(
                    districtCode.getDistrictCode());
            districtCode.setDistrictCode(districtName);
        });

        return districtScores;
    }

    @Override
    public List<ScrapGroupSimilarityDTO> getRecommendationByScrapGroup(
            String ageRange, String gender) {
        List<ScrapGroupSimilarityDTO> similarInfo =
                recommendationMapper.getDistrictRecommendFromScrapBehaviorByMemberId(
                        ageRange,
                        gender);
        similarInfo.forEach(districtCode -> {
            String districtName = DataPreprocess.getDistrictNameByCode(
                    districtCode.getDistrictCode());
            districtCode.setDistrictCode(districtName);
        });
        return similarInfo;
    }

    @Override
    public List<PolicyScoreDTO> getPolicyRecommendation(String policyCode) {
        return recommendationMapper.getRelatedPolicyByPolicyScore(policyCode);
    }


}
