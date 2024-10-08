package sandbox.apricot.policy.service;

import static sandbox.apricot.policy.util.PolicyFormatter.formatPolicyDetail;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import sandbox.apricot.policy.dto.response.PolicyDetailDTO;
import sandbox.apricot.policy.dto.request.RegisterReview;
import sandbox.apricot.policy.dto.response.PolicyInfo;
import org.springframework.data.domain.PageRequest;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.PolicyTLDR;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.mapper.PolicyDetailMapper;
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
    private final PolicyDetailMapper detailMapper;
    private final RedisTemplate<String, Object> redisTemplate;

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
        log.info(">>> [ 🔍 Oracle - 지역구 혜택 수 조회 시도 ]");
        List<DistrictPolicy> dbData = policyMapper.getPolicyCountByDistrict();

        try {
            ops.set(REDIS_KEY, dbData, 24, TimeUnit.HOURS);
            log.info(">>> [ ✨ Redis - Data 등록 완료 ]");
        } catch (Exception e) {
            log.error(">>> [ ⚠️ Redis 데이터 캐싱 중 오류 발생: {} ]", e.getMessage());
        }

        return dbData;
    }

    @Override
    public District getDistrict(String districtCode) {
        return policyMapper.findByDistrictCode(districtCode);
    }

    @Override
    public DistrictPolicies getDistrictPolicies(String districtCode, String categoryCode, int page) {
        List<PolicyTLDR> policies = policyMapper.findAllDistrictPolicyTLDRByCategory(
                districtCode,
                categoryCode,
                PageRequest.of(page - 1, 6)
        );
        int totalPoliciesCnt = policyMapper.countPoliciesByDistrict(districtCode);
        int totalPages = (int) Math.ceil((double) totalPoliciesCnt / 6);

        return DistrictPolicies.builder()
                .categoryCode(categoryCode == null ? "ALL" : categoryCode)
                .policies(policies)
                .totalPages(totalPages)
                .build();
    }

    @Override
    public PolicyDetailDTO getPolicyDetailsByCode(String policyCode) {
        PolicyDetailDTO policyDetailDTO = detailMapper.getPolicyDetailsByPolicyCode(policyCode);
        return formatPolicyDetail(policyDetailDTO);
    }

    @Override
    public void registerReview(RegisterReview request, Long memberId) {
        policyMapper.saveReview(
                request.getPolicyCode(),
                memberId,
                request.getPolicyScore()
        );
    }

    @Override
    public Page<PolicyInfo> findPolicyWithPagination(String searchName, int page, int size) {
        int offset = (page - 1) * size; // 오프셋 계산
        int limit = page * size; // LIMIT 값으로 사용할 총 행 수
        List<PolicyInfo> policies = policyMapper.findPolicyWithPagination(searchName, offset, limit);
        int totalPolicies = policyMapper.countPolicies(searchName);

        Pageable pageable = PageRequest.of(page - 1, size);
        return new PageImpl<>(policies, pageable, totalPolicies);
    }

}
