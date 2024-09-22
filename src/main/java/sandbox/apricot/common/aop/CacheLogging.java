package sandbox.apricot.common.aop;

import java.util.Objects;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Component;

@Log4j2
@Aspect
@Component
@RequiredArgsConstructor
public class CacheLogging {

    private final CacheManager cacheManager;

    // 메서드 실행 전에 캐시 확인
    @Before("execution(* sandbox.apricot.policy.service.PolicyServiceImpl.getPolicyCntByDistrict(..))")
    public void logCacheBeforeMethod() {
        // 캐시가 비어 있는지 확인
        if (cacheManager.getCache("policyCntByDistrict") != null) {
            Objects.requireNonNull(cacheManager.getCache("policyCntByDistrict")).getNativeCache();
            log.info(">>> [ 🔍 Redis - 지역구 혜택 수 조회 시도 ]");
        }
    }

    // 메서드 실행 후 캐시 사용 확인
    @AfterReturning(pointcut = "execution(* sandbox.apricot.policy.service.PolicyServiceImpl.getPolicyCntByDistrict(..))", returning = "result")
    public void logCacheAfterReturning(Object result) {
        log.info(">>> [ 🖥️ Redis - 데이터 반환 성공 ]");
    }

}

