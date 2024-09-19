package sandbox.apricot.member.mapper;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.vo.Member;

@Mapper
public interface MemberMapper {

    void save(Member member);
    Optional<Member> findById(Long memberId);
    Optional<Member> findByEmail(String email);
    Optional<Member> findByNickName(String nickName);
    MemberInfo findByIdWithInterests(Long memberId);
    void updateNickNameById(Long memberId, String nickName);
    void updateAgeRangeById(Long memberId, String ageRange);

}
