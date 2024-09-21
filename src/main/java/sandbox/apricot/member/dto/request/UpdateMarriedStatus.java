package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class UpdateMarriedStatus {

  private final Long memberId; //멤버아이디
  private final String marriedStatus; //결혼상태


}
