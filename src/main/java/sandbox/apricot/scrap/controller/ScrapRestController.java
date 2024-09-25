package sandbox.apricot.scrap.controller;

import static org.springframework.http.HttpStatus.OK;

import java.security.Principal;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.service.MemberService;
import sandbox.apricot.scrap.service.ScrapService;

@RestController
@RequiredArgsConstructor
@ResponseStatus(OK)
@RequestMapping("/api/v1/scrap")
public class ScrapRestController {

    private final ScrapService scrapService;
    private final MemberService memberService;

    /**
     * 혜택 정보 스크랩
     */
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/register")
    public ApiResponse<Void> register(@RequestBody String policyCode, Principal principal) {
        scrapService.register(
                memberService.getMemberId(principal.getName()),
                policyCode
        );
        return ApiResponse.successResponse(OK, "성공적으로 혜택을 저장하였습니다.");
    }

}
