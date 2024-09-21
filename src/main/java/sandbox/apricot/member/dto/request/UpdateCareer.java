package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
@Builder
public class UpdateCareer {

  private final Long memberId; //멤버아이디
  private final String career; //직업

}
