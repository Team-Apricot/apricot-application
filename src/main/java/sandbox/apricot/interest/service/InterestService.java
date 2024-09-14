package sandbox.apricot.interest.service;

import java.util.List;
import sandbox.apricot.interest.dto.request.InterestRegister;

public interface InterestService {

    void register(List<InterestRegister> request, Long memberId);

}
