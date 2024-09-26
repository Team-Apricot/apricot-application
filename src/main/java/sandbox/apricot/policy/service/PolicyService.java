package sandbox.apricot.policy.service;

import java.util.List;
import org.springframework.data.domain.Page;
import sandbox.apricot.policy.dto.response.PolicyDetailDTO;
import sandbox.apricot.policy.dto.request.RegisterReview;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.dto.response.PolicyInfo;

public interface PolicyService {

    PolicyDetailDTO getPolicyDetailsByCode(String policyCode);

    List<DistrictPolicy> getPolicyCntByDistrict();

    District getDistrict(String districtCode);

    DistrictPolicies getDistrictPolicies(String categoryCode, String districtCode, int page);

    void registerReview(RegisterReview request, Long memberId);

    Page<PolicyInfo> findPolicyWithPagination(String searchName, int page, int size);

}