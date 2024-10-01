package sandbox.apricot.common.aop;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Component;
import sandbox.apricot.recommendation.dto.response.RecommendationInfo;

@Log4j2
@Aspect
@Component
@RequiredArgsConstructor
public class CacheLogging {

    private final CacheManager cacheManager;

    // 메서드 실행 전에 캐시 확인
    @Before("execution(* sandbox.apricot.policy.service.PolicyServiceImpl.getPolicyCntByDistrict(..))")
    public void logCacheBeforeMethod() {
        var cache = cacheManager.getCache("policyCntByDistrict");
        if (cache != null && cache.getNativeCache() != null) {
            log.info(">>> [ 🔍 Redis - 지역구 혜택 수 조회 시도 ]");
        } else {
            log.info(">>> [ ⚠️ 캐시가 비어있어 DB 조회로 전환합니다. ]");
        }
    }

    // 메서드 실행 후 캐시 사용 확인
    @AfterReturning(pointcut = "execution(* sandbox.apricot.policy.service.PolicyServiceImpl.getPolicyCntByDistrict(..))", returning = "result")
    public void logCacheAfterReturning(Object result) {
        if (result instanceof List && !((List<?>) result).isEmpty()) {
            log.info(">>> [ 🖥️ 데이터 반환 성공, 반환된 데이터 크기: {} ]", ((List<?>) result).size());
        } else {
            log.info(">>> [ ⚠️ 반환된 데이터가 비어 있습니다. ]");
        }
    }

    // 추천 정보 조회 전에 Redis 캐시 확인
    @Before("execution(* sandbox.apricot.recommendation.service.RecommendationServiceImpl.getRecommendationInfo(..))")
    public void logCacheBeforeRecommendation() {
        var cache = cacheManager.getCache("recommendInfo");
        if (cache != null && cache.getNativeCache() != null) {
            log.info(">>> [ 🔍 Redis - 추천 정보 조회 시도 ]");
        } else {
            log.info(">>> [ ⚠️ 캐시가 비어있어 RDB 조회로 전환합니다. ]");
        }
    }

    // 추천 정보 조회 후 캐시 사용 확인
    @AfterReturning(pointcut = "execution(* sandbox.apricot.recommendation.service.RecommendationServiceImpl.getRecommendationInfo(..))", returning = "result")
    public void logCacheAfterReturningRecommendation(Object result) {
        if (result instanceof RecommendationInfo) {
            log.info(">>> [ 🖥️ 추천 정보 반환 성공 ]");
        } else {
            log.info(">>> [ ⚠️ 반환된 추천 정보가 비어 있습니다. ]");
        }
    }

    // 관심사 등록 전에 Redis 캐시 확인
    @Before("execution(* sandbox.apricot.interest.service.InterestServiceImpl.register(..))")
    public void logRedisBeforeRegister() {
        log.info(">>> [ 🔍 Redis - 관심사 등록 시도 전 캐시 확인 중 ]");
    }

    // 관심사 등록 후 Redis 캐시 확인
    @AfterReturning("execution(* sandbox.apricot.interest.service.InterestServiceImpl.register(..))")
    public void logRedisAfterRegister() {
        log.info(">>> [ 🖥️ Redis - 관심사 등록 후 캐시 확인 완료 ]");
    }

}
