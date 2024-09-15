package sandbox.apricot.member.controller;

import static org.springframework.http.HttpStatus.*;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.interest.service.InterestService;
import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.service.MemberService;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api/v1/member")
public class MemberRestController {

    private final MemberService memberService;
    private final InterestService interestService;
    private final HttpSession session;

    /**
     * 회원 가입을 위해 필요한 기본 정보를 세션에 저장
     *
     * @param request - email, password, nickName
     */
    @PostMapping("/register-basic")
    public ResponseEntity<ApiResponse> saveMember(@RequestBody @Valid MemberRegisterBasic request) {
        session.setAttribute("basicInfo", request);
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "기본 정보가 세션에 저장 되었습니다."
                )
        );
    }

    /**
     * 회원 가입 - 회원 등록, 관심사 등록
     *
     * @param request - ageRange, gender, career, marriedStatus, numChild, interests
     */
    @PostMapping("/register")
    public ResponseEntity<ApiResponse> registerMember(@RequestBody @Valid MemberRegisterDetail request) {
        MemberRegisterBasic basicInfo = (MemberRegisterBasic) session.getAttribute("basicInfo");
        memberService.register(basicInfo, request);

        Long memberId = memberService.getMemberId(basicInfo.getEmail());
        interestService.register(request.getInterests(), memberId);

        session.removeAttribute("basicInfo"); // 기본 정보 삭제
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "성공적으로 회원가입을 완료하였습니다."
                )
        );
    }

}
