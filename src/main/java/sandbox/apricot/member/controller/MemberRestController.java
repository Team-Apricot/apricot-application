package sandbox.apricot.member.controller;

import static org.springframework.http.HttpStatus.*;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import java.security.Principal;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.dto.request.MemberRegisterBasic;
import sandbox.apricot.member.dto.request.MemberRegisterDetail;
import sandbox.apricot.member.dto.request.UpdateAgeRange;
import sandbox.apricot.member.dto.request.UpdateCareer;
import sandbox.apricot.member.dto.request.UpdateGender;
import sandbox.apricot.member.dto.request.UpdateMarriedStatus;
import sandbox.apricot.member.dto.request.UpdateNickName;
import sandbox.apricot.member.dto.request.UpdateNumChild;
import sandbox.apricot.member.dto.request.UpdatePassword;
import sandbox.apricot.member.service.MemberService;

@RestController
@Log4j2
@RequiredArgsConstructor
@ResponseStatus(OK)
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
    public ApiResponse<Void> saveMember(@RequestBody @Valid MemberRegisterBasic reqBasic) {
        session.setAttribute("reqBasic", reqBasic);
        return ApiResponse.successResponse(
                OK,
                "기본 정보가 세션에 저장 되었습니다."
        );
    }

    /**
     * 회원 가입 - 회원 등록, 관심사 등록
     *
     * @param reqDetail - ageRange, gender, career, marriedStatus, numChild, interests
     */
    @PostMapping("/register")
    public ApiResponse<Void> registerMember(
            @RequestBody @Valid MemberRegisterDetail reqDetail
    ) {
        MemberRegisterBasic reqBasic = (MemberRegisterBasic) session.getAttribute("reqBasic");
        memberService.register(reqBasic.toService(), reqDetail.toService());
        session.removeAttribute("reqBasic"); // 기본 정보 삭제
        return ApiResponse.successResponse(
                OK,
                "성공적으로 회원가입을 완료하였습니다."
        );
    }

    /**
     * 회원 수정 - 비밀번호 변경
     *
     * @param request - oldPassword, newPassword
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/password")
    public ApiResponse<Void> updateMember(
            @RequestBody @Valid UpdatePassword request, Principal principal) {
        Long memberId = memberService.getMemberId(principal.getName());
        memberService.updatePassword(request, memberId);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 회원 비밀번호를 수정하였습니다."
        );
    }

    /**
     * 회원 수정 - 닉네임 변경
     *
     * @param request - memberId, nickName
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/nickname")
    public ApiResponse<Void> updateMember(@RequestBody @Valid UpdateNickName request) {
        memberService.updateNickName(request.toService());
        return ApiResponse.successResponse(
                OK,
                "성공적으로 회원 닉네임 정보를 수정하였습니다."
        );
    }

    /**
     * 회원 수정 - 나이대 변경
     *
     * @param request - memberId, nickName
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/ageRange")
    public ApiResponse<Void> updateMember(@RequestBody @Valid UpdateAgeRange request) {
        memberService.updateAgeRange(request.toService());
        return ApiResponse.successResponse(
                OK,
                "성공적으로 회원 나이대 정보를 수정하였습니다."
        );
    }

    /**
     * 회원 수정 - 직업 변경
     *
     * @param request - memberId , career
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/career")
    public ApiResponse<Void> updateCareer(@RequestBody @Valid UpdateCareer request) {
        memberService.updateCareer(request);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 직업을 수정하였습니다.."
        );
    }

    /**
     * 회원 수정 - 결혼상태 변경
     *
     * @param request - memberId , marriedStatus
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/marriedStatus")
    public ApiResponse<Void> updateMarriedStatus(@RequestBody @Valid UpdateMarriedStatus request) {
        memberService.updateMarriedStatus(request);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 결혼상태를 수정하였습니다."
        );
    }

    /**
     * 회원 수정 - 자녀수 변경
     *
     * @param request - memberId , numChild
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/numChild")
    public ApiResponse<Void> updateNumChild(@RequestBody @Valid UpdateNumChild request) {
        memberService.updateNumChild(request);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 자녀수를 수정하였습니다."
        );
    }

    /**
     * 회원 수정 - 성별 변경
     *
     * @param request - memberId , gender
     */
    @PreAuthorize("isAuthenticated()")
    @PatchMapping("/gender")
    public ApiResponse<Void> updateGender(@RequestBody @Valid UpdateGender request) {
        memberService.updateGender(request);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 성별을 수정하였습니다."
        );
    }

    /**
     * 회원 삭제
     */
    @PreAuthorize("isAuthenticated()")
    @DeleteMapping
    public ApiResponse<Void> delete(Principal principal) {
        Long memberId = memberService.getMemberId(principal.getName());
        memberService.delete(memberId);
        return ApiResponse.successResponse(
                OK,
                "성공적으로 회원을 삭제하였습니다."
        );
    }

}

