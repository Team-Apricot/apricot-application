package sandbox.apricot.policy.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.policy.dto.PolicyDTO;
import sandbox.apricot.policy.service.PolicyService;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;
import sandbox.apricot.policy.dto.PolicyDetailDTO;
import sandbox.apricot.policy.service.PolicyDetailService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/policy")
public class PolicyController {

    private final PolicyService policyService; // 정책 서비스 주입
    private final PolicyDetailService policyDetailService; // 정책 상세 서비스 주입

    // 지역구에 따른 정책 조회
    @GetMapping("/area")
    public String getAllPolicies(@RequestParam(value = "districtCode", required = false) String districtCode,
            @RequestParam(value = "category", required = false, defaultValue = "전체") String category,
            Model model) {
        try {
            // districtCode 및 category로 정책 조회
            List<PolicyDTO> policies = policyService.selectAllPolicy(category, districtCode);
            model.addAttribute("policies", policies); // 모델에 정책 리스트 추가
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
        }
        return "policy/area"; // area.jsp로 이동
    }

    // 검색 이름에 따른 지역구 정보 조회
    @GetMapping
    public String viewArea(@RequestParam("search-name") String searchName, Model model) {
        model.addAttribute("district", searchName); // 모델에 지역구 이름 추가
        return "policy/area"; // area.jsp로 이동
    }

    // 정책 상세 페이지 조회 (JSP 렌더링)
    @GetMapping("/detail/{policy_code}")
    public String viewDetail(Model model, @PathVariable("policy_code") String policyCode) {
        PolicyDetailDTO policyDetails = policyDetailService.getPolicyDetailsByCode(policyCode);
        model.addAttribute("policyDetails", policyDetails);
        return "policy/detail";
    }

    @RestController // RestController를 사용해 JSON 데이터를 반환
    @RequiredArgsConstructor
    @RequestMapping("/api/policy")
    class PolicyApiController {

        private final PolicyService policyService;

        // 지역구에 따른 정책 조회 (JSON 데이터 반환)
        @GetMapping("/area")
        public ResponseEntity<List<PolicyDTO>> getAllPolicies(
                @RequestParam(value = "districtCode", required = false) String districtCode) {
            try {
                // districtCode로 정책 조회
                List<PolicyDTO> policies = policyService.selectAllPolicy(null, districtCode);
                return ResponseEntity.ok(policies); // JSON 형태로 정책 리스트 반환
            } catch (Exception e) {
                e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
                return ResponseEntity.status(500).build(); // 오류 발생 시 500 에러 반환
            }
        }
    }

}
