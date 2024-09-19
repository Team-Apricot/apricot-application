package sandbox.apricot.policy.service;

import sandbox.apricot.policy.dto.PolicyDTO;
import java.util.List;

public interface PolicyService {

    //전체
    List<PolicyDTO> selectAllPolicy(String policyCode) throws Exception;
    //일자리
    List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode) throws Exception;
    //주거
    List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception;
    //교육
    List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception;
    //복지
    List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception;
    //참여권리
    List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception;
}