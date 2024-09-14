package sandbox.apricot.member.exception;

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

    MEMBER_NOT_FOUND(NOT_FOUND, ">>> [ ❌ 존재하지 않는 회원 입니다. ]"),
    UNAUTHORIZED_TO_MEMBER(FORBIDDEN, ">>> [ ❌ 권한이 없는 회원 입니다. ]"),
    WRONG_PASSWORD(BAD_REQUEST, ">>> [ ❌ 비밀번호를 다시 확인해 주세요. ]");

    private final HttpStatus httpStatus;

    private final String message;

}