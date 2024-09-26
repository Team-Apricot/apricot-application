package sandbox.apricot.auth.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.member.service.UserService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/password")
public class PasswordResetController {

    private final UserService userService;

    // 비밀번호 재설정 API
    @PostMapping("/reset")
    public String resetPassword(@RequestParam String email, @RequestParam String authCode, @RequestParam String userEnteredCode, @RequestParam String newPassword) {
        if (authCode.equals(userEnteredCode)) {
            userService.updatePassword(email, newPassword);  // 비밀번호 찾기 → 이메일 인증 → 비밀번호 초기화 → 비밀번호 갱신
            return "비밀번호가 성공적으로 변경되었습니다.";
        } else {
            throw new IllegalArgumentException("인증 코드가 일치하지 않습니다.");
        }
    }
}
