package sandbox.apricot.policy.controller;

import static org.springframework.http.HttpStatus.OK;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.policy.dto.PolicyDTO;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.service.PolicyService;

@RestController
@Log4j2
@RequiredArgsConstructor
@ResponseStatus(OK)
@RequestMapping("/api/v1/policy")
public class PolicyRestController {

    private final PolicyService policyService;

    @GetMapping("/word-cloud")
    public ApiResponse<List<DistrictPolicy>> getDistrictPolicies() {
        List<DistrictPolicy> data = policyService.getPolicyCntByDistrict();
        return ApiResponse.successResponse(OK, "성공적으로 지역구별 혜택수를 조회하였습니다.", data);
    }

    // 지역구에 따른 정책 조회 (JSON 데이터 반환)
    @GetMapping("/area")
    public ResponseEntity<List<PolicyDTO>> getAllPolicies(
            @RequestParam(value = "districtCode", required = false) String districtCode,
            @RequestParam(value = "category", required = false, defaultValue = "전체") String category) {
        try {
            // districtCode 및 category로 정책 조회
            List<PolicyDTO> policies = policyService.selectAllPolicy(category, districtCode);
            return ResponseEntity.ok(policies); // JSON 형태로 정책 리스트 반환
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
            return ResponseEntity.status(500).build(); // 오류 발생 시 500 에러 반환
        }
    }

}
