package sandbox.apricot.interest.util.exception;

import static org.springframework.http.HttpStatus.NOT_FOUND;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import sandbox.apricot.common.exception.ErrorCode;

@RequiredArgsConstructor
@Getter
public enum InterestErrorCode implements ErrorCode {

    CATEGORY_NOT_FOUND(NOT_FOUND, ">>> [ ❌ 존재하지 않는 카테고리 입니다. ]");

    private final HttpStatus httpStatus;

    private final String message;

}