package sandbox.apricot.member.controller;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.service.EmailService;
import sandbox.apricot.member.vo.Member;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/member")
public class EmailRestController {

    private final EmailService emailService;

    // 회원가입 이메일 인증 API
    @PostMapping("/signup")
    public ResponseEntity<ApiResponse<String>> sendEmail(@RequestBody Member member) throws MessagingException {
        // 인증 코드 생성
        String authCode = emailService.generateAuthCode();

        // 인증 코드 이메일 발송
        emailService.sendEmail(member, "인증 코드", "귀하의 인증 코드는 " + authCode + "입니다.");

        // 성공 응답 (ApiResponse 객체로 성공 메시지 전송)
        return ResponseEntity.ok(ApiResponse.successResponse(
                org.springframework.http.HttpStatus.OK,
                "이메일 전송 성공",
                "\uD83D\uDDA5\uFE0F 인증코드: " + authCode
        ));
    }

    // 비밀번호 찾기용 이메일 인증 API
    @PostMapping("/password-find")
    public ResponseEntity<ApiResponse<String>> sendResetCode(@RequestBody Member member) throws MessagingException {
        // 인증 코드 생성
        String authCode = emailService.generateAuthCode();

        // 비밀번호 재설정용 이메일 발송
        String subject = "살구 비밀번호 재설정 인증 코드";
        String text = "비밀번호 재설정을 위한 인증 코드를 입력하세요: " + authCode;
        emailService.sendEmail(member, subject, text);

        // 성공 응답
        return ResponseEntity.ok(ApiResponse.successResponse(
                org.springframework.http.HttpStatus.OK,
                "비밀번호 재설정 인증코드 전송 성공",
                authCode
        ));
    }
}
