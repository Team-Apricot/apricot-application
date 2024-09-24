package sandbox.apricot.recommendation.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.recommendation.dto.RecommendationDTO;
import sandbox.apricot.recommendation.service.RecommendationService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/recommendation")
public class RecommendationController {

    private final RecommendationService recommendationService;

    // 사용자 선호도에 따른 지역구 추천 API
    @GetMapping("/districts")
    public List<RecommendationDTO> getRecommendedDistricts(@RequestParam Long memberId, @RequestParam List<String> interests) {
        return recommendationService.getRecommendedDistricts(memberId, interests);
    }

    // 특정 지역구의 특정 카테고리 정책 평가 점수 조회 API
    //@GetMapping("/districts/{district}/rating")
    @GetMapping("/districts2")
    public List<RecommendationDTO> getDistrictPolicyRating(String categoryCd) {
        categoryCd = "023040";
        return recommendationService.getDistrictPolicyRating(categoryCd);
    }
}
