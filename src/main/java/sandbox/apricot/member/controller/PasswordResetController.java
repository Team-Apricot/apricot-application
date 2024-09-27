package sandbox.apricot.member.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.member.service.UserService;
import sandbox.apricot.member.vo.Member;
import sandbox.apricot.member.util.exception.MemberBusinessException;
import sandbox.apricot.member.util.exception.MemberErrorCode;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/member")
public class PasswordResetController {

    private final UserService userService;

    // 비밀번호 재설정 API
    @PostMapping("/password-reset")
    public String resetPassword(@RequestBody Member member, @RequestParam String authCode, @RequestParam String userEnteredCode) {
        // 인증 코드가 일치하는지 확인
        if (authCode.equals(userEnteredCode)) {
            // 비밀번호 갱신 호출
            userService.updatePassword(member, member.getPassword());
            return "비밀번호가 성공적으로 변경되었습니다.";
        } else {
            // 인증 코드 불일치 시 예외 발생
            throw new MemberBusinessException(MemberErrorCode.AUTHENTICATION_CODE_DOES_NOT_MATCH);
        }
    }
}
