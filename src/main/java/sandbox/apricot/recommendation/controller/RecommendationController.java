package sandbox.apricot.recommendation.controller;

import static org.springframework.http.HttpStatus.OK;

import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.recommendation.dto.response.DistrictScoreDTO;
import sandbox.apricot.recommendation.service.RecommendationService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/recommendation")
public class RecommendationController {

    private final RecommendationService recommendationService;
    private final MemberService memberService;

    @GetMapping("/by-number")
    public ApiResponse<List<DistrictScoreDTO>> getDistrictScoreByNumber(Principal principal) {
        List<DistrictScoreDTO> data = recommendationService.getDistrictScoreByPolicyNumber(
                memberService.getMemberId(principal.getName())
        );
        return ApiResponse.successResponse(OK, "점수", data);
    }

    @GetMapping("/by-reputation")
    public ApiResponse<List<DistrictScoreDTO>> getDistrictScoreByReputation(Principal principal) {
        List<DistrictScoreDTO> data = recommendationService.getDistrictScoreByPolicyReputation(
                memberService.getMemberId(principal.getName())
        );
        return ApiResponse.successResponse(OK, "점수", data);
    }
}
