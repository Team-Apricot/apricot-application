package sandbox.apricot.scrap.vo;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED) //기본 생성자
@EqualsAndHashCode(of = "scrapId", callSuper = false)
public class Scrap {

  private Long scrapId;
  private Long memberId;
  private String policyCode;

  @Builder
  public Scrap(Long memberId, String policyCode) {
    this.memberId = memberId;
    this.policyCode = policyCode;
  }
}
