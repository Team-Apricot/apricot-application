package sandbox.apricot.policy.service;

import java.util.List;
import sandbox.apricot.policy.dto.request.RegisterReview;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.dto.response.PolicyInfo;

public interface PolicyService {

    List<DistrictPolicy> getPolicyCntByDistrict();

    District getDistrict(String districtCode);

    DistrictPolicies getDistrictPolicies(String categoryCode, String districtCode, int page);

    List<PolicyInfo> findPolicy(String searchName);

    void registerReview(RegisterReview request, Long memberId);

}