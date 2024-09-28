package sandbox.apricot.member.service;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import sandbox.apricot.member.mapper.MemberMapper;
import sandbox.apricot.member.util.exception.MemberBusinessException;
import sandbox.apricot.member.util.exception.MemberErrorCode;
import sandbox.apricot.member.vo.Member;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final MemberMapper memberMapper;
    private final BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화를 위한 BCryptPasswordEncoder

    // 회원 등록 메서드 구현
    @Override
    public void registerUser(Member memberLogin, String authCode, String userEnteredCode) {
        // 인증 코드가 일치하는지 확인
        if (authCode.equals(userEnteredCode)) {
            memberMapper.save(memberLogin);  // 회원 저장
        } else {
            // 인증코드 불일치 시 예외 발생
            throw new MemberBusinessException(MemberErrorCode.AUTHENTICATION_CODE_DOES_NOT_MATCH);
        }
    }

    // 비밀번호 갱신 메서드 구현
    @Override
    public void updatePassword(Member member, String password) {
        // 이메일을 통해 사용자를 검색
        Optional<Member> optionalMember = memberMapper.findByEmail(member.getEmail());

        if (optionalMember.isPresent()) {
            Member foundMember = optionalMember.get();
            // 비밀번호 암호화
            String encodedPassword = passwordEncoder.encode(password);
            // 암호화된 비밀번호로 업데이트
            memberMapper.updatePassword(foundMember.getMemberId(), encodedPassword);
        } else {
            // 사용자가 존재하지 않으면 예외 발생
            throw new MemberBusinessException(MemberErrorCode.MEMBER_NOT_FOUND);
        }
    }
}
