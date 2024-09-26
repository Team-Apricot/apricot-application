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

    void updateCareerById(Long memberId, String career);

    void updateMarriedStatusById(Long memberId, String marriedStatus);

    void updateNumChildById(Long memberId, Integer numChild);

    void updateGenderById(Long memberId, String gender);

    void updatePassword(Long memberId, String password);

    void deleteById(Long memberId);

    void newPassword(Long memberId, String newPassword); // memberId로 비밀번호 업데이트

    Optional<Member> findByEmails(String email); // 이메일로 사용자를 찾는 메서드

}
