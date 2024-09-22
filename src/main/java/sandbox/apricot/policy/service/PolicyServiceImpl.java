package sandbox.apricot.policy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sandbox.apricot.policy.mapper.PolicyDao;
import sandbox.apricot.policy.dto.PolicyDTO;

import java.util.List;

@Service("policyServiceImpl")
public class PolicyServiceImpl implements PolicyService {

    @Autowired
    private PolicyDao policyDao;

    // 전체 정책 조회
    @Override
    public List<PolicyDTO> selectAllPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectAllPolicy(policyCode, categoryCode);
    }

    // 일자리 정책 조회
    @Override
    public List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode, String districtCode) throws Exception {
        return policyDao.selectJobsPolicy(policyCode, categoryCode, districtCode);
    }

    // 주거 정책 조회
    @Override
    public List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectHousingPolicy(policyCode, categoryCode);
    }

    // 교육 정책 조회
    @Override
    public List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectEducationPolicy(policyCode, categoryCode);
    }

    // 복지 정책 조회
    @Override
    public List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectWelfarePolicy(policyCode, categoryCode);
    }

    // 참여권리 정책 조회
    @Override
    public List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectParticipationPolicy(policyCode, categoryCode);
    }
}
