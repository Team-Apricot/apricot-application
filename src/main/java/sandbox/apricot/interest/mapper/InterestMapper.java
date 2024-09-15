package sandbox.apricot.interest.mapper;

import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.interest.entity.Interest;

@Mapper
public interface InterestMapper {

    void insertInterest(Interest interest);

}
