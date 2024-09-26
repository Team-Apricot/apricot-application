package sandbox.apricot.member.service;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import sandbox.apricot.member.mapper.MemberMapper;
import sandbox.apricot.member.vo.Member;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final MemberMapper memberMapper;
    private final BCryptPasswordEncoder passwordEncoder; // BCryptPasswordEncoder 인스턴스 추가

    // 회원 등록 메서드 구현
    @Override
    public void registerUser(Member memberLogin, String authCode, String userEnteredCode) {
        // 입력한 코드와 이메일로 발송한 인증코드가 일치하는지 확인
        if (authCode.equals(userEnteredCode)) {
            memberMapper.save(memberLogin);  // 회원가입 진행
        } else {
            throw new IllegalArgumentException("인증 코드가 일치하지 않습니다.");
        }
    }

    // 비밀번호 갱신 메서드 구현
    @Override
    public void updatePassword(String email, String newPassword) {
        // 이메일을 통해 사용자를 검색
        Optional<Member> optionalMember = memberMapper.findByEmails(email);

        // 사용자 존재 여부 확인
        if (optionalMember.isPresent()) {
            Member member = optionalMember.get();

            // 새 비밀번호 암호화
            String encodedPassword = passwordEncoder.encode(newPassword); // 비밀번호 암호화

            // member의 ID를 사용하여 새 비밀번호로 업데이트
            memberMapper.newPassword(member.getMemberId(), encodedPassword); // 암호화된 비밀번호 저장
        } else {
            // 사용자가 존재하지 않으면 예외를 발생시킴
            throw new IllegalArgumentException("해당 이메일을 가진 사용자가 존재하지 않습니다.");
        }
    }
}
