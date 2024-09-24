package sandbox.apricot.policy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.dto.response.PolicyInfo;

@Mapper
public interface PolicyMapper {

    List<DistrictPolicy> getPolicyCountByDistrict();

    List<PolicyInfo> findPolicy(String searchName);

}
