package sandbox.apricot.member.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import sandbox.apricot.member.dto.response.MemberInfo;
import sandbox.apricot.member.mapper.MemberMapper;

@ExtendWith(MockitoExtension.class)
class MemberServiceImplTest {

    @Mock
    private MemberMapper memberMapper;

    @InjectMocks
    private MemberServiceImpl memberService;

    private MemberInfo mockMemberInfo;

    @BeforeEach
    void setup() {
        mockMemberInfo = new MemberInfo(
                "test@example.com",
                "nickname",
                "20대",
                "남성",
                "직장인",
                "SINGLE",
                0,
                "USER_ROLE",
                List.of("일자리", "주거")
        );
    }

    @DisplayName("[Green] 회원 정보에 관심사 정보, 카테고리 정보를 조인하여 필요한 정보만 조회")
    @Test
    void getMemberInfoMethodTest() {
        // given
        when(memberMapper.findByIdWithInterests(anyLong())).thenReturn(mockMemberInfo);

        // when
        MemberInfo result = memberService.getMemberInfo(1L);

        // then
        assertThat(result.getEmail()).isEqualTo("test@example.com");
        assertThat(result.getNickName()).isEqualTo("nickname");
        assertThat(result.getAgeRange()).isEqualTo("20대");
        assertThat(result.getGender()).isEqualTo("남성");
        assertThat(result.getCareer()).isEqualTo("직장인");
        assertThat(result.getMarriedStatus()).isEqualTo("SINGLE");
        assertThat(result.getNumChild()).isEqualTo(0);
        assertThat(result.getMemberRole()).isEqualTo("USER_ROLE");
        assertThat(result.getInterests()).containsExactly("일자리", "주거");

        // verify: findByIdWithInterests 호출 확인
        verify(memberMapper, times(1)).findByIdWithInterests(1L);
    }
}