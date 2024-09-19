package sandbox.apricot.policy.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sandbox.apricot.policy.dao.PolicyDao;
import sandbox.apricot.policy.dto.PolicyDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("policyDaoImpl")
public class PolicyDaoImpl implements PolicyDao {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "sandbox.apricot.policy.dao.PolicyDao";

    @Override
    public List<PolicyDTO> selectAllPolicy(String policyCode) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectAllPolicy", policyCode);
    }

    @Override
    public List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectJobsPolicy", params);
    }

    @Override
    public List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectHousingPolicy", params);
    }

    @Override
    public List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectEducationPolicy", params);
    }

    @Override
    public List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectWelfarePolicy", params);
    }

    @Override
    public List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectParticipationPolicy", params);
    }
}
