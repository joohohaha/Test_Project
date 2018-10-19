<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- --------여기는 관광지를 지역별로 뿌리는부분 ---------------------------------------------------------- -->
<div class="portfolio-modal modal fade" id="find_userid" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
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
							<form action="#" id="frmFindIdByEmail" name="email" method="post">
								<div class="box box _left">
									<div class="id_email">
										<span class="blind">메일</span>
									</div>
									<h3>
										<strong>이메일 주소</strong>로 아이디 찾기
									</h3>
									<dl>
										<dt>
											<label for="certEmailName">이름</label>
										</dt>
										<dd>
											<input type="text" id="certEmailName" name="userName" class="type_01 email_valid" style="width: 307px" maxlength="30" required>
											<p class="help">한글/영문으로 입력해 주세요.</p>
										</dd>
										<dt>
											<label for="userFrontEmail">이메일</label>
										</dt>
										<dd>
											<input type="text" id="userFrontEmail" name="userFrontEmail" class="type_01 email_valid" style="width: 80px" title="이메일 아이디 입력"> @ 
											<input type="text" id="userBackEmail" name="userBackEmail" class="type_01 email_valid" style="width: 80px" title="이메일 도메인 입력" required> 
											<select class="type_01" id="certEmailAddress" title="이메일 도메인 선텍" style="width: 105px">
												<option value="1" selected>직접입력</option>
												<option value="chol.com">chol.com</option>
												<option value="daum.net">daum.net</option>
												<option value="dreamwiz.com">dreamwiz.com</option>
												<option value="empal.com">empal.com</option>
												<option value="freechal.com<">freechal.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanafos.com">hanafos.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="hanmir.com">hanmir.com</option>
												<option value="hitel.net">hitel.net</option>
												<option value="korea.com">korea.com</option>
												<option value="lycos.co.kr">lycos.co.kr</option>
												<option value="nate.com">nate.com</option>
												<option value="naver.com">naver.com</option>
												<option value="netian.com">netian.com</option>
												<option value="paran.com">paran.com</option>
											</select>
											<p class="help">가입 시 기재한 이메일을 입력해 주세요.</p>
										</dd>
									</dl>
									<div class="btn">
										<a href="#" onclick="search_myID()" id="btnFindIdByCertEmail">
										<img src="resources/memberDesign/images/btn_idfind.gif?_LM=1499327256000" alt="아이디 찾기">
									</a>
									</div>
								</div>
							</form>
						</div>
						<p class="guide">
						위의 방법으로 아이디 찾을 수 없을 경우 별도 확인이 불가능하오니, <br>
						새로운 아이디로 가입하여 주시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function search_myID() {
		var email1 = $('#userFrontEmail'), email2 =  $('#userBackEmail'), m_name = $('#certEmailName');
		var resultEmail = email1.val() + '@' + email2.val();
		
		var jsonData = {
				"m_name" : m_name.val(),
				"m_email" : resultEmail,
				"m_confirm" : "Default_user"
		};
		
		console.log('name : ' + m_name.val() + ', email1 : ' + email1.val() + ', email2 : ' + email2.val() + ", resultEmail : " + resultEmail);
		
		if(m_name.val() == '' || email1 == '' || email2 == ''){
			alert('정확한 정보를 입력해주세요');
		} else {
			m_name.val('');m_name.focus();email1.val('');email2.val('');
			fetch('find_id', {method : 'POST', body : JSON.stringify(jsonData)}).then(res => res.text()).then(function(data) {
				if(data == 'Not_Found'){
   					alert('입력하신 정보로 조회된 ID가 없습니다. 다시한번 입력해 주십시오.');
   				} else {
   					if(confirm('회원님의 아이디는 ' + data + ' 입니다.\n 로그인 창으로 이동하시겠습니까?') == true){
   						$('#find_userid').modal('hide');
   						$('#loginModal').modal();
   					}
   				}
			});
		}
	}
	
	$(function(){	
		$(document).ready(function(){
			$('select[id=certEmailAddress]').change(function() {
				if($(this).val() == '1'){
					email2.val('');
				} else {
					email2.val($(this).val());
					email2.attr("readonly", true);
				}
			});
		});
	});
</script>