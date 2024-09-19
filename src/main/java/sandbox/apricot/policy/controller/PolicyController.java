package sandbox.apricot.policy.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import sandbox.apricot.policy.dto.PolicyDetailDTO;
import sandbox.apricot.policy.service.PolicyDetailService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/policy")
public class PolicyController {

    private final PolicyDetailService policyDetailService;

    @GetMapping("/area")
    public String viewArea(Model model) {
        return "policy/area";
    }

    /*
    @GetMapping("/detail")
    public String viewDetail(Model model) {
        List<PolicyDetailDTO> policyDetails = policyDetailService.getPolicyDetails();
        model.addAttribute("policyDetails", policyDetails);
        return "policy/detail";
    }
    */

    @GetMapping("/detail/{policy_code}")
    public String viewDetail(Model model, @PathVariable("policy_code") String policyCode) {
        PolicyDetailDTO policyDetails = policyDetailService.getPolicyDetailsByCode(policyCode);
        model.addAttribute("policyDetails", policyDetails);
        return "policy/detail";
    }

}
