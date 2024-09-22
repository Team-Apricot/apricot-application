package sandbox.apricot.member.controller;

import static org.springframework.http.HttpStatus.*;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    /**
     * 회원 수정 - 닉네임 변경
     *
     * @param request - memberId, nickName
     */
    @PatchMapping("/nickname")
    public ResponseEntity<ApiResponse<Void>> updateMember(@RequestBody @Valid UpdateNickName request) {
        memberService.updateNickName(request.toService());
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "성공적으로 회원 닉네임 정보를 수정하였습니다."
                )
        );
    }

    /**
     * 회원 수정 - 나이대 변경
     *
     * @param request - memberId, nickName
     */
    @PatchMapping("/ageRange")
    public ResponseEntity<ApiResponse<Void>> updateMember(@RequestBody @Valid UpdateAgeRange request) {
        memberService.updateAgeRange(request.toService());
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        OK,
                        "성공적으로 회원 나이대 정보를 수정하였습니다."
                )
        );
    }

    /**
    * 회원 수정 - 직업 변경
    *
    * @param request - memberId , career
    */
    @PatchMapping("/career")
    public ResponseEntity<ApiResponse<Void>> updateCareer(@RequestBody @Valid UpdateCareer request){
        memberService.updateCareer(request);
        return ResponseEntity.ok().body(
            ApiResponse.successResponse(
                OK,
                "성공적으로 직업을 수정하였습니다.."
            )
        );
    }

    /**
     * 회원 수정 - 결혼상태 변경
     *
     * @param request - memberId , marriedStatus
     */
    @PatchMapping("/marriedStatus")
    public ResponseEntity<ApiResponse<Void>> updateMarriedStatus(@RequestBody @Valid
        UpdateMarriedStatus request){
        memberService.updateMarriedStatus(request);
        return ResponseEntity.ok().body(
            ApiResponse.successResponse(
                OK,
                "성공적으로 결혼상태를 수정하였습니다."
            )
        );
    }

    /**
     * 회원 수정 - 자녀수 변경
     *
     * @param request - memberId , numChild
     */
    @PatchMapping("/numChild")
    public ResponseEntity<ApiResponse<Void>> updateNumChild(@RequestBody @Valid
    UpdateNumChild request){
        memberService.updateNumChild(request);
        return ResponseEntity.ok().body(
            ApiResponse.successResponse(
                OK,
                "성공적으로 자녀수를 수정하였습니다."
            )
        );
    }


    /**
     * 회원 수정 - 성별 변경
     *
     * @param request - memberId , gender
     */
    @PatchMapping("/gender")
    public ResponseEntity<ApiResponse<Void>> updateGender(@RequestBody @Valid
    UpdateGender request){
        memberService.updateGender(request);
        return ResponseEntity.ok().body(
            ApiResponse.successResponse(
                OK,
                "성공적으로 성별을 수정하였습니다."
            )
        );
    }

}
