package sandbox.apricot.policy.vo;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import sandbox.apricot.common.entity.BaseTime;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "reviewId", callSuper = false)
public class Review extends BaseTime {

    private Long reviewId;
    private String policyCode;
    private Long memberId;
    private Integer policyScore;

    @Builder
    public Review(String policyCode, Long memberId, Integer policyScore) {
        this.policyCode = policyCode;
        this.memberId = memberId;
        this.policyScore = policyScore;
    }

}
