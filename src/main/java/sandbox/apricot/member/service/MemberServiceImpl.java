package sandbox.apricot.member.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.EMAIL_DUPLICATE;
import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;
import static sandbox.apricot.member.util.exception.MemberErrorCode.NICKNAME_DUPLICATE;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.interest.dto.request.InterestRegister;
import sandbox.apricot.interest.service.InterestService;
import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
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
        validateDuplication(reqBasic.getEmail(), reqBasic.getNickName());
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
    public MemberInfo getMemberInfo(Long memberId) {
        return memberMapper.findByIdWithInterests(memberId);
    }

    private void validateDuplication(String email, String nickName) {
        if (memberMapper.findByEmail(email).isPresent()) {
            throw new MemberBusinessException(EMAIL_DUPLICATE);
        }

        if (memberMapper.findByNickName(nickName).isPresent()) {
            throw new MemberBusinessException(NICKNAME_DUPLICATE);
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
