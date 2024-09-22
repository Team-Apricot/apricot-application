package sandbox.apricot.member.service;

import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.dto.request.UpdateAgeRange;
import sandbox.apricot.member.dto.request.UpdateCareer;
import sandbox.apricot.member.dto.request.UpdateGender;
import sandbox.apricot.member.dto.request.UpdateMarriedStatus;
import sandbox.apricot.member.dto.request.UpdateNickName;
import sandbox.apricot.member.dto.request.UpdateNumChild;
import sandbox.apricot.member.dto.request.UpdatePassword;
import sandbox.apricot.member.dto.response.MemberInfo;

public interface MemberService {

    void register(MemberRegisterBasic reqBasic, MemberRegisterDetail reqDetail);

    Long getMemberId(String email);

    MemberInfo getMemberInfo(Long memberId);

    void updatePassword(UpdatePassword request, Long memberId);

    void updateNickName(UpdateNickName request);

    void updateAgeRange(UpdateAgeRange request);

    void updateCareer(UpdateCareer request);

    void updateMarriedStatus(UpdateMarriedStatus request);

    void updateNumChild(UpdateNumChild request);

    void updateGender(UpdateGender request);

    void delete(Long memberId);

}
