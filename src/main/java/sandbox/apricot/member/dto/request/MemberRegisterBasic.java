package sandbox.apricot.member.dto.request;

import jakarta.validation.constraints.Email;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import sandbox.apricot.member.util.annotation.NickName;
import sandbox.apricot.member.util.annotation.Password;

@Getter
@Builder
@RequiredArgsConstructor
public class MemberRegisterBasic {

    @Email(message = ">>> [ ❌ 유효하지 않은 이메일 형식입니다. ]")
    private final String email;
    @NickName
    private final String nickName;
    @Password
    private final String password;

    public MemberRegisterBasic toService() {
        return this;
    }

}
