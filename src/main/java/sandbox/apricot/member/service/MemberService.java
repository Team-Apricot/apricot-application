package sandbox.apricot.member.service;

import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;

public interface MemberService {

    void register(MemberRegisterBasic basicInfo, MemberRegisterDetail detailInfo);
    Long getMemberId(String email);

}
