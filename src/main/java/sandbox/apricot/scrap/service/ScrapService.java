package sandbox.apricot.scrap.service;

import java.util.List;
import sandbox.apricot.scrap.dto.request.ScrapRegister;
import sandbox.apricot.scrap.dto.response.ScrapInfo;


public interface ScrapService {

    void register(Long memberId, String policyCode); //스크랩 등록

    List<ScrapInfo> getScrapInfo(Long memberId); //스크랩 정보 불러오기

}
