package sandbox.apricot.interest.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class InterestRegister {

    @NotBlank(message = "분야(카테고리) 식별 정보가 필요 합니다.")
    private final String categoryId; // 분야 고유 식별(FK)

    @NotBlank(message = "우선 순위 정보가 필요 합니다.")
    private final int priority; // 우선 순위

    public InterestRegister(String categoryId, int priority) {
        this.categoryId = categoryId;
        this.priority = priority;
    }

}
