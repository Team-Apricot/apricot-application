package sandbox.apricot.policy.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.PolicyInfo;
import sandbox.apricot.policy.service.PolicyService;

import java.util.List;
import sandbox.apricot.policy.dto.response.PolicyDetailDTO;

@Controller
@RequiredArgsConstructor
@RequestMapping("/policy")
public class PolicyController {

    private final PolicyService policyService;

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
        PolicyDetailDTO policyDetails = policyService.getPolicyDetailsByCode(policyCode);
        model.addAttribute("policyDetails", policyDetails);
        return "policy/detail";
    }

}
