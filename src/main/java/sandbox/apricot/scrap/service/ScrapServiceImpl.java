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
    public void register(Long memberId, String policyCode) {
        log.info(" >>> [ ✨ 정책 {} 번, 스크랩을 시도 합니다. ]", policyCode);
        mapper.save(toVO(memberId, policyCode));
        log.info(" >>> [ ✨ 스크랩 성공. ]");
    }

    private Scrap toVO(Long memberId, String policyCode) {
        return Scrap.builder()
                .memberId(memberId)
                .policyCode(policyCode)
                .build();
    }

    @Override
    public List<ScrapInfo> getScrapInfo(Long memberId) {
        return mapper.findScrap(memberId);
    }

}

