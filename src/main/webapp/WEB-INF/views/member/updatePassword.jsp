<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="updatePassword-modal">
	<div class="close">
		<button class="close-btn" onclick="closeUpdatePwModal()">&times;</button>
	</div>
	<div class="logo ">
		<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="살구 Logo">
	</div>
	
	<div class="modal-content">
		<form class="update-password-form" action="${pageContext.request.contextPath}/member/login" method="post">
			<label for="curPassword">현재 비밀번호 </label>
			<input type="password" id="curPassword" name="password" placeholder="새 비밀번호">
			
			<label for="newPassword">새 비밀번호 </label>
			<input type="password" id="newPassword" name="password" placeholder="새 비밀번호">
			
			<label for="newPwdChk">새 비밀번호 확인 </label>
			<input type="password" id="newPwdChk" name="password" placeholder="새 비밀번호 확인">
			
			<button type="submit" class="updatePw-btn">비밀번호 수정</button>
		</form>
	</div>
</div>