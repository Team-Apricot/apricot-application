package sandbox.apricot.member.mapper;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.member.entity.Member;

@Mapper
public interface MemberMapper {

    void insertMember(Member member);
    Optional<Member> findByEmail(String email);

}
