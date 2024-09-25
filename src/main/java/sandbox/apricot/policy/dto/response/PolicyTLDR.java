package sandbox.apricot.policy.dto.response;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PolicyTLDR {

    private Long cursorId;
    private String policyCode; // 정책 번호
    private String policyName; // 정책명
    private String policyContent; // 정책 부연 설명
    private String prdRpttSecd; // 사업 신청 기간 - 반복 구분 내용

    @Builder
    public PolicyTLDR(Long cursorId, String policyCode, String policyName, String policyContent, String prdRpttSecd) {
        this.cursorId = cursorId;
        this.policyCode = policyCode;
        this.policyName = policyName;
        this.policyContent = policyContent;
        this.prdRpttSecd = prdRpttSecd;
    }

}
