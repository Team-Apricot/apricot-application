package sandbox.apricot.recommendation.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;

import java.util.concurrent.TimeUnit;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

    private static final String REDIS_KEY = "recommendInfo";
    private final RecommendationMapper recommendationMapper;
    private final MemberMapper memberMapper;

    private final RedisTemplate<String, Object> redisTemplate;

    @Override
    public RecommendationInfo getRecommendationInfo(Long memberId) {
        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));

        // memberId를 포함한 고유한 Redis 키 생성
        String redisKeyForMember = REDIS_KEY + ":" + memberId;

        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        RecommendationInfo cachedData = null;

        try {
            cachedData = (RecommendationInfo) ops.get(redisKeyForMember); // 사용자별 캐시 키로 접근
            if (cachedData != null) {
                return cachedData;
            }
        } catch (Exception e) {
            log.error(">>> [ ⚠️ Redis 접근 중 오류 발생 ]: {}", e.getMessage());
        }

        // Redis에 데이터가 없거나 오류가 발생한 경우 DB에서 데이터를 조회
        log.info(" >>> [ 🔍 Oracle - 지역구 혜택 수 조회 시도 ]");

        String nickName = member.getNickName();
        String ageRange = member.getAgeRange();
        String gender = member.getGender();

        List<DistrictScoreDTO> listByDistrictPolicyCnt = getDistrictScoreByPolicyNumber(memberId);
        List<DistrictScoreDTO> listByDistrictPolicyScore = getDistrictScoreByPolicyScore(memberId);
        List<ScrapGroupSimilarityDTO> listByDistrictPolicyScrapOfScrapGroup =
                getRecommendationByScrapGroup(ageRange, gender); // 스크랩 점수 추천

        RecommendationInfo dbData = RecommendationInfo.builder()
                .nickName(nickName)
                .listByDistrictPolicyCnt(listByDistrictPolicyCnt)
                .listByDistrictPolicyScore(listByDistrictPolicyScore)
                .listByDistrictPolicyScrapOfScrapGroup(listByDistrictPolicyScrapOfScrapGroup)
                .build();

        try {
            ops.set(redisKeyForMember, dbData, 24, TimeUnit.HOURS);
            log.info(" >>> [ ✨ Redis - Data 등록 완료 ]");
        } catch (Exception e) {
            log.error(" >>> [ ⚠️ Redis 데이터 캐싱 중 오류 발생: {} ]", e.getMessage());
        }

        return dbData;
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
