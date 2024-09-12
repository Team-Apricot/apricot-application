package sandbox.apricot.member.dto.response;

import lombok.Builder;
import lombok.Getter;
import sandbox.apricot.member.entity.Member;

@Getter
@Builder
public class MemberInfo {

    private String email; // 로그인 아이디
    private String nickName; // 닉네임
    private String ageRange; // 연령대 - 20대 미만, 20대, 30대, 40대, 50대 이상
    private String gender; // 성별
    private String career; // 직업 - 무직, 학생, 직장인
    private String marriedStatus; // 결혼 유무 - SINGLE, MARRIED
    private Integer numChild; // 자녀 수 - 0, 1, 2+
    private String memberRole; // 권한 - USER_ROLE, ADMIN_ROLE
    // TODO: 관심사 추가

    public static MemberInfo from(Member member) {
        return MemberInfo.builder()
                .email(member.getEmail())
                .nickName(member.getNickName())
                .ageRange(member.getAgeRange())
                .gender(member.getGender())
                .career(member.getCareer())
                .marriedStatus(member.getMarriedStatus())
                .numChild(member.getNumChild())
                .memberRole(member.getMemberRole().name())
                .build();
    }

}
