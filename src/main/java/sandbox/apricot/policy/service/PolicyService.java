package sandbox.apricot.policy.service;

import java.util.List;
import sandbox.apricot.policy.dto.request.PolicyPagination;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.DistrictPolicy;

public interface PolicyService {

//    //전체
//    List<PolicyDTO> selectAllPolicy(String policyCode, String categoryCode) throws Exception;
//    //일자리
//    List<PolicyDTO> selectJobsPolicy(String policyCode, String categoryCode, String districtCode) throws Exception;
//    //주거
//    List<PolicyDTO> selectHousingPolicy(String policyCode, String categoryCode) throws Exception;
//    //교육
//    List<PolicyDTO> selectEducationPolicy(String policyCode, String categoryCode) throws Exception;
//    //복지
//    List<PolicyDTO> selectWelfarePolicy(String policyCode, String categoryCode) throws Exception;
//    //참여권리
//    List<PolicyDTO> selectParticipationPolicy(String policyCode, String categoryCode) throws Exception;

    List<DistrictPolicy> getPolicyCntByDistrict();

    DistrictPolicies getAllDistrictPolicies(PolicyPagination request);

    District getDistrict(String districtCode);

}