package sandbox.apricot.policy.service;

import java.util.List;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.DistrictPolicy;

public interface PolicyService {

    List<DistrictPolicy> getPolicyCntByDistrict();

    District getDistrict(String districtCode);

    DistrictPolicies getDistrictPolicies(String categoryCode, String districtCode, int page);

}