package sandbox.apricot.auth.provider;

import static sandbox.apricot.member.util.exception.MemberErrorCode.*;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;
import sandbox.apricot.auth.service.MemberPrincipalDetailService;
import sandbox.apricot.member.util.exception.MemberBusinessException;

@Log4j2
@Component
@RequiredArgsConstructor
public class MemberAuthenticatorProvider implements AuthenticationProvider {

    private final MemberPrincipalDetailService memberPrincipalDetailService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String email = authentication.getName();
        String password = authentication.getCredentials().toString();

        MemberPrincipalDetails memberPrincipalDetails = (MemberPrincipalDetails) memberPrincipalDetailService.loadUserByUsername(email);

        String dbPassword = memberPrincipalDetails.getPassword();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        log.info(">>> [ 🔍 데이터베이스에 등록된 사용자 계정을 확인 합니다. ]");

        if (!passwordEncoder.matches(password, dbPassword)) {
            throw new BadCredentialsException("아이디 또는 비밀번호가 일치하지 않습니다.");
        }

        log.info(">>> [ ✅ 사용자 인증이 완료 되었습니다. ]");
        return new UsernamePasswordAuthenticationToken(memberPrincipalDetails, null, memberPrincipalDetails.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
