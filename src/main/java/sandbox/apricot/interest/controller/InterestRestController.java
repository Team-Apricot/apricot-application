package sandbox.apricot.interest.controller;

import static org.springframework.http.HttpStatus.OK;

import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.interest.dto.request.InterestRegister;
import sandbox.apricot.interest.service.InterestService;
import sandbox.apricot.member.service.MemberService;

@RestController
@Log4j2
@RequiredArgsConstructor
@ResponseStatus(OK)
@RequestMapping("/api/v1/interest")
public class InterestRestController {

    private final InterestService interestService;
    private final MemberService memberService;

    /**
     * 관심사 수정
     *
     * @param request - List<String> categoryInfo;
     */
    @PutMapping("/update")
    public ApiResponse<Void> updateInterest(@RequestBody List<String> request,
            Principal principal) {
        Long memberId = memberService.getMemberId(principal.getName());
        interestService.update(InterestRegister.of(memberId, request));
        return ApiResponse.successResponse(OK, "성공적으로 관심사 정보를 수정하였습니다.");
    }

}
