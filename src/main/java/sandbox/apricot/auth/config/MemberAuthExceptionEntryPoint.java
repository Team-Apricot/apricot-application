package sandbox.apricot.auth.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Log4j2
@Component
public class MemberAuthExceptionEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException, ServletException {
        // 인증되지 않은 상태에서 접근 시 예외 처리
        String errorMessage = "인증이 필요합니다.";

        // 로그 출력
        log.error(">>> [ ❌ 인증 실패 ]");

        // 응답 데이터를 JSON 형식으로 설정
        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        response.setContentType("application/json;charset=UTF-8");

        // 에러 메시지 생성
        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("code", HttpStatus.UNAUTHORIZED.value());
        responseBody.put("message", errorMessage);

        // JSON으로 응답
        ObjectMapper objectMapper = new ObjectMapper();
        response.getWriter().write(objectMapper.writeValueAsString(responseBody));
    }

}
