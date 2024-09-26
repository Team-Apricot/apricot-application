package sandbox.apricot.recommendation.controller;

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
@RequestMapping("/recommendation")
public class RecommendationController {

    private final MemberService memberService;

    // 지역구 추천
    @GetMapping
    public String viewRecommend(Model model,
            @AuthenticationPrincipal MemberPrincipalDetails member) {
        Long memberId = member.getMember().getMemberId();
        MemberInfo memberInfo = memberService.getMemberInfo(memberId);
        model.addAttribute("memberInfo", memberInfo);
        return "policy/recommendation";
    }

}
