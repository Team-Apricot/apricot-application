package sandbox.apricot.member.validation;

import static org.assertj.core.api.Assertions.assertThat;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import java.util.Set;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import sandbox.apricot.member.util.annotation.NickName;

/**
 * 닉네임 검증 테스트
 * ❌ 닉네임은 2자 이상, 10자 미만이어야 합니다.
 */
public class NickNameValidatorTest {

    private Validator validator;

    @BeforeEach
    public void setup() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            validator = factory.getValidator();
        }
    }

    private static class User {
        @NickName
        private String nickname;

        public User(String nickname) {
            this.nickname = nickname;
        }
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "a",          // 너무 짧은 닉네임 (1자)
            "abcdefghijklmnopqrstuvwx",  // 너무 긴 닉네임 (11자)
            "nick@name",   // 특수 문자가 포함된 닉네임
            "nick name",   // 공백이 포함된 닉네임
    })
    @DisplayName("[Red] 경계값 테스트: 너무 짧거나 긴 닉네임, 특수 문자 및 공백 포함 - 유효하지 않은 닉네임을 입력하면 통과할 수 없다.")
    public void 유효하지_않은_닉네임_입력(String invalidNickname) {
        // given
        User user = new User(invalidNickname);

        // when
        Set<ConstraintViolation<User>> violations = validator.validate(user);

        // then
        assertThat(violations).isNotEmpty();
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ni",        // 유효한 닉네임 (2자)
            "nickName10",        // 유효한 닉네임 (10자)
            "English", // 유효한 영어 닉네임
            "한글닉네임",    // 유효한 한글 닉네임
    })
    @DisplayName("[Green] 경계값 테스트: 유효한 닉네임은 통과한다.")
    public void 유효한_닉네임_입력(String validNickname) {
        // given
        User user = new User(validNickname);

        // when
        Set<ConstraintViolation<User>> violations = validator.validate(user);

        // then
        assertThat(violations).isEmpty();
    }
}