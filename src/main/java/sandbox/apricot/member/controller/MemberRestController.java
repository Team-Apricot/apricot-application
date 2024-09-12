package sandbox.apricot.member.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.member.dto.request.MemberRegister;
import sandbox.apricot.member.service.MemberService;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api/v1/member")
public class MemberRestController {

    private final MemberService memberService;

    @PostMapping
    public ResponseEntity<ApiResponse> registerMember (@RequestBody @Valid MemberRegister request) {
        memberService.insertMember(request);
        return ResponseEntity.ok().body(
                ApiResponse.successResponse(
                        HttpStatus.OK,
                        "성공적으로 회원가입을 완료하였습니다."
                ));
    }

}
