package sandbox.apricot.member.service;

import jakarta.annotation.PostConstruct;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import sandbox.apricot.member.vo.Member;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    // 이메일 발송에 사용할 Gmail 주소와 비밀번호를 프로퍼티 파일에서 가져옵니다.
    @Value("${spring.mail.username}")  // application.properties 또는 application.yml에 정의된 이메일 주소
    private String from;

    @Value("${spring.mail.password}")  // application.properties 또는 application.yml에 정의된 비밀번호
    private String password;

    // 인증코드 생성 메서드 구현
    @Override
    public String generateAuthCode() {
        Random random = new Random();
        int authCode = random.nextInt(999999); // 6자리 인증 코드 생성
        return String.format("%06d", authCode);
    }

    // 이메일 발송 메서드 구현
    @Override
    public void sendEmail(Member email, String subject, String text) throws MessagingException {
        // 이메일 수신자의 이메일 주소
        String to = email.getEmail(); // 사용자 VO에서 이메일 주소 가져오기

        // 수신인, 제목, 본문 내용을 출력하여 확인
        System.out.println("To: " + to);
        System.out.println("Subject: " + subject);
        System.out.println("Text: " + text);
        System.out.println("From: " + from);  // 발신인 정보도 다시 확인
        System.out.println("Attempting to send email...");

        // Gmail SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // 인증을 위한 세션 생성
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
            Transport.send(message);
            System.out.println("Email sent successfully to " + to);
        } catch (MessagingException e) {
            e.printStackTrace(); // 에러 출력
            throw new RuntimeException("Failed to send email: " + e.getMessage(), e);
        }

        // 이메일 전송
        Transport.send(message);
        System.out.println("Email sent successfully to " + to); // 성공 메시지 출력
    }
}
