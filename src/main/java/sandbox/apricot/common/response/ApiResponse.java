package sandbox.apricot.common.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;
import org.springframework.http.HttpStatus;

/**
 * RestAPI 공통 Response 객체
 * @JsonInclude - 응답 데이터로 줄 때 null이 발생하는 것들은 응답 데이터로 던지지 못하게 설정
 */
@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {

    private final int code;
    private final String message;
    private final T data;
    private final LocalDateTime timestamp = LocalDateTime.now();

    @Builder
    private ApiResponse(final int code, final String message, final T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * API 요청 성공시, 응답 데이터로 사용할 successResponse 메서드
     *
     * @param httpStatus - HttpStatus Code
     * @param message - 응답 메세지
     * @param data - 던져줄 데이터
     */
    public static <T> ApiResponse<T> successResponse(
            final HttpStatus httpStatus,
            final String message,
            final T data
    ) {
        return ApiResponse.<T>builder()
                .code(httpStatus.value())
                .message(message)
                .data(data)
                .build();
    }
    public static <T> ApiResponse<T> successResponse(
            final HttpStatus httpStatus,
            final String message
    ) {
        return ApiResponse.<T>builder()
                .code(httpStatus.value())
                .message(message)
                .build();
    }

    /**
     * 요청 수행 중, 예외 발생시 응답 데이터로 사용할 errorResponse 메서드
     *
     * @param httpStatus - HttpStatus Code
     * @param message - 오류 메세지
     */
    public static <T> ApiResponse<T> errorResponse(
            final HttpStatus httpStatus,
            final String message
    ) {
        return ApiResponse.<T>builder()
                .code(httpStatus.value())
                .message(message)
                .build();
    }

    /**
     * 상태 코드(int)를 사용하는 errorResponse 메서드 추가
     *
     * @param code - 상태 코드
     * @param message - 오류 메시지
     */
    public static <T> ApiResponse<T> errorResponse(
            final int code,
            final String message
    ) {
        return ApiResponse.<T>builder()
                .code(code)
                .message(message)
                .build();
    }

}
