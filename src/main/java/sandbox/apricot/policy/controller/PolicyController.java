package sandbox.apricot.policy.controller;

import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sandbox.apricot.policy.dto.PolicyDTO;
import sandbox.apricot.policy.service.PolicyService;

import java.util.List;
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
    public String getAllPolicies(
            @RequestParam(value = "districtCode", required = false) String districtCode,
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

    // 검색 이름에 따른 지역구 정보 조회 및 area.jsp 렌더링
    @GetMapping
    public String viewArea(@RequestParam("search-name") String searchName, Model model) {
        // searchName에 따른 regionId 가져오기
        String regionId = getRegionIdByName(searchName);
        if (regionId == null) {
            regionId = "00"; // 알 수 없는 지역일 경우 기본값 설정
        }
        model.addAttribute("districtName", searchName); // 지역구 이름 추가
        model.addAttribute("districtCode", regionId); // 지역구 코드 추가
        return "policy/area"; // area.jsp로 이동
    }

    // 정책 상세 페이지 조회 (JSP 렌더링)
    @GetMapping("/detail/{policy_code}")
    public String viewDetail(Model model, @PathVariable("policy_code") String policyCode) {
        PolicyDetailDTO policyDetails = policyDetailService.getPolicyDetailsByCode(policyCode);
        model.addAttribute("policyDetails", policyDetails);
        return "policy/detail";
    }

    // 지역구 이름에 따른 regionId 반환 함수
    private String getRegionIdByName(String searchName) {
        Map<String, String> regionMap = new HashMap<>();
        regionMap.put("종로구", "01");
        regionMap.put("중구", "02");
        regionMap.put("용산구", "03");
        regionMap.put("성동구", "04");
        regionMap.put("광진구", "05");
        regionMap.put("동대문구", "06");
        regionMap.put("중랑구", "07");
        regionMap.put("성북구", "08");
        regionMap.put("강북구", "09");
        regionMap.put("도봉구", "10");
        regionMap.put("노원구", "11");
        regionMap.put("은평구", "12");
        regionMap.put("서대문구", "13");
        regionMap.put("마포구", "14");
        regionMap.put("양천구", "15");
        regionMap.put("강서구", "16");
        regionMap.put("구로구", "17");
        regionMap.put("금천구", "18");
        regionMap.put("영등포구", "19");
        regionMap.put("동작구", "20");
        regionMap.put("관악구", "21");
        regionMap.put("서초구", "22");
        regionMap.put("강남구", "23");
        regionMap.put("송파구", "24");
        regionMap.put("강동구", "25");
        return regionMap.getOrDefault(searchName, null);
    }

}
