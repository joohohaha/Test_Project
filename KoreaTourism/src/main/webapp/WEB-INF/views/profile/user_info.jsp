<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 변경 - 한국관광</title>
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
			<h2>회원정보 변경
				<span><em>l</em> 개인정보 변경을 원하실 경우, 로그인이 꼭 필요합니다.</span>
			</h2>
		</div>
		<input type="hidden" id="targetUrl" value="#">
		
		<form id="frmUpdateInfo" action="info_update" method="POST">
			<div class="contents">
				<div class="content_wrap">
					<input type="hidden" name="m_confirm" value="Default_user">
					<dl class="info_basic modify_02 clear_float">
						<dt>아이디</dt>
						<dd><span class="id"><input type="text" class="type_02 valid" name="m_userid" value="${info.m_userid}" readonly></span></dd>
						<dt>이름</dt>
						<dd><span class="name"><input type="text" class="type_02 valid" name="m_name" value="${info.m_name}" readonly></span></dd>
						<dt><label for="userNewPassConfirm">이메일</label></dt>
						<dd>
							<input type="text" class="type_02 valid" id="userFrontEmail" style="width:105px" value="${fn:split(info.m_email,'@')[0]}" maxlength="30">
							@
							<input type="text" class="type_02 valid" id="userBackEmail" style="width:105px" value="${fn:split(info.m_email,'@')[1]}" maxlength="30">
							<input type="hidden" id="m_email" name="m_email">
							<select class="type_02 ignore" id="userEmailAddress" style="width:120px">
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
							<p class="help">입력하신 이메일은 아이디, 비밀번호 분실 시 찾기 위한 용도로 사용되오니 신중하게 입력해 주세요.</p>
							<p class="help_check"><input type="checkbox" id="checkUserSendEmail" class="ignore" ><label for="checkUserSendEmail">한국 관광의 서비스 소식, 이벤트 등 프로모션 안내 메일 받기</label></p>
						</dd>
						<dt><label for="userFrontSex">성별</label></dt>
						<dd class="last usersex" id="gender">
							<input type="radio" id="male" name="m_gender" value="male">
							<label for="man">남자</label>
							<input type="radio" id="female" name="m_gender"  value="female">
							<label for="woman">여자</label>
							<input type="radio" id="unknown" name="m_gender"  value="unknown">
							<label for="userSex">선택안함</label>
						</dd>
					</dl>
					<div class="btn">
						<a href="#" onclick="info_update()"><img src="resources/memberDesign/images/btn_save.gif?_LM=1499327256000" alt="저장"></a>
						<a href="#" id="btnReSet"><img src="resources/memberDesign/images/btn_reinput.gif?_LM=1499327256000" alt="다시 입력"></a>
					</div>
				</div>
			</div>
		</form>
	</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
<script>

	//성별 체크
	var m_gender = '${info.m_gender}';
	console.log(m_gender);
	if(m_gender == 'male') {
		$('#male').attr("checked", true);	
	} else if(m_gender == 'female'){
		$('#female').attr("checked", true);
	} else if(m_gender == 'unknown'){
		$('#unknown').attr("checked", true);
	}
	
	$(function(){	
		$(document).ready(function(){
			$('select[id="userEmailAddress"]').change(function() {
				if($(this).val()=="1"){
					$('#userBackEmail').val('');
				} else {
					$('#userBackEmail').val($(this).val());
					$('#userBackEmail').attr('readonly', true);
				}
			});
		});
	});

	function info_update(){
		var email1 = $('#userFrontEmail');
		var email2 = $('#userBackEmail');
		var resultEmail = email1.val() + '@' + email2.val();
		$('#m_email').val(resultEmail);
		if(email1.val() == '' || email2.val() == ''){
			alert('E-mail을 확인해주세요');
			email1.focus();
		} else {
			$('#frmUpdateInfo').submit();
		}
	}
</script>
</html>
