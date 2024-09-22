package sandbox.apricot.policy.service;

import java.util.List;
import java.util.concurrent.TimeUnit;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.mapper.PolicyMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class PolicyServiceImpl implements PolicyService {

    private static final String REDIS_KEY = "districtPolicyCnt";

    private final PolicyMapper policyMapper;
    private final RedisTemplate<String, Object> redisTemplate;


    @Override
    @Transactional(readOnly = true)
    public List<DistrictPolicy> getPolicyCntByDistrict() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        // redis에서 key에 해당하는 value를 찾음.
        List<DistrictPolicy> cachedData = (List<DistrictPolicy>) ops.get(REDIS_KEY);
        if (cachedData != null) {
            return cachedData;
        }

        // Redis에 데이터가 없을 경우, DB에서 데이터를 조회하고 Redis에 저장
        log.info(" >>> [ 🔍 Oracle - 지역구 혜택 수 조회 시도 ]");
        List<DistrictPolicy> dbData = policyMapper.getPolicyCountByDistrict();

        // 데이터를 Redis에 캐싱 (예: 24시간 동안 유지)
        ops.set(REDIS_KEY, dbData, 24, TimeUnit.HOURS);
        log.info(" >>> [ ✨ Redis - Data 등록 완료 ]");

        return dbData;
    }

}
