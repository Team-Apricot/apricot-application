package sandbox.apricot.policy.dto.response;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "districtCode", callSuper = false)
public class District {

    private String districtCode;
    private String districtName;
    private String districtLogoPath;
    private String districtSlogan;

    @Builder
    public District(String districtCode, String districtName, String districtLogoPath,
            String districtSlogan) {
        this.districtCode = districtCode;
        this.districtName = districtName;
        this.districtLogoPath = districtLogoPath;
        this.districtSlogan = districtSlogan;
    }

}
