package sandbox.apricot.member.dto.request;

import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import sandbox.apricot.member.util.annotation.NickName;
import sandbox.apricot.member.util.annotation.Password;

@Getter
@AllArgsConstructor
public class MemberRegisterBasic {

    @Email(message = ">>> [ ❌ 유효하지 않은 이메일 형식입니다. ]")
    private final String email; // 로그인 아이디

    @NickName
    private final String nickName; // 닉네임

    @Password
    private final String password; // 로그인 비밀번호

}
