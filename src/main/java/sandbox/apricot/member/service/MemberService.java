package sandbox.apricot.member.service;

import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.dto.request.UpdateAgeRange;
import sandbox.apricot.member.dto.request.UpdateNickName;
import sandbox.apricot.member.dto.request.UpdatePassword;
import sandbox.apricot.member.dto.response.MemberInfo;

public interface MemberService {

    void register(MemberRegisterBasic reqBasic, MemberRegisterDetail reqDetail);

    Long getMemberId(String email);

    MemberInfo getMemberInfo(Long memberId);

    void updateNickName(UpdateNickName request);

    void updateAgeRange(UpdateAgeRange request);

    void updatePassword(UpdatePassword request, Long memberId);

}
