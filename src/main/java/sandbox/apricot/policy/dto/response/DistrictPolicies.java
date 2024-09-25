package sandbox.apricot.policy.dto.response;

import java.util.List;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class DistrictPolicies {

    private String categoryCode;
    private List<PolicyTLDR> policies;
    private int totalPages;

    @Builder
    public DistrictPolicies(String categoryCode, List<PolicyTLDR> policies, int totalPages) {
        this.categoryCode = categoryCode;
        this.policies = policies;
        this.totalPages = totalPages;
    }

}
