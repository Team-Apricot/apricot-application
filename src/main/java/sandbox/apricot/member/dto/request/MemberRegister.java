package sandbox.apricot.member.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MemberRegister {

    @NotNull(message = "이메일 식별 정보가 필요 합니다.")
    private String email; // 로그인 아이디

    @NotNull(message = "닉네임 식별 정보가 필요 합니다.")
    private String nickName; // 닉네임

    @NotNull(message = "비밀번호 식별 정보가 필요 합니다.")
    private String password; // 로그인 비밀번호

    public static MemberRegister of(String email, String nickName, String password) {
        return MemberRegister.builder()
                .email(email)
                .nickName(nickName)
                .password(password)
                .build();
    }

}
