package sandbox.apricot.interest.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.interest.vo.Interest;

@Mapper
public interface InterestMapper {

    void save(Interest interest);

    List<Interest> findByMemberId(Long memberId);

    void deleteByMemberId(Long memberId);

}
