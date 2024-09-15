package sandbox.apricot.member.util.validation;

import static sandbox.apricot.member.util.exception.MemberErrorCode.*;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import lombok.RequiredArgsConstructor;
import sandbox.apricot.member.util.annotation.Password;

import java.util.regex.Pattern;

@RequiredArgsConstructor
public class PasswordValidator implements ConstraintValidator<Password, String> {

    private static final int MIN_LENGTH = 8;
    private static final int MAX_LENGTH = 20;
    private static final Pattern UPPERCASE_PATTERN = Pattern.compile(".*[A-Z].*");
    private static final Pattern LOWERCASE_PATTERN = Pattern.compile(".*[a-z].*");
    private static final Pattern DIGIT_PATTERN = Pattern.compile(".*\\d.*");
    private static final Pattern SPECIAL_CHAR_PATTERN = Pattern.compile(
            ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"|,.<>?].*");

    @Override
    public void initialize(Password constraintAnnotation) {
    }

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        boolean isLengthValid = password.length() >= MIN_LENGTH && password.length() <= MAX_LENGTH;
        boolean hasUppercase = UPPERCASE_PATTERN.matcher(password).find();
        boolean hasLowercase = LOWERCASE_PATTERN.matcher(password).find();
        boolean hasDigit = DIGIT_PATTERN.matcher(password).find();
        boolean hasSpecialChar = SPECIAL_CHAR_PATTERN.matcher(password).find();

        if (password.trim().isEmpty()) {
            context.buildConstraintViolationWithTemplate(WRONG_PASSWORD.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        if (!isLengthValid || !hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
            context.buildConstraintViolationWithTemplate(PASSWORD_CONDITIONS_VIOLATION.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        return true;
    }
}
