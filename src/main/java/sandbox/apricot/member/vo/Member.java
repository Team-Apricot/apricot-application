package sandbox.apricot.member.vo;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import sandbox.apricot.common.entity.BaseTime;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "memberId", callSuper = false)
public class Member extends BaseTime {

    private Long memberId; // 사용자 고유 식별자
    private String email; // 로그인 아이디
    private String nickName; // 닉네임
    private String password; // 로그인 비밀번호
    private String ageRange; // 연령대 - 20대 미만, 20대, 30대, 40대, 50대 이상
    private String gender; // 성별
    private String career; // 직업 - 무직, 학생, 직장인
    private String marriedStatus; // 결혼 유무 - SINGLE, MARRIED
    private int numChild; // 자녀 수 - 0, 1, 2+
    private MemberRole memberRole; // 권한 - USER_ROLE, ADMIN_ROLE

    @Builder
    public Member(String email, String nickName, String password, String ageRange, String gender,
            String career, String marriedStatus, int numChild, MemberRole memberRole) {
        this.email = email;
        this.nickName = nickName;
        this.password = password;
        this.ageRange = ageRange;
        this.gender = gender;
        this.career = career;
        this.marriedStatus = marriedStatus;
        this.numChild = numChild;
        this.memberRole = memberRole;
    }

}
