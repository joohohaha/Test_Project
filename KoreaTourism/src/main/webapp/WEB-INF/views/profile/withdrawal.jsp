<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 - 한국관광</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!-- this in the linkFile -->
<jsp:include page="../include/mainLink.jsp" />
   	<!-- Profile styles for this template -->
	<link href="resources/memberDesign/css/member.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
	<link rel="stylesheet" href="resources/footer/custom.css">
<link href="/favicon.ico?v=2" rel="shortcut icon">
</head>
<body id="layout_body">

		<!-- this in the header -->
	<jsp:include page="../include/header.jsp" />

	<div class="skip_navi">
		<a href="#container">본문 바로 가기</a>
	</div>

	<div class="wrap" id="wrap">
		<!-- this in the profile_header -->
		<jsp:include page="../include/profileHeader.jsp" />

		<div id="container">
			<div class="title">
				<h2>
					회원 탈퇴 <span><em>l</em> 회원 탈퇴를 위해 아래 내용을 확인해 주세요.</span>
				</h2>
			</div>
			<form id="frmLeaveUser" method="POST">
				<div class="contents">
					<div class="section">
						<h3>
							1. <strong>회원 서비스 이용 불가능</strong>
						</h3>
						<p>회원 탈퇴를 하시면 줌의 회원 서비스를 더 이상 이용하실 수 없습니다.</p>
					</div>
					<div class="section">
						<h3>
							2. <strong>해당 아이디로 재가입 불가</strong>
						</h3>
						<p>
							회원탈퇴를 신청하시면 해당 아이디는 <strong>즉시 탈퇴 처리</strong> 되며, <strong>해당
								아이디는 영구적으로 사용이 중지</strong>되므로 해당 아이디로는 회원가입이 불가능 합니다.<br> 이는 가입과 탈퇴의
							반복을 막고, 선량한 이용자들에게 피해를 끼치는 행위를 방지하기 위한 조치이오니 양해 바랍니다.
						</p>
					</div>
					<div class="section">
						<h3>
							3. <strong>회원정보 및 회원제 서비스의 정보 삭제</strong>
						</h3>
						<p>
							회원 탈퇴 시 회원 계정에 속한 <strong>개인정보는 즉시 삭제됩니다.</strong><br> 제휴사에서
							제공하는 서비스에서 결제한 <strong>유료 아이템, 캐시 등의 유료 콘텐츠 또한 회원 탈퇴와 함께
								즉시 삭제됩니다.</strong><br> 유료 콘텐츠의 환불 등을 원하시는 경우 <strong>회원 탈퇴
								전에 관련 처리를 진행해야 하며, 자세한 내용은 제휴사의 서비스 약관에 따릅니다.</strong>
						</p>
					</div>
					<div class="section">
						<h3>
							4. <strong>불량이용 및 이용제한에 관한 기록 1년 동안 보관</strong>
						</h3>
						<p>개인정보취급방침에 따라 불량회원 및 이용제한에 관한 기록은 1년 동안 삭제되지 않고 보관됩니다.</p>
					</div>
					<div class="withdraw_check">
						<p>
							<input type="checkbox" id="checkCashAgree">
							<label for="checkCashAgree">사용자의 모든 정보 삭제에 동의합니다.(필수)</label>
						</p>
						<p>
							<input type="checkbox" id="checkLeaveAgree">
							<label for="checkLeaveAgree">전체 내용을 확인하였습니다.(필수)</label>
						</p>
					</div>
					<div class="content_wrap">
						<dl class="info_basic modify_03 clear_float">
							<dt>아이디</dt>
							<dd><span class="id">${SessionUser}</span></dd>
							<dt><label for="userPass">비밀번호</label></dt>
							<dd><input type="password" id="userPass" class="type_02 valid" style="width: 180px" maxlength="30"></dd>
						</dl>
						<div class="btn">
							<button type="button" onclick="update_withdrawal()" style="background:transparent;border: 0px;" onkeyup="enterkey();">
								<img src="resources/memberDesign/images/btn_withdraw.gif?_LM=1499327256000" alt="회원탈퇴">
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<script>
	//왜 안먹냐... enter 
	function enterkey() {
	    if (window.event.keyCode == 13) {
	         update_withdrawal();
	    }
	}
	function update_withdrawal(){
		var jsonData = {
				"m_password" : $('#userPass').val(),
				"m_userid" : '${SessionUser}',
				"m_confirm" : "Default_user"
		};
		if($("input:checkbox[id='checkCashAgree']").is(":checked") != true){
			alert('위 항목을 모두 체크해주십시요');
		} else if($("input:checkbox[id='checkLeaveAgree']").is(":checked") == false){
			alert('위 항목을 모두 체크해주십시요');
		} else if($('#userPass').val() == ''){
			alert('비밀번호를 입력해주세요');
		} else {
			if(confirm('정말 회원탈퇴를 원하십니까?') == true) {
				fetch('update_withdrawal', {method : 'POST', body : JSON.stringify(jsonData)}).then(res => res.text()).then(function(data) {
					if(data == 'Not_Found') {
						alert('입력하신 비밀번호가 틀렸습니다.');
						$('#userPass').val("");
						$('#userPass').focus();
					} else if(data == 'success') {
						alert('회원탈퇴에 성공하였습니다.');
						location.href='logout';
					}
				});
			}
		}
	}
	
	function frm_submit() {
		if($('#userPass').val() == ''){
			alert('비밀번호를 입력하세요!!!!!!!!!!');
			return false;
		} else {
			return true;
		}
	}
</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
