package sandbox.apricot.interest.service;

import static sandbox.apricot.interest.util.exception.InterestErrorCode.*;

import java.util.stream.IntStream;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sandbox.apricot.interest.dto.request.InterestRegister;
import sandbox.apricot.interest.vo.Interest;
import sandbox.apricot.interest.mapper.CategoryMapper;
import sandbox.apricot.interest.mapper.InterestMapper;
import sandbox.apricot.interest.util.exception.InterestBusinessException;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class InterestServiceImpl implements InterestService {

    private final InterestMapper interestMapper;
    private final CategoryMapper categoryMapper;

    @Override
    public void register(InterestRegister request) {
        Long memberId = request.getMemberId();
        log.info(" >>> [ ✨ 관심사 등록을 시도합니다. 회원 ID: {} ]", memberId);

        IntStream.range(0, request.getCategoryInfo().size())
                .forEach(index -> {
                    String categoryId = request.getCategoryInfo().get(index);
                    validateCategory(categoryId);
                    interestMapper.save(toVO(memberId, categoryId, index + 1));
                });

        log.info(" >>> [ ✨ 회원 ID: {} 의 관심사 등록을 완료 하였습니다. ]", memberId);
    }

    private void validateCategory(String categoryId) {
        if (categoryMapper.findById(categoryId).isEmpty()) {
            throw new InterestBusinessException(CATEGORY_NOT_FOUND);
        }
    }

    private Interest toVO(Long memberId, String categoryId, int priority) {
        return Interest.builder()
                .memberId(memberId)
                .categoryId(categoryId)
                .priority(priority)
                .build();
    }

}
