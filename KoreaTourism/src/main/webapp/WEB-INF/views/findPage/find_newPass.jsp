<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- --------여기는 관광지를 지역별로 뿌리는부분 ---------------------------------------------------------- -->
<div class="portfolio-modal modal fade" id="find_newPass" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="skip_navigation blind">
				<a href="#container">본문 바로가기</a>
			</div>
			<div id="wrap">
				<div id="header">
					<div class="close-modal" data-dismiss="modal">
						<div class="lr">
							<div class="rl"></div>
						</div>
					</div>
				</div>
				<div id="container">
					<div class="contents">
						<div class="box_outer clear_float">
							<form action="#" id="updateNewPass" method="POST">
								<div class="box box _left">
									<input type="hidden" name="m_confirm" value="Default_user">
									<input type="hidden" id="updateNewPass_id" name="m_userid">
									<div class="id_email">	
										<span class="blind"></span>
									</div>
									<h3>
										<strong>비밀번호</strong>재설정 하기
									</h3>
									<dl>
										<dt>
											<label for="newPassword">비밀번호</label>
										</dt>
										<dd>
											<input type="password" id="newPassword" name="m_password" class="type_01 email_valid" style="width: 307px" min="6" maxlength="12" required>
											<p class="help">6~12자의 영문 소문자와 숫자를 사용해주세요</p>
										</dd>
										<dt>
											<label for="newPasswordRe">비밀번호 재확인</label>
										</dt>
										<dd>
											<input type="password" id="newPasswordRe" class="type_01 email_valid" style="width: 307px" min="6" maxlength="12" required>
										</dd>
									</dl>
									<div class="btn">
										<a href="#" onclick="update_newPass()">
											<img src="resources/img/find_newPass.png" alt="비밀번호 재설정">
										</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function update_newPass() {
		var pass = $('#newPassword');
		var passRe = $('#newPasswordRe');
		
		var jsonData = {
				"m_confirm" : "Default_user",
				"m_userid" : $('#updateNewPass_id').val(),
				"m_password" : pass.val()
		};
		console.log('새 비밀번호 send Data : ' + JSON.stringify(jsonData));
		if(pass.val() != passRe.val()){
			alert('비밀번호를 동일하게 입력해주세요.');
			passRe.focus();
		} else {
			fetch('update_newPass', {method : 'POST', body : JSON.stringify(jsonData)}).then(res => res.text()).then(function(data) {
				pass.val('');
				passRe.val('');
   				if(data == 'error'){
   					alert('비밀번호 변경 실패.');
   				} else if(data =='success') {
   					if(confirm('비밀번호 변경을 성공했습니다. 로그인 창으로 이동하시겠습니까?') == true) {
   						$('#find_newPass').modal('hide');
   						$('#loginModal').modal();
   					} else {
   						$('#find_newPass').modal('hide');
   					}
   				}
			});
		}
	}
</script>