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

  @GetMapping("/login")
  public String loginPage(Model model){
    return "/WEB-INF/components/login.jsp";
  }
}
