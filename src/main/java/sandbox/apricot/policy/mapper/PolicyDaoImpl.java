package sandbox.apricot.policy.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sandbox.apricot.policy.dto.PolicyDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("policyDaoImpl")
public class PolicyDaoImpl implements PolicyDao {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "sandbox.apricot.policy.mapper.PolicyDao";

    // 전체 정책 조회
    @Override
    public List<PolicyDTO> selectAllPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectAllPolicy", params);
    }

    // 일자리 정책 조회
    @Override
    public List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode, String districtCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        params.put("districtCode", districtCode);
        return sqlSession.selectList(NAMESPACE + ".selectJobsPolicy", params);
    }

    // 주거 정책 조회
    @Override
    public List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectHousingPolicy", params);
    }

    // 교육 정책 조회
    @Override
    public List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectEducationPolicy", params);
    }

    // 복지 정책 조회
    @Override
    public List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectWelfarePolicy", params);
    }

    // 참여권리 정책 조회
    @Override
    public List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("policyCode", policyCode);
        params.put("categoryCode", categoryCode);
        return sqlSession.selectList(NAMESPACE + ".selectParticipationPolicy", params);
    }
}
