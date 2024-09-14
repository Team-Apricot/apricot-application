package sandbox.apricot.member.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class MemberController {

    @GetMapping("/register")
    public String signUp(Model model) {
        return "member/register";
    }

    @GetMapping("/register-interest")
    public String informationSignUp(Model model) {
        return "member/register-interest";
    }

    @GetMapping("/mypage")
    public String myPage(Model model) {
        return "member/myPage";
    }

}
