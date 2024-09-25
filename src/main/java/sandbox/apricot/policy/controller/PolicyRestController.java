package sandbox.apricot.policy.controller;

import static org.springframework.http.HttpStatus.OK;

import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.policy.dto.request.RegisterReview;
import sandbox.apricot.policy.dto.response.District;
import sandbox.apricot.policy.dto.response.DistrictPolicies;
import sandbox.apricot.policy.dto.response.DistrictPolicy;
import sandbox.apricot.policy.service.PolicyService;

@RestController
@Log4j2
@RequiredArgsConstructor
@ResponseStatus(OK)
@RequestMapping("/api/v1/policy")
public class PolicyRestController {

    private final PolicyService policyService;
    private final MemberService memberService;

    @GetMapping("/word-cloud")
    public ApiResponse<List<DistrictPolicy>> getDistrictPolicies() {
        List<DistrictPolicy> data = policyService.getPolicyCntByDistrict();
        return ApiResponse.successResponse(OK, "성공적으로 지역구별 혜택수를 조회하였습니다.", data);
    }

    @GetMapping("/district")
    public ApiResponse<District> getDistrictInfo(@RequestParam("districtCode") String districtCode) {
        District data = policyService.getDistrict(districtCode);
        return ApiResponse.successResponse(OK, "성공적으로 지역구 정보를 조회하였습니다.", data);
    }

    @GetMapping("/district-list")
    public ApiResponse<DistrictPolicies> getDistrictPolicies(
            @RequestParam(value = "categoryCode", required = false) String categoryCode,
            @RequestParam("districtCode") String districtCode,
            @RequestParam(value = "page", defaultValue = "1") int page
        ) {
        DistrictPolicies data = policyService.getDistrictPolicies(districtCode, categoryCode, page);
        return ApiResponse.successResponse(OK, "성공적으로 지역구 혜택을 조회하였습니다.", data);
    }

    @PostMapping
    public ApiResponse<Void> registerReview(
            @RequestBody RegisterReview request,
            Principal principal
    ) {
        policyService.registerReview(
                request,
                memberService.getMemberId(principal.getName())
        );
        return ApiResponse.successResponse(OK, "성공적으로 혜택 리뷰를 등록 하였습니다.");
    }

}
