package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class UpdateAgeRange {

    private final Long memberId; // 사용자 고유 식별자
    private final String ageRange; // 연령대 - 20대 미만, 20대, 30대, 40대, 50대 이상

    public UpdateAgeRange toService() { return this; }

}
