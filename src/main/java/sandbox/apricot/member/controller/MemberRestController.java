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
import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.service.MemberService;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api/v1/member")
public class MemberRestController {

    private final MemberService memberService;
    private final HttpSession session;

    /**
     * 회원 가입을 위해 필요한 기본 정보를 세션에 저장
     *
     * @param reqBasic - email, password, nickName
     */
    @PostMapping("/register-basic")
    public ResponseEntity<ApiResponse<Void>> saveMember(
            @RequestBody @Valid MemberRegisterBasic reqBasic
    ) {
        session.setAttribute("reqBasic", reqBasic);
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
     * @param reqDetail - ageRange, gender, career, marriedStatus, numChild, interests
     */
    @PostMapping("/register")
    public ResponseEntity<ApiResponse<Void>> registerMember(
            @RequestBody @Valid MemberRegisterDetail reqDetail
    ) {
        MemberRegisterBasic reqBasic = (MemberRegisterBasic) session.getAttribute("reqBasic");
        memberService.register(reqBasic.toService(), reqDetail.toService());
        session.removeAttribute("reqBasic"); // 기본 정보 삭제
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "성공적으로 회원가입을 완료하였습니다."
                )
        );
    }

}
