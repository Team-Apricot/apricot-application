package sandbox.apricot.auth.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class AuthController {

    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

    @PostMapping("/login")
    public String login(
            HttpServletRequest request,
            @AuthenticationPrincipal MemberPrincipalDetails memberPrincipalDetails) {
        HttpSession session = request.getSession();
        String msg = session.getAttribute("loginErrorMessage").toString();
        session.setAttribute("loginErrorMessage", msg != null ? msg : "");

        if (isAuthenticated()) {
            return "redirect:/";
        }
        return "/";
    }

}
