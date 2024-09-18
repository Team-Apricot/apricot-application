package sandbox.apricot.interest.vo;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "categoryId")
public class Category {

    private String categoryId; // 분야 고유 식별(PK)
    private String categoryName; // 분야 이름

    @Builder
    public Category(String categoryName) {
        this.categoryName = categoryName;
    }

}
