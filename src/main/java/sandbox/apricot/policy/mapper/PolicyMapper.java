package sandbox.apricot.policy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.dto.response.PolicyTLDR;
import sandbox.apricot.policy.dto.response.PolicyInfo;

@Mapper
public interface PolicyMapper {

    List<DistrictPolicy> getPolicyCountByDistrict();

    District findByDistrictCode(@Param("districtCode") String districtCode);

    int countPoliciesByDistrict(@Param("districtCode") String districtCode);

    List<PolicyTLDR> findAllDistrictPolicyTLDRByCategory(
            @Param("districtCode") String districtCode,
            @Param("categoryCode") String categoryCode,
            Pageable pageable
    );

    List<PolicyInfo> findPolicy(String searchName);

}
