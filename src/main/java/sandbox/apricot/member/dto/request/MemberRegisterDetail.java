package sandbox.apricot.member.dto.request;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class MemberRegisterDetail {

    private final String ageRange;
    private final String gender;
    private final String career;
    private final String marriedStatus;
    private final String numChild;

    @NotNull(message = ">>> [ ❌ 관심사는 최소 1개를 선택해야 합니다. ]")
    private final List<String> interests;

    public MemberRegisterDetail toService() {
        return this;
    }

}
