package sandbox.apricot.policy.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import sandbox.apricot.policy.dao.PolicyDao;
import sandbox.apricot.policy.dto.PolicyDTO;
import sandbox.apricot.policy.service.PolicyService;

@Service("policyServiceImpl")
public class PolicyServiceImpl implements PolicyService {

    //Field
    @Autowired
    @Qualifier("policyDaoImpl")
    private PolicyDao policyDao;
    public void setPolicyDao(PolicyDao policyDao){
        this.policyDao = policyDao;
    }

    //Constructor
    public PolicyServiceImpl() {
        System.out.println(this.getClass());
    }

    @Override
    public List<PolicyDTO> selectAllPolicy(String policyCode) throws Exception {
        return policyDao.selectAllPolicy(policyCode);
    }

    @Override
    public List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectJobsPolicy(policyCode, categoryCode);
    }

    @Override
    public List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectHousingPolicy(policyCode, categoryCode);
    }

    @Override
    public List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectEducationPolicy(policyCode, categoryCode);
    }

    @Override
    public List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectWelfarePolicy(policyCode, categoryCode);
    }

    @Override
    public List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception {
        return policyDao.selectParticipationPolicy(policyCode, categoryCode);
    }
}