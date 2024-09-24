package sandbox.apricot.policy.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import sandbox.apricot.policy.dto.PolicyDetailDTO;

@Mapper
public interface PolicyDetailMapper {

    PolicyDetailDTO getPolicyDetailsByPolicyCode(@Param("policyCode") String policyCode);

}
