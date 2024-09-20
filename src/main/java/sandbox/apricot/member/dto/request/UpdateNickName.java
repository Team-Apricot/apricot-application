package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class UpdateNickName {

    private final Long memberId; // 사용자 고유 식별자
    private final String nickName; // 닉네임

    public UpdateNickName toService() { return this; }

}
