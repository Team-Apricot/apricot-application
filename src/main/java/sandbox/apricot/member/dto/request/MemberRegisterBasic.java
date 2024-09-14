package sandbox.apricot.member.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MemberRegisterBasic {

    private final String email; // 로그인 아이디
    private final String nickName; // 닉네임
    private final String password; // 로그인 비밀번호

}
