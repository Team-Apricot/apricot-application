package sandbox.apricot.scrap.controller;

import static org.springframework.http.HttpStatus.OK;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.scrap.dto.request.ScrapRegister;
import sandbox.apricot.scrap.service.ScrapService;

@RestController
@RequiredArgsConstructor
@ResponseStatus(OK)
@RequestMapping("/api/v1/scrap")
public class ScrapRestController {

    private final ScrapService scrapService;

    /**
     * 혜택 정보 스크랩
     */
    @PostMapping("/register")
    public ApiResponse<Void> register(@RequestBody @Valid ScrapRegister request) {
        scrapService.register(request.toService());
        return ApiResponse.successResponse(OK, "성공적으로 혜택을 저장하였습니다.");
    }

}
