package sandbox.apricot.member.dto.request;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MemberLogin {

    private String username;
    private String password;

    public static MemberLogin of(String email, String password) {
        return MemberLogin.builder()
                .username(email)
                .password(password)
                .build();
    }

}
