package sandbox.apricot.recommendation.controller;

import static org.springframework.http.HttpStatus.OK;

import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.dto.response.PolicyScoreDTO;
import sandbox.apricot.recommendation.dto.response.RecommendationInfo;
import sandbox.apricot.recommendation.dto.response.ScrapGroupSimilarityDTO;
import sandbox.apricot.recommendation.service.RecommendationService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/recommendation")
public class RecommendationRestController {

    private final RecommendationService recommendationService;
    private final MemberService memberService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping
    public ApiResponse<RecommendationInfo> getRecommendationByMemberId(
            Principal principal) {
        Long memberId = memberService.getMemberId(principal.getName());
        RecommendationInfo data = recommendationService.getRecommendationInfo(memberId);
        return ApiResponse.successResponse(OK, "성공적으로 추천 정보를 조회 하였습니다. ", data);
    }

    @GetMapping("/by-number")
    public ApiResponse<List<DistrictScoreDTO>> getDistrictScoreByNumber(Principal principal) {
        List<DistrictScoreDTO> data = recommendationService.getDistrictScoreByPolicyNumber(
                memberService.getMemberId(principal.getName())
        );
        return ApiResponse.successResponse(OK, "성공적으로 지역구별 점수(Number)를 조회하였습니다. ", data);
    }

    @GetMapping("/by-policy-score")
    public ApiResponse<List<DistrictScoreDTO>> getDistrictScoreByPolicyScore(Principal principal) {
        List<DistrictScoreDTO> data = recommendationService.getDistrictScoreByPolicyScore(
                memberService.getMemberId(principal.getName())
        );
        return ApiResponse.successResponse(OK, "성공적으로 지역구별 점수(PolicyScore)를 조회하였습니다.", data);
    }

    @GetMapping("/by-related-scrap-group")
    public ApiResponse<List<ScrapGroupSimilarityDTO>> getDistrictScoreByScarpGroup(
            Principal principal) {
        Long memberId = memberService.getMemberId(principal.getName());
        MemberInfo member = memberService.getMemberInfo(memberId);
        List<ScrapGroupSimilarityDTO> data = recommendationService.getRecommendationByScrapGroup(
                member.getAgeRange(), member.getGender()
        );

        return ApiResponse.successResponse(OK, "성공적으로 찜 그룹별 지역구 추천을 조회하였습니다.", data);
    }

    @GetMapping("/related-policy/{policy_code}")
    public ApiResponse<List<PolicyScoreDTO>> getRelatedPolicyByPolicyScore(
            @PathVariable("policy_code") String policyCode) {
        List<PolicyScoreDTO> data = recommendationService.getPolicyRecommendation(policyCode);
        return ApiResponse.successResponse(OK, "성공적으로 관련 정책 추천 리스트를 조회하였습니다.", data);
    }
}
