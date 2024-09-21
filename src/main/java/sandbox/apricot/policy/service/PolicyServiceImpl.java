package sandbox.apricot.policy.service;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.mapper.PolicyMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class PolicyServiceImpl implements PolicyService {

    private final PolicyMapper policyMapper;

    @Override
    @Transactional(readOnly = true)
    public List<DistrictPolicy> getPolicyCntByDistrict() {
        log.info(" >>> [ ✨ 지역구 혜택 수를 조회 합니다. ]");
        return policyMapper.getPolicyCountByDistrict();
    }

}
