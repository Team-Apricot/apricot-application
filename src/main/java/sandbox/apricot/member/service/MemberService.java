package sandbox.apricot.member.service;

import sandbox.apricot.member.dto.request.MemberRegister;
import sandbox.apricot.member.dto.response.MemberInfo;

public interface MemberService {

    MemberInfo getMemberInfo(String email);
    void insertMember(MemberRegister request);

}
