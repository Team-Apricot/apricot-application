package sandbox.apricot.member.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import sandbox.apricot.member.util.annotation.Password;

@Getter
@Builder
@RequiredArgsConstructor
public class UpdatePassword {

    @NotBlank
    private final String oldPassword;

    @Password
    private final String newPassword;

    public static UpdatePassword of(String oldPassword, String newPassword) {
        return UpdatePassword.builder()
                .oldPassword(oldPassword)
                .newPassword(newPassword)
                .build();
    }

}
