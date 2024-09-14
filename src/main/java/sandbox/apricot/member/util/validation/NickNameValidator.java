package sandbox.apricot.member.util.validation;

import static sandbox.apricot.member.util.exception.MemberErrorCode.NICKNAME_CONTAINS_SPECIAL_CHAR;
import static sandbox.apricot.member.util.exception.MemberErrorCode.NICKNAME_RANGE_VIOLATION;
import static sandbox.apricot.member.util.exception.MemberErrorCode.WRONG_NICKNAME;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;
import lombok.RequiredArgsConstructor;
import sandbox.apricot.member.util.annotation.NickName;

@RequiredArgsConstructor
public class NickNameValidator implements ConstraintValidator<NickName, String> {

    private final Pattern SPECIAL_CHAR_PATTERN = Pattern.compile(
            ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"|,.<>?].*");

    @Override
    public void initialize(NickName constraintAnnotation) {}

    @Override
    public boolean isValid(String nickName, ConstraintValidatorContext context) {
        int MIN_LENGTH = 2;
        int MAX_LENGTH = 10;
        boolean isLengthValid = nickName.length() >= MIN_LENGTH && nickName.length() <= MAX_LENGTH;
        boolean hasSpecialChar = SPECIAL_CHAR_PATTERN.matcher(nickName).matches();

        if (nickName.trim().isEmpty()) {
            context.buildConstraintViolationWithTemplate(WRONG_NICKNAME.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        if (nickName.contains(" ")) {
            context.buildConstraintViolationWithTemplate(WRONG_NICKNAME.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        if (!isLengthValid) {
            context.buildConstraintViolationWithTemplate(NICKNAME_RANGE_VIOLATION.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }


        if (hasSpecialChar) {
            context.buildConstraintViolationWithTemplate(NICKNAME_CONTAINS_SPECIAL_CHAR.getMessage())
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        return true;
    }
}
