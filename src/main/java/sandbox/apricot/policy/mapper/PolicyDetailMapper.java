package sandbox.apricot.policy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import sandbox.apricot.policy.dto.PolicyDetailDTO;

@Mapper
public interface PolicyDetailMapper {

  List<PolicyDetailDTO> getPolicyDetails();

  PolicyDetailDTO getPolicyDetailsByPolicyCode(@Param("policyCode")String policyCode);
}
