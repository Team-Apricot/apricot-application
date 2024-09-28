package sandbox.apricot.auth.service;

import static sandbox.apricot.member.util.exception.MemberErrorCode.MEMBER_NOT_FOUND;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;
import sandbox.apricot.member.mapper.MemberMapper;

@Service
@RequiredArgsConstructor
public class MemberPrincipalDetailService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return new MemberPrincipalDetails(
                memberMapper.findByEmail(username)
                        .orElseThrow(() -> new UsernameNotFoundException("아이디 또는 비밀번호가 일치하지 않습니다."))
        );
    }

}
