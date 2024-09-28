package sandbox.apricot.member.util.exception;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.FORBIDDEN;
import static org.springframework.http.HttpStatus.NOT_FOUND;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import sandbox.apricot.common.exception.ErrorCode;

@RequiredArgsConstructor
@Getter
public enum MemberErrorCode implements ErrorCode {

    MEMBER_NOT_FOUND(NOT_FOUND, "존재하지 않는 회원 입니다."),
    UNAUTHORIZED_TO_MEMBER(FORBIDDEN, "권한이 없는 회원 입니다."),
    REGISTER_INFO_NOT_FOUND(NOT_FOUND,"세션에 기본 정보가 없습니다. 회원가입을 다시 진행해주세요."),

    WRONG_PASSWORD(BAD_REQUEST, "비밀번호를 다시 확인해 주세요."),
    PASSWORD_CONDITIONS_VIOLATION(BAD_REQUEST, "비밀번호는 8자 이상, 20자 이하이어야 하며, 대문자, 소문자, 숫자, 특수 문자를 포함해야 합니다."),

    EMAIL_DUPLICATE(BAD_REQUEST, "이미 사용 중인 이메일입니다."),
    INVALID_EMAIL_FORMAT(BAD_REQUEST, "유효하지 않은 이메일 형식입니다."),

    WRONG_NICKNAME(BAD_REQUEST, "닉네임을 다시 확인해 주세요."),
    NICKNAME_DUPLICATE(BAD_REQUEST, "이미 사용 중인 닉네임입니다."),
    NICKNAME_RANGE_VIOLATION(BAD_REQUEST, "닉네임은 2자 이상, 10자 미만이어야 합니다."),
    NICKNAME_CONTAINS_SPECIAL_CHAR(BAD_REQUEST, "닉네임에 특수문자를 포함할 수 없습니다."),
    AUTHENTICATION_CODE_DOES_NOT_MATCH(BAD_REQUEST,"인증코드가 일치하지 않습니다.");

    private final HttpStatus httpStatus;
    private final String message;
}
