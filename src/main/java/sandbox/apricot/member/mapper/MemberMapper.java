package sandbox.apricot.member.mapper;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.member.entity.Member;

@Mapper
public interface MemberMapper {

    Optional<Member> findByEmail(String email);
    void insertMember(Member member);

}
