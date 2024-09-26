package sandbox.apricot.scrap.dto.response;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScrapInfo {

    private Long memberId;
    private Long scrapId;
    private String policyCode;
    private String districtName; //정책 구 이름
    private String policyName; //정책 이름
    private String prdRpttSecd; // 정책 상태
    private String districtLogoPath; //구 이미지

    @Builder
    public ScrapInfo(Long scrapId, String policyCode, String districtName, String policyName,
            String prdRpttSecd,
            String districtLogoPath) {
        this.scrapId = scrapId;
        this.policyCode = policyCode;
        this.districtName = districtName;
        this.policyName = policyName;
        this.prdRpttSecd = prdRpttSecd;
        this.districtLogoPath = districtLogoPath;
    }
}
