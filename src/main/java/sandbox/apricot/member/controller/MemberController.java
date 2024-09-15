package sandbox.apricot.member.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.service.MemberService;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/register")
    public String signUp(Model model) {
        return "member/register";
    }

    @GetMapping("/register-interest")
    public String informationSignUp(Model model) {
        return "member/register-interest";
    }

    @GetMapping("/mypage")
    public String myPage(Model model, @AuthenticationPrincipal MemberPrincipalDetails member) {
        Long memberId = member.getMember().getMemberId();
        MemberInfo memberInfo = memberService.getMemberInfo(memberId);
        model.addAttribute("memberInfo", memberInfo);
        return "member/myPage";
    }

}
