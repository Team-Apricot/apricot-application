package sandbox.apricot.scrap.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;


@Getter
@AllArgsConstructor //모든 생성자
@Builder
public class ScrapRegister {

  public Long memberId; //멤버아이디
  public String policyCode; //정책코드

  public ScrapRegister toService() {
    return this;
  }

}
