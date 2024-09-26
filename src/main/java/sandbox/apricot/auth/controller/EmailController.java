package sandbox.apricot.auth.controller;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sandbox.apricot.member.service.EmailService;
import sandbox.apricot.member.vo.Member;

@RestController
@RequiredArgsConstructor
@RequestMapping("/mail")
public class EmailController {

    private final EmailService emailService;

    // 회원가입 이메일 인증 API
    @PostMapping("/signup")
    public ResponseEntity<String> sendEmail(@RequestBody Member member) {
        try {
            String authCode = emailService.generateAuthCode();
            emailService.sendEmail(member, "인증 코드", "귀하의 인증 코드는 " + authCode + "입니다.");
            return ResponseEntity.ok("Email sent successfully");
        } catch (MessagingException e) {
            return ResponseEntity.status(500).body("Failed to send email: " + e.getMessage());
        }
    }

    // 비밀번호 찾기용 이메일 인증 API
    @PostMapping("/reset")
    public ResponseEntity<String> sendResetCode(@RequestBody Member member) {
        try {
            String authCode = emailService.generateAuthCode();
            String subject = "살구 비밀번호 재설정 인증 코드";
            String text = "비밀번호 재설정을 위한 인증 코드를 입력하세요: " + authCode;
            emailService.sendEmail(member, subject, text);
            return ResponseEntity.ok(authCode);
        } catch (MessagingException e) {
            return ResponseEntity.status(500).body("Failed to send email: " + e.getMessage());
        }
    }
}
