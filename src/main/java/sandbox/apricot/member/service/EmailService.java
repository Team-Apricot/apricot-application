package sandbox.apricot.member.service;

import jakarta.mail.MessagingException;
import sandbox.apricot.member.vo.Member;

public interface EmailService {

    // 인증코드 생성 메서드
    String generateAuthCode();

    // 이메일 발송 메서드
    void sendEmail(Member member, String subject, String text) throws MessagingException;
}
