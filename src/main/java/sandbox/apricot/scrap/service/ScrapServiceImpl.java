package sandbox.apricot.scrap.service;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.scrap.dto.request.ScrapRegister;
import sandbox.apricot.scrap.dto.response.ScrapInfo;
import sandbox.apricot.scrap.mapper.ScrapMapper;
import sandbox.apricot.scrap.vo.Scrap;


@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class ScrapServiceImpl implements ScrapService {

  private final ScrapMapper mapper;

  @Override
  public void register(ScrapRegister request) {
    log.info(" >>> [ ✨ 정책 {} 번, 스크랩을 시도 합니다. ]", request.policyCode);
    mapper.save(toVO(request));
    log.info(" >>> [ ✨ 스크랩 성공. ]");
  }

  private Scrap toVO(ScrapRegister request) {
    return Scrap.builder()
        .memberId(request.getMemberId())
        .policyCode(request.getPolicyCode())
        .build();
  }

  @Override
  public List<ScrapInfo> getScrapInfo(Long memberId) {
    return mapper.findScrap(memberId);
  }

}

