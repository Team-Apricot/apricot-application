package sandbox.apricot.member.dto.response;

import java.util.List;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberInfo {

    private String email; // 로그인 아이디
    private String nickName; // 닉네임
    private String ageRange; // 연령대 - 20대 미만, 20대, 30대, 40대, 50대 이상
    private String gender; // 성별
    private String career; // 직업 - 무직, 학생, 직장인
    private String marriedStatus; // 결혼 유무 - SINGLE, MARRIED
    private Integer numChild; // 자녀 수 - 0, 1, 2+
    private String memberRole; // 권한 - USER_ROLE, ADMIN_ROLE
    private List<String> interests; // 관심사 이름

    @Builder
    public MemberInfo(String email, String nickName, String ageRange, String gender, String career,
            String marriedStatus, Integer numChild, String memberRole, List<String> interests) {
        this.email = email;
        this.nickName = nickName;
        this.ageRange = ageRange;
        this.gender = gender;
        this.career = career;
        this.marriedStatus = marriedStatus;
        this.numChild = numChild;
        this.memberRole = memberRole;
        this.interests = interests;
    }

}
