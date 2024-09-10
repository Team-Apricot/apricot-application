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
  @GetMapping("/signup")
  public String signUp(Model model) {
    return "/member/signup";
  }

  @GetMapping("/secondSignUp")
  public String secondSignUp(Model model) {
    return "/member/secondSignUp";
  }


}
