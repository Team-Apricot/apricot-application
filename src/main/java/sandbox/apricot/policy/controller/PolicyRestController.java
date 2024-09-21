package sandbox.apricot.policy.controller;

import static org.springframework.http.HttpStatus.OK;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.service.PolicyService;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api/v1/policy")
public class PolicyRestController {

    private final PolicyService policyService;

    @GetMapping("/word-cloud")
    public ResponseEntity<ApiResponse<List<DistrictPolicy>>> getDistrictPolicies() {
        List<DistrictPolicy> data = policyService.getPolicyCntByDistrict();
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "성공적으로 지역구별 혜택수를 조회하였습니다.",
                        data
                )
        );
    }

}
