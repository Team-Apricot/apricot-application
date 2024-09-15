package sandbox.apricot.member.util.annotation;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import sandbox.apricot.member.util.validation.NickNameValidator;

@Constraint(validatedBy = NickNameValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
public @interface NickName {
    String message() default "닉네임 검증 실패";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
