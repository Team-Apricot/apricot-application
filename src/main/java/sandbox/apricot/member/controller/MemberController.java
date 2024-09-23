package sandbox.apricot.member.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.scrap.dto.response.ScrapInfo;
import sandbox.apricot.scrap.service.ScrapService;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class MemberController {

  private final MemberService memberService;
  private final ScrapService scrapService;

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
    List<ScrapInfo> scrapInfo = scrapService.getScrapInfo(memberId);
    model.addAttribute("memberId",memberId);
    model.addAttribute("memberInfo", memberInfo);
    model.addAttribute("scrapInfo", scrapInfo);
    return "member/myPage";
  }

  @GetMapping("/update")
  public String updateMyPage(Model model, @AuthenticationPrincipal MemberPrincipalDetails member) {
    Long memberId = member.getMember().getMemberId();
    model.addAttribute("memberId",memberId);
    return "member/updateInfo";
  }

}
