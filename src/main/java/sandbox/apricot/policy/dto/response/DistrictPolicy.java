package sandbox.apricot.policy.dto.response;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class DistrictPolicy {

    private String districtName;
    private Integer policyCnt;

    @Builder
    public DistrictPolicy(String districtName, Integer policyCnt) {
        this.districtName = districtName;
        this.policyCnt = policyCnt;
    }

}
