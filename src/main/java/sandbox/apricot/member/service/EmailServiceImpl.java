package sandbox.apricot.member.service;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import sandbox.apricot.member.vo.Member;

@Log4j2
@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    @Value("${spring.mail.username}")  // 이메일 발신자의 주소
    private String from;

    @Value("${spring.mail.password}") // 이메일 발신자의 비밀번호
    private String password;

    // 인증코드 생성 메서드: 6자리 숫자 랜덤 생성
    @Override
    public String generateAuthCode() {
        Random random = new Random();
        int authCode = random.nextInt(999999); // 6자리 인증 코드 생성
        log.info(">>> [ 🔐 인증 코드 생성: {} ]", authCode);  // 생성된 인증 코드 로그 출력
        return String.format("%06d", authCode);
    }

    // 이메일 발송 메서드: 수신자, 제목, 본문을 받아서 이메일 발송
    @Override
    public void sendEmail(Member email, String subject, String text) throws MessagingException {
        String to = email.getEmail();  // 수신자의 이메일 주소 가져오기

        // 이메일 발송 정보 로그 출력
        log.info(">>> [ 📧 이메일 발송 준비 - 수신자: {} 제목: {} ]", to, subject);

        // Gmail SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // SMTP 인증을 위한 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // 이메일 메시지 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from)); // 발신자 설정
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); // 수신자 설정
        message.setSubject(subject); // 제목 설정
        message.setText(text); // 본문 설정

        try {
            // 이메일 전송
            Transport.send(message);
            // 성공 로그 출력
            log.info(">>> [ ✅ 이메일 전송 성공 - 수신자: {} ]", to);
        } catch (MessagingException e) {
            // 에러 로그 출력 및 예외 발생
            log.error(">>> [ ❌ 이메일 전송 실패: {} ]", e.getMessage());
            throw new RuntimeException("이메일 전송 실패: " + e.getMessage(), e);
        }
    }
}
