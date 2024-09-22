package sandbox.apricot.policy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.policy.dto.response.DistrictPolicy;

@Mapper
public interface PolicyMapper {

    List<DistrictPolicy> getPolicyCountByDistrict();

}
