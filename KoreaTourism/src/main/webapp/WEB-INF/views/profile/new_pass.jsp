<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script>
		var update = '${update}';
		if(update == 'success'){
			alert('비밀번호 변경 성공입니다~~');
		} else if (update == 'error'){
			alert('비밀번호 변경 실패 - 비밀번호가 틀렸습니다. 다시 적어주세요.');
			$('#userPass').focus();
		}
	</script>
	<title>비밀번호 재발급 - 한국관광</title>
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
	<jsp:include page="../include/header.jsp"/>
		<!-- end header -->
	<div class="skip_navi">
		<a href="#container">본문 바로 가기</a>
	</div>
	<div class="wrap" id="wrap">
		<!-- this in the profile_header -->
		<jsp:include page="../include/profileHeader.jsp" />
	<div id="container">
		<div class="title">
			<h2>비밀번호 변경
				<span><em>l</em> 비밀번호는 개인정보 보호를 위해 최소 3개월마다 주기적으로 변경해 주세요.</span>
			</h2>
		</div>
		<form action="update_InfoPass" method="post" id="UserUpdatePass">
			<div class="contents">
				<div class="content_wrap">
					<input type="hidden" name="m_confirm" value="Default_user">
					<input type="hidden" name="m_userid" value="${SessionUser}">
					<h3><strong>비밀번호 변경</strong>을 위해 아래 정보를 정확히 입력해 주세요.</h3>
					<dl class="info_basic clear_float">
						<dt><label for="userPass">현재 비밀번호</label></dt>
						<dd>
							<input type="password" id="userPass" name="m_password" class="type_02 valid" style="width:180px" min="6" maxlength="30">
						</dd>
						<dt><label for="userNewPass">새로운 비밀번호</label></dt>
						<dd>
							<input type="password" id="newPassword" name="userNewPass" class="type_02 valid" style="width:180px" min="6" maxlength="30">
						</dd>
						<dt><label for="userNewPassConfirm">새로운 비밀번호 확인</label></dt>
						<dd>
							<input type="password" id="newPasswordRe" name="userNewPassConfirm" class="type_02 valid" style="width:180px" min="6" maxlength="30">
						</dd>
					</dl>
					<div class="btn">
						<a onclick="update_newPass()" id="btnUpdatePass"><img src="resources/memberDesign/images/btn_ok.gif?_LM=1499327256000" alt="확인"></a>
					</div>
				</div>
				<p class="guide guide_change">
					<strong>안전한 비밀번호 사용 TIP</strong><br>
					비밀번호는 꼭 주기적으로 변경하기!<br>
					타 사이트와는 다른 아이디와 비밀번호를 사용하여 도용의 위험 낮추기!<br>
					아이디, 주민등록번호, 전화번호등 개인정보와 관련된 비밀번호 사용하지 않기!
				</p>
			</div>
		</form>
	</div>
</div>
<script>
	var pass = $('#newPassword');
	var passRe = $('#newPasswordRe');
	
	var jsonData = {
			"m_confirm" : "Default_user",
			"m_userid" : $('#updateNewPass_id').val(),
			"m_password" : pass
	};
	
	function update_newPass() {
		console.log(JSON.stringify(jsonData));
		if(pass.val() != passRe.val()){
			console.log('!=');
			alert('비밀번호를 동일하게 입력해주세요.');
			pass.val("");
			passRe.val("");
		} else {
			console.log('submit!');
			$('#UserUpdatePass').submit();
		}
	}
</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
