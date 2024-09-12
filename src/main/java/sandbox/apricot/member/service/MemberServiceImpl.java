package sandbox.apricot.member.service;

import static sandbox.apricot.member.exception.MemberErrorCode.MEMBER_NOT_FOUND;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.member.dto.request.MemberRegister;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.entity.Member;
import sandbox.apricot.member.entity.MemberRole;
import sandbox.apricot.member.exception.MemberBusinessException;
import sandbox.apricot.member.mapper.MemberMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    @Transactional(readOnly = true)
    public MemberInfo getMemberInfo(String email) {
        log.info(" >>> [ 🔍 {} 회원을 조회 합니다. ]", email);
        return MemberInfo.from(memberMapper.findByEmail(email)
                        .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND)));
    }

    @Override
    public void insertMember(MemberRegister request) {
        log.info(" >>> [ ✨ 회원 가입을 시도 합니다. ]");
        Member member = Member.builder()
                .email(request.getEmail())
                .nickName(request.getNickName())
                .password(passwordEncoder.encode(request.getPassword()))
//                .ageRange(request.getAgeRange())
//                .gender(request.getGender())
//                .career(request.getCareer())
//                .marriedStatus(request.getMarriedStatus())
//                .numChild(request.getNumChild())
                .memberRole(MemberRole.USER_ROLE)
                .build();
        log.info(" >>> [ ✨ Member: {} ]", member.toString());
        memberMapper.insertMember(member);
    }
}
