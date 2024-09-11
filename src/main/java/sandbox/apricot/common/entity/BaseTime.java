package sandbox.apricot.common.entity;

import java.time.LocalDateTime;
import lombok.Getter;

@Getter
public class BaseTime {

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime deletedAt;

}
