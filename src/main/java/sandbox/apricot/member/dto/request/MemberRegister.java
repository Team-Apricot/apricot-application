package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MemberRegister {

    private String email; // 로그인 아이디
    private String nickName; // 닉네임
    private String password; // 로그인 비밀번호
    private String ageRange; // 연령대 - 20대 미만, 20대, 30대, 40대, 50대 이상
    private String gender; // 성별
    private String career; // 직업 - 무직, 학생, 직장인
    private String marriedStatus; // 결혼 유무 - SINGLE, MARRIED
    private Integer numChild; // 자녀 수 - 0, 1, 2+

    public static MemberRegister of(String email, String nickName, String password, String ageRange,
            String gender, String career, String marriedStatus, Integer numChild) {
        return MemberRegister.builder()
                .email(email)
                .nickName(nickName)
                .password(password)
                .ageRange(ageRange)
                .gender(gender)
                .career(career)
                .marriedStatus(marriedStatus)
                .numChild(numChild)
                .build();
    }
}
