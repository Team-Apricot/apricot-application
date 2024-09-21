package sandbox.apricot.member.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.EMAIL_DUPLICATE;
import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;
import static sandbox.apricot.member.util.exception.MemberErrorCode.NICKNAME_DUPLICATE;
import static sandbox.apricot.member.util.exception.MemberErrorCode.UNAUTHORIZED_TO_MEMBER;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.interest.dto.request.InterestRegister;
import sandbox.apricot.interest.service.InterestService;
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
import sandbox.apricot.member.vo.Member;
import sandbox.apricot.member.vo.MemberRole;
import sandbox.apricot.member.util.exception.MemberBusinessException;
import sandbox.apricot.member.mapper.MemberMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final InterestService interestService;
    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void register(MemberRegisterBasic reqBasic, MemberRegisterDetail reqDetail) {
        log.info(" >>> [ ✨ 회원 가입을 시도 합니다. ]");
        validateDuplicationEmail(reqBasic.getEmail());
        validateDuplicationNickName(reqBasic.getNickName());
        memberMapper.save(toVO(reqBasic, reqDetail));
        Long memberId = getMemberId(reqBasic.getEmail());
        interestService.register(InterestRegister.of(memberId, reqDetail.getInterests()));
        log.info(" >>> [ ✨ 회원 가입 성공 ]");
    }

    @Override
    @Transactional(readOnly = true)
    public Long getMemberId(String email) {
        Member member = memberMapper.findByEmail(email)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        return member.getMemberId();
    }

    @Override
    @Transactional(readOnly = true)
    public MemberInfo getMemberInfo(Long memberId) {
        return memberMapper.findByIdWithInterests(memberId);
    }

    @Override
    public void updatePassword(UpdatePassword request, Long memberId) {
        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));

        String oldPassword = request.getOldPassword();
        String newPassword = request.getNewPassword();
        String curPassword = member.getPassword();

        validateForbidden(oldPassword, curPassword);
        memberMapper.updatePassword(memberId, passwordEncoder.encode(newPassword));
    }

    @Override
    public void updateNickName(UpdateNickName request) {
        Long memberId = request.getMemberId();
        String newNickName = request.getNickName();

        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));

        validateDuplicationNickName(request.getNickName());
        validateForbidden(memberId, member);
        memberMapper.updateNickNameById(memberId, newNickName);
    }

    @Override
    public void updateAgeRange(UpdateAgeRange request) {
        Long memberId = request.getMemberId();
        String newAgeRange = request.getAgeRange();

        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        validateForbidden(memberId, member);
        memberMapper.updateAgeRangeById(memberId, newAgeRange);
    }

    @Override
    public void updateCareer(UpdateCareer request) {
        Long memberId = request.getMemberId();
        String newCareer = request.getCareer();

        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        validateForbidden(memberId, member);
        memberMapper.updateCareerById(memberId, newCareer);
    }

    @Override
    public void updateMarriedStatus(UpdateMarriedStatus request) {
        Long memberId = request.getMemberId();
        String marriedStatus = request.getMarriedStatus();

        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        validateForbidden(memberId, member);
        memberMapper.updateMarriedStatusById(memberId, marriedStatus);
    }

    @Override
    public void updateNumChild(UpdateNumChild request) {
        Long memberId = request.getMemberId();
        Integer numChild = request.getNumChild();
        System.out.println(memberId + " " + numChild);
        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        validateForbidden(memberId, member);
        memberMapper.updateNumChildById(memberId, numChild);

    }

    @Override
    public void updateGender(UpdateGender request) {
        Long memberId = request.getMemberId();
        String gender = request.getGender();
        Member member = memberMapper.findById(memberId)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        validateForbidden(memberId, member);
        memberMapper.updateGenderById(memberId, gender);
    }

    @Override
    public void delete(Long memberId) {
        log.info(" >>> [ ✨ 회원 삭제를 시도합니다. 회원 ID: {} ]", memberId);
        memberMapper.deleteById(memberId);
        log.info(" >>> [ ✨ 회원 삭제 성공. 회원 ID: {} ]", memberId);
    }

    private void validateDuplicationEmail(String email) {
        if (memberMapper.findByEmail(email).isPresent()) {
            throw new MemberBusinessException(EMAIL_DUPLICATE);
        }
    }

    private void validateDuplicationNickName(String nickName) {
        if (memberMapper.findByNickName(nickName).isPresent()) {
            throw new MemberBusinessException(NICKNAME_DUPLICATE);
        }
    }

    private void validateForbidden(Long target, Member member) {
        if (!member.getMemberId().equals(target)) {
            throw new MemberBusinessException(UNAUTHORIZED_TO_MEMBER);
        }
    }

    private void validateForbidden(String oldPassword, String newPassword) {
        if (!passwordEncoder.matches(oldPassword, newPassword)) {
            throw new MemberBusinessException(UNAUTHORIZED_TO_MEMBER);
        }
    }

    private Member toVO(MemberRegisterBasic reqBasic, MemberRegisterDetail reqDetail) {
        return Member.builder()
                .email(reqBasic.getEmail())
                .nickName(reqBasic.getNickName())
                .password(passwordEncoder.encode(reqBasic.getPassword()))
                .ageRange(reqDetail.getAgeRange())
                .gender(reqDetail.getGender())
                .career(reqDetail.getCareer())
                .marriedStatus(reqDetail.getMarriedStatus())
                .numChild(Integer.parseInt(reqDetail.getNumChild()))
                .memberRole(MemberRole.USER_ROLE)
                .build();
    }

}
