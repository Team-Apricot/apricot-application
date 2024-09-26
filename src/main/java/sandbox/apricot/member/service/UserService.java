package sandbox.apricot.member.service;

import sandbox.apricot.member.vo.Member;

public interface UserService {
    // 회원 등록 메서드
    void registerUser(Member memberLogin, String authCode, String userEnteredCode);

    // 비밀번호 업데이트 메서드
    void updatePassword(String email, String newPassword);
}
