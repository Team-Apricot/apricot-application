package sandbox.apricot.scrap.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.scrap.dto.response.ScrapInfo;
import sandbox.apricot.scrap.vo.Scrap;

@Mapper
public interface ScrapMapper {

  void save(Scrap scrap);

  List<ScrapInfo> findScrap(Long memberId);
}
