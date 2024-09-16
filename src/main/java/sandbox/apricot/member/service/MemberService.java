package sandbox.apricot.member.service;

import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.dto.response.MemberInfo;

public interface MemberService {

    void register(MemberRegisterBasic reqBasic, MemberRegisterDetail reqDetail);
    Long getMemberId(String email);
    MemberInfo getMemberInfo(Long memberId);

}
