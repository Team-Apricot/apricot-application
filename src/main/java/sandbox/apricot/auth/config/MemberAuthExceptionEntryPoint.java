package sandbox.apricot.auth.config;

import static jakarta.servlet.http.HttpServletResponse.SC_UNAUTHORIZED;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Component
public class MemberAuthExceptionEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException, ServletException {
        String errorMessage = "{\"error\": \"아이디 또는 비밀번호가 맞지 않습니다.\"}";
        response.setContentType("application/json; charset=UTF-8");
        response.setStatus(SC_UNAUTHORIZED);
        response.getWriter().write(errorMessage);
        response.getWriter().flush();
        response.getWriter().close();
    }

}
