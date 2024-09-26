package sandbox.apricot.policy.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.PolicyInfo;
import sandbox.apricot.policy.service.PolicyService;

import java.util.List;
import sandbox.apricot.policy.dto.PolicyDetailDTO;
import sandbox.apricot.policy.service.PolicyDetailService;
import sandbox.apricot.scrap.dto.response.ScrapInfo;
import sandbox.apricot.scrap.service.ScrapService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/policy")
public class PolicyController {

    private final PolicyService policyService;
    private final PolicyDetailService policyDetailService;

    private final MemberService memberService;
    private final ScrapService scrapService;

    //정책 검색 페이지
    @GetMapping("/searchpolicy")
    public String goToPolicy(@RequestParam("policy-search-name") String searchName, Model model) {
        policyService.findPolicy(searchName);
        List<PolicyInfo> policyInfo = policyService.findPolicy(searchName);
        int policyCnt = policyInfo.size();
        model.addAttribute("policyInfo", policyInfo);
        model.addAttribute("policyCnt", policyCnt);
        return "policy/policy";
    }

    // 검색 이름에 따른 지역구 정보 조회 및 area.jsp 렌더링
    @GetMapping
    public String viewArea(@RequestParam("districtCode") String districtCode, Model model) {
        District district = policyService.getDistrict(districtCode);
        model.addAttribute("district", district);
        return "policy/area";
    }

    // 정책 상세 페이지 조회 (JSP 렌더링)
    @GetMapping("/detail/{policy_code}")
    public String viewDetail(Model model, @PathVariable("policy_code") String policyCode) {
        PolicyDetailDTO policyDetails = policyDetailService.getPolicyDetailsByCode(policyCode);
        model.addAttribute("policyDetails", policyDetails);

        //로그인 된 사람에게만 정보 넘기기 위해 사용
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = null;

        // 인증 객체가 존재하고 인증이 되어 있는지 확인 (anonymousUser가 아닌지 추가로 확인)
        if (authentication != null && authentication.isAuthenticated() &&
                !(authentication instanceof AnonymousAuthenticationToken)) {
            userName = authentication.getName();
        }

        // 로그인된 사용자만 스크랩 정보를 가져옴
        if (userName != null) {
            Long memberId = memberService.getMemberId(userName);
            System.out.println("Member ID: " + memberId);
            List<ScrapInfo> scrapInfo = scrapService.getScrapInfo(memberId);
            model.addAttribute("scrapInfo", scrapInfo);
        }
        return "policy/detail";
    }

}
