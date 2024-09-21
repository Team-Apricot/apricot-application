package sandbox.apricot.policy.service;

import java.util.List;
import sandbox.apricot.policy.dto.response.DistrictPolicy;

public interface PolicyService {

    List<DistrictPolicy> getPolicyCntByDistrict();

}
