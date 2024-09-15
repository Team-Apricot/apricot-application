package sandbox.apricot.member.dto.request;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MemberRegisterDetail {

    private final String ageRange;
    private final String gender;
    private final String career;
    private final String marriedStatus;
    private final String numChild;
    private final List<String> interests;

    @Builder
    public MemberRegisterDetail(String ageRange, String gender, String career,
            String marriedStatus, String numChild, List<String> interests) {
        this.ageRange = ageRange;
        this.gender = gender;
        this.career = career;
        this.marriedStatus = marriedStatus;
        this.numChild = numChild;
        this.interests = interests;
    }

}
