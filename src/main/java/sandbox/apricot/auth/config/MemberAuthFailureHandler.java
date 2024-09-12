package sandbox.apricot.auth.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

/**
 * 로그인 실패시 에러 메시지를 띄우기 위한 핸들러
 */
public class MemberAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        // 실패 메시지를 담기 위한 세션 선언
        HttpSession session = request.getSession();
        // 세션에 실패 메세지 담기
        session.setAttribute("loginErrorMessage", exception.getMessage());
        // TODO: 로그인 실패시 이동할 페이지
        setDefaultFailureUrl("/");
        // 로그인 실패시 이동할 페이지로 이동
        super.onAuthenticationFailure(request, response, exception);
    }
}
