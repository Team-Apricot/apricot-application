package sandbox.apricot.policy.service;

import org.springframework.data.domain.Pageable;
import sandbox.apricot.policy.dto.request.PolicyPagination;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.PolicyTLDR;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.mapper.PolicyMapper;

import java.util.List;
import java.util.concurrent.TimeUnit;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.stereotype.Service;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.transaction.annotation.Transactional;


@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class PolicyServiceImpl implements PolicyService {

    private static final String REDIS_KEY = "districtPolicyCnt";

    private final PolicyMapper policyMapper;
    private final RedisTemplate<String, Object> redisTemplate;

    // 일자리 정책 조회
    @Override
    @Transactional(readOnly = true)
    public List<DistrictPolicy> getPolicyCntByDistrict() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        List<DistrictPolicy> cachedData = null;

        try {
            cachedData = (List<DistrictPolicy>) ops.get(REDIS_KEY);
            if (cachedData != null) {
                return cachedData;
            }
        } catch (Exception e) {
            log.error(">>> [ ⚠️ Redis 접근 중 오류 발생 ]: {}", e.getMessage());
        }

        // Redis에 데이터가 없거나 오류가 발생한 경우 DB에서 데이터를 조회
        log.info(" >>> [ 🔍 Oracle - 지역구 혜택 수 조회 시도 ]");
        List<DistrictPolicy> dbData = policyMapper.getPolicyCountByDistrict();

        try {
            ops.set(REDIS_KEY, dbData, 24, TimeUnit.HOURS);
            log.info(" >>> [ ✨ Redis - Data 등록 완료 ]");
        } catch (Exception e) {
            log.error(" >>> [ ⚠️ Redis 데이터 캐싱 중 오류 발생: {} ]", e.getMessage());
        }

        return dbData;
    }

    @Override
    public DistrictPolicies getAllDistrictPolicies(PolicyPagination request) {
        Pageable pageable = request.toPageable();
        List<PolicyTLDR> policies = getPolicies(
                request.getCursorId(),
                pageable,
                request.getDistrictCode(),
                request.getCategoryCode()
        );
        Long nextCursorId = getNextCursorId(policies);
        Boolean hasNext = policies.size() >= pageable.getPageSize();
        return DistrictPolicies.of(policies, nextCursorId, hasNext);
    }

    @Override
    public District getDistrict(String districtCode) {
        return policyMapper.findByDistrictCode(districtCode);
    }

    private List<PolicyTLDR> getPolicies(Long cursorId, Pageable pageable, String districtCode, String categoryCode) {
        log.info(" >>> [ 🔍 {}번 지역구 혜택 조회 시도 ]", districtCode);
        return cursorId == null ?
                policyMapper.findAllDistrictPolicyTLDRByCategory(districtCode, categoryCode, pageable) :
                policyMapper.findPartOfDistrictPolicyTLDRByCursorId(cursorId, districtCode, categoryCode, pageable);
    }

    private Long getNextCursorId(List<PolicyTLDR> policies) {
        return policies.isEmpty() ? null : policies.get(policies.size() - 1).getCursorId();
    }

//    // 전체 정책 조회
//    @Override
//    public List<PolicyDTO> selectAllPolicy(String policyCode, String categoryCode)
//            throws Exception {
//        return policyDao.selectAllPolicy(policyCode, categoryCode);
//    }
//
//
//    public List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode,
//            String districtCode) throws Exception {
//        return policyDao.selectJobsPolicy(policyCode, categoryCode, districtCode);
//    }
//
//    // 주거 정책 조회
//    @Override
//    public List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode)
//            throws Exception {
//        return policyDao.selectHousingPolicy(policyCode, categoryCode);
//    }
//
//    // 교육 정책 조회
//    @Override
//    public List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode)
//            throws Exception {
//        return policyDao.selectEducationPolicy(policyCode, categoryCode);
//    }
//
//    // 복지 정책 조회
//    @Override
//    public List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode)
//            throws Exception {
//        return policyDao.selectWelfarePolicy(policyCode, categoryCode);
//    }
//
//    // 참여권리 정책 조회
//    @Override
//    public List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode)
//            throws Exception {
//        return policyDao.selectParticipationPolicy(policyCode, categoryCode);
//    }

}
