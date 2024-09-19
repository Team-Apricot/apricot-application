package sandbox.apricot.scrap.controller;

import static org.springframework.http.HttpStatus.OK;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sandbox.apricot.common.response.ApiResponse;
import sandbox.apricot.scrap.dto.request.ScrapRegister;
import sandbox.apricot.scrap.service.ScrapService;

@RestController
@Log4j2 // Log 사용을 위해 추가
@RequiredArgsConstructor
@RequestMapping("/api/v1/scrap") // API Path 수정 [Before] >>> "api/scrap"
public class ScrapRestController {

  private final ScrapService scrapService;

  // 스크랩 등록 API
  @PostMapping(value = "/register")
  public ResponseEntity<ApiResponse<Void>> saveScrap(@RequestBody @Valid ScrapRegister request) {
    scrapService.register(request.toService())
    return ResponseEntity.ok().body(
        ApiResponse.successResponse(
            OK,
            "성공적으로 혜택을 저장하였습니다."
        )
    );
  }
}
