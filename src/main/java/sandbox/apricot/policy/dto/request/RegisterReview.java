package sandbox.apricot.policy.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
public class RegisterReview {

    private String policyCode;
    private Integer policyScore;

    @Builder
    public RegisterReview(String policyCode, Integer policyScore) {
        this.policyCode = policyCode;
        this.policyScore = policyScore;
    }

}
