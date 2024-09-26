package sandbox.apricot.scrap.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class ScrapDelete {

    private Long ScrapId;
}
