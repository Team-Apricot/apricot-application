package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Builder
@Getter
@RequiredArgsConstructor
public class UpdateGender {

  private final Long memberId; //멤버아이디
  private final String gender; //성별
}
