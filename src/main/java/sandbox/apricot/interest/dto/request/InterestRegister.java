package sandbox.apricot.interest.dto.request;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class InterestRegister {

    private final Long memberId;
    private final List<String> categoryInfo;

    public static InterestRegister of(Long memberId, List<String> categoryInfo) {
        return InterestRegister.builder()
                .memberId(memberId)
                .categoryInfo(categoryInfo)
                .build();
    }

}
