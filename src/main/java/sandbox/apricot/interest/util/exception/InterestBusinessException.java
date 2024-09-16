package sandbox.apricot.interest.util.exception;

import lombok.Getter;

@Getter
public class InterestBusinessException extends RuntimeException {

    private final InterestErrorCode interestErrorCode;

    public InterestBusinessException(InterestErrorCode interestErrorCode) {
        super(interestErrorCode.getMessage());
        this.interestErrorCode = interestErrorCode;
    }

}
