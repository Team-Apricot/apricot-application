package sandbox.apricot.common.exception;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import sandbox.apricot.common.response.ApiResponse;

@Log4j2
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<String>> handleValidationExceptions(
            MethodArgumentNotValidException ex, WebRequest request) {

        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            if (error instanceof FieldError) {
                String fieldName = ((FieldError) error).getField();
                String errorMessage = error.getDefaultMessage();
                errors.put(fieldName, errorMessage);
            }
        });

        String errorMessages = errors.entrySet().stream()
                .map(entry -> String.format("Field: %s, Error: %s", entry.getKey(), entry.getValue()))
                .collect(Collectors.joining(", "));
        log.warn("Validation errors: [{}]", errorMessages);

        String combinedErrorMessage = String.join("; ", errors.values());

        ApiResponse<String> response = ApiResponse.errorResponse(
                HttpStatus.BAD_REQUEST,
                combinedErrorMessage
        );

        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

}
