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

    @GetMapping
    public String viewRecommend() {
        return "policy/recommendation";
    }

}
