package sandbox.apricot.member.validation;

import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import jakarta.validation.ConstraintViolation;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;

import java.util.Set;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import sandbox.apricot.member.util.annotation.Password;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 비밀번호 검증 테스트
 * ❌ 비밀번호는 8자 이상, 20자 이하이어야 하며, 대문자, 소문자, 숫자, 특수 문자를 포함해야 합니다.
 */
public class PasswordValidatorTest {

    private Validator validator;

    @BeforeEach
    public void setup() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            validator = factory.getValidator();
        }
    }

    private static class User {
        @Password
        private String password;

        public User(String password) {
            this.password = password;
        }
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "Sh1@",          // 너무 짧은 비밀번호 (7자)
            "ValidPassword123456789!@#$", // 너무 긴 비밀번호 (21자)
            "short1@password",   // 대문자 없음
            "Valid12345"     // 특수 문자 없음
    })
    @DisplayName("[Red] 경계값 테스트: 7자리, 21자리, 대문자 없음, 특수문자 없음 - 유효하지 않은 비밀번호를 입력하면 통과할 수 없다.")
    public void 유효하지_않은_비밀번호_입력(String invalidPassword) {
        // given
        User user = new User(invalidPassword);

        // when
        Set<ConstraintViolation<User>> violations = validator.validate(user);

        // then
        assertThat(violations).isNotEmpty();
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ShorT12@",       // 최소 길이 비밀번호 (8자)
            "Valid1@Passw0rd123!"  // 최대 길이 비밀번호 (20자)
    })
    @DisplayName("[Green] 경계값 테스트: 최소 길이 8자리 & 최대 길이 20자리 - 유효한 비밀번호는 통과한다.")
    public void 유효한_비밀번호_입력(String validPassword) {
        // given
        User user = new User(validPassword);

        // when
        Set<ConstraintViolation<User>> violations = validator.validate(user);

        // then
        assertThat(violations).isEmpty();
    }

}
