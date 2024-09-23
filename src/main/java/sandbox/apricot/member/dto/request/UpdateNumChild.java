package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class UpdateNumChild {

  private final Long memberId; //멤버아이디
  private final Integer numChild; //자녀수

}
