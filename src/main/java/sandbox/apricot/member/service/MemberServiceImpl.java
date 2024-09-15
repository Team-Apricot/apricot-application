package sandbox.apricot.member.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.EMAIL_DUPLICATE;
import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;
import static sandbox.apricot.member.util.exception.MemberErrorCode.NICKNAME_DUPLICATE;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.entity.Member;
import sandbox.apricot.member.entity.MemberRole;
import sandbox.apricot.member.util.exception.MemberBusinessException;
import sandbox.apricot.member.mapper.MemberMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void register(MemberRegisterBasic basicInfo, MemberRegisterDetail detailInfo) {
        log.info(" >>> [ ✨ 회원 가입을 시도 합니다. ]");

        // 중복 이메일 확인
        if (memberMapper.findByEmail(basicInfo.getEmail()).isPresent()) {
            throw new MemberBusinessException(EMAIL_DUPLICATE);
        }

        // 중복 닉네임 확인
        if (memberMapper.findByNickName(basicInfo.getNickName()).isPresent()) {
            throw new MemberBusinessException(NICKNAME_DUPLICATE);
        }

        // 회원 객체 생성
        Member member = Member.builder()
                .email(basicInfo.getEmail())
                .nickName(basicInfo.getNickName())
                .password(passwordEncoder.encode(basicInfo.getPassword()))
                .ageRange(detailInfo.getAgeRange())
                .gender(detailInfo.getGender())
                .career(detailInfo.getCareer())
                .marriedStatus(detailInfo.getMarriedStatus())
                .numChild(Integer.parseInt(detailInfo.getNumChild()))
                .memberRole(MemberRole.USER_ROLE)
                .build();
        memberMapper.insertMember(member);
        log.info(" >>> [ ✨ 회원 가입 성공 ]");
    }

    @Override
    @Transactional(readOnly = true)
    public Long getMemberId(String email) {
        Member member = memberMapper.findByEmail(email)
                .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND));
        return member.getMemberId();
    }

}
