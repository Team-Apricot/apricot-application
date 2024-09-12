package sandbox.apricot.auth.service;

import static sandbox.apricot.member.exception.MemberErrorCode.MEMBER_NOT_FOUND;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import sandbox.apricot.auth.dto.MemberPrincipalDetails;
import sandbox.apricot.member.entity.Member;
import sandbox.apricot.member.exception.MemberBusinessException;
import sandbox.apricot.member.mapper.MemberMapper;

@Service
@RequiredArgsConstructor
public class MemberPrincipalDetailService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return new MemberPrincipalDetails(
                memberMapper.findByEmail(username)
                        .orElseThrow(() -> new MemberBusinessException(MEMBER_NOT_FOUND))
        );
    }

}
