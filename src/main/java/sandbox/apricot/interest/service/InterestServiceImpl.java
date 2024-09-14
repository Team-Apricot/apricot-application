package sandbox.apricot.interest.service;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.interest.dto.request.InterestRegister;
import sandbox.apricot.interest.entity.Interest;
import sandbox.apricot.interest.mapper.InterestMapper;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class InterestServiceImpl implements InterestService {

    private final InterestMapper interestMapper;

    @Override
    public void register(List<InterestRegister> request, Long memberId) {
        log.info(" >>> [ ✨ 관심사 등록을 시도 합니다. ]");
        for(InterestRegister category : request) {
            Interest interest = Interest.builder()
                    .memberId(memberId)
                    .categoryId(category.getCategoryId())
                    .priority(category.getPriority())
                    .build();
            interestMapper.insertInterest(interest);
        }
        log.info(" >>> [ ✨ \"{}\" 회원의 관심사 등록을 완료 하였습니다. ] ", memberId);
    }

}
