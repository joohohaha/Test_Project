<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원가입 페이지</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="resources/memberDesign/css/join_n.css?_LM=1537334942000">
	<title>회원가입</title>
</head>
<body id="join">
	<div class="skip_navi">
		<a href="#container">본문 바로 가기</a>
	</div>
	<div class="wrap" id="wrap">
		<div id="header">
			<h1>
				<a href="index" class="logo">
					<img src="resources/img/travel.png" height="80px">
				</a>
			</h1>
		</div>
		<div id="container">
			<div class="title"></div>
			<form id="frmInJoin" method="POST" novalidate="novalidate"><!-- onsubmit="return false"  -->
				<input type="hidden" name="m_confirm" value="Default_User">
				<div class="join_step_2">
					<div class="step_header">
						<h2>가입 정보 입력하기</h2>
						<div class="icon_step">
							<span class="on"></span> <span></span>
						</div>
					</div>
					<div class="box_info_write">
						<dl class="write_input">
							<dt class="info_id">
								<label class="title" for="inputInfoID">아이디</label>
							</dt>
							<dd>
								<span class="text_box"><!-- on : 활성화 -->
								<input type="text" id="inputInfoID" class="input_text valid mustValid" maxlength="12" name="userId">
									<span class="help_text">6-12자의 영문 소문자와 숫자</span>
									<span class="icon_noti">
										<span class="icon_confirmed" style="display: none;"></span>
										<span class="icon_alert" style="display: none;"></span>
									</span>
								</span>
								<div class="text_alert" style="display: none;">
									<p>6~12자의 영문 소문자와 숫자를 사용해주세요</p>
								</div>
							</dd>
							<dt class="info_pw">
								<label class="title" for="inputInfoPassword">비밀번호</label>
							</dt>
							<dd>
								<span class="text_box">
									<input type="password" id="inputInfoPassword" class="input_text valid mustValid" name="userPass">
									<span class="help_text">8자 이상, 대/소문자, 숫자, 특수문자</span>
									<span class="icon_noti">
										<span class="icon_confirmed" style="display: none;"></span>
										<span class="icon_alert" style="display: none;"></span>
									</span>
								</span>
								<div class="text_alert" style="display: none;">
									<p>8자 이상의 대·소문자, 숫자, 특수문자의 조합을 사용하세요</p>
								</div>
							</dd>
							<dt class="info_pw_r">
								<label class="title" for="inputInfoPasswordRe">비밀번호 재확인</label> 
							</dt>
							<dd>
								<span class="text_box"><!-- warning : 입력 사항에 문제 있음 -->
									<input type="password" id="inputInfoPasswordRe" class="input_text valid mustValid" name="userPassConfirm">
									<span class="help_text">비밀번호를 한번 더 입력해주세요.</span>
									<span class="icon_noti">
										<span class="icon_confirmed" style="display: none;"></span>
										<span class="icon_alert" style="display: none;"></span>
									</span>
								</span>
								<div class="text_alert" style="display: none;">
									<p>비밀번호와 동일하게 입력하세요</p>
								</div>
							</dd>
						</dl>
					</div>
					<div class="box_info_write">
						<dl class="write_input">
							<dt class="info_name">
								<label class="title" for="inputInfoName">이름</label>
							</dt>
							<dd>
								<span class="text_box">
									<input type="text" id="inputInfoName" class="input_text valid mustValid" name="userName">
									<span class="help_text">이름을 적어주세요.</span>
								</span>
								<span class="icon_noti">
									<span class="icon_confirmed" style="display: none;"></span>
									<span class="icon_alert" style="display: none;"></span>
								</span>
								<div class="text_alert" style="display: none;">
									<p>한글 1~16자, 영문 대·소문자 2~30자 가능합니다</p>
								</div>
							</dd>
							<dt class="info_birth">
								<label class="title" for="inputInfoBirthYear">생년월일</label>
							</dt>
							<dd>
								<div class="select_birthdate">
									<span class="select_year">
										<!-- on : 활성화 -->
										<select class="valid" id="inputInfoBirthYear" name="birthYear">
											<option selected>년</option>
											<c:set var="year" value="2018" />
											<c:forEach begin="1900" end="2018">
												<option>${year}</option>
												<c:set var="year" value="${year = year - 1}" />
											</c:forEach>
									</select>
									</span> <span class="select_month"> <select class="valid"
										id="inputInfoBirthMonth" name="birthMonth">
											<option selected>월</option>
											<c:forEach var="month" begin="1" end="12" step="1">
												<option>${month}</option>
											</c:forEach>
									</select>
									</span>
									<span class="select_day">
									<select class="valid mustValid" id="inputInfoBirthDay" name="birthDate">
										<option selected>일</option>
										<c:forEach var="day" begin="1" end="30" step="1">
											<option>${day}</option>
										</c:forEach>
									</select>
									</span>
								</div>
								<div class="text_alert" style="display: none;">
									<p>만 14세 미만으로 보호자 인증이 필요합니다</p>
								</div>
							</dd>
							<dt class="info_gender">
								<span class="title">성별</span>
							</dt>
							<dd>
								<div class="check_gender" id="gender">
									<span> <!-- selected : 체크됨 -->
										<input type="radio" name="inputInfoGender" id="inputInfoGenderWomen" value="female">
										<label for="inputInfoGenderWomen">
											<span class="icon"><b></b></span>여자
										</label>
									</span>
									<span>
										<input type="radio" name="inputInfoGender" id="inputInfoGenderMen" value="male">
										<label for="inputInfoGenderMen">
											<span class="icon"><b></b></span>남자
										</label>
									</span>
									<span class="selected">
										<input type="radio" name="inputInfoGender" id="inputInfoGenderNone" value="unknown">
										<label for="inputInfoGenderNone"><span class="icon"><b></b></span>선택안함</label>
									</span>
								</div>
							</dd>
							<dt class="info_email">
								<label class="title" for="inputInfoEmail">이메일</label>
								
							</dt>
							<dd>
								<span class="text_box">
									<input type="text" id="inputInfoEmail" class="input_text valid mustValid" name="email">
									<span class="help_text">이메일 주소를 입력하세요</span>
									<span class="icon_noti">
										<span class="icon_confirmed" style="display: none;"></span>
										<span class="icon_alert" style="display: none;"></span>
									</span>
								</span>
								<div class="text_alert" style="display: none;">
									<p>이메일 형식이 잘못되었습니다</p>
								</div>
							</dd>
						</dl>
					</div>
					<div class="box_user_certification">
						<ul class="cert_option">
							<li>
								<div class="option_radio" id="emailRadio">
									<input type="radio" name="radioCertOption" id="certOptionEmail">
									<label for="certOptionEmail">
										<span class="icon"><b></b></span><strong>이메일</strong>로 인증하기
									</label>
								</div>
								<div class="option_cont">
									<div class="input_email on">
										<!-- on : 활성화 -->
										<span class="text_box text_complete">
											<!-- text_complete : 이메일 주소 자동완성 -->
											<label for="inputEmail">이메일 주소</label>
											<input type="text" id="inputEmail" readonly>
										<!-- readonly : 자동완성 시에만 붙을 것 -->

										</span>
										<button type="button">인증</button>
									</div>
									<div class="input_cert" id="emailConfirm"
										style="display: none">
										<!-- on : 활성화 -->
										<span class="text_box">
											<label for="inputCertNumberEmail">인증번호</label>
											<input type="tel" id="inputCertNumberEmail" maxlength="6">
										</span>
										<button type="button">확인</button>
									</div>
									<div class="text_alert" id="emailAuthTimeLimit" style="display: none;">
										<p>
											남은 시간 <span id="timer">05:00</span>
										</p>
									</div>
									<div class="text_alert" id="emailAuthComplete" style="display: none;">
										<p>인증이 완료되었습니다.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="btn_bottom">
						<button type="button" class="btn_submit" id="btnMain">가입취소</button>
						<button type="submit" class="btn_submit" id="btnNext">가입하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script async="" src="//www.google-analytics.com/analytics.js"></script>
	<script type="text/javascript" async="" src="//estat.zum.com/scripts/at.js"></script>
	<script type="text/javascript" src="resources/memberDesign/js/plugin/jquery-1.8.2.min.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/plugin/jquery.validate.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/rsa/jsbn.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/rsa/rsa.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/rsa/prng4.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/rsa/rng.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/checkpass.min.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/plugin/jquery.cookie.js?_LM=1499327254000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/member.common.js?_LM=1512698956000"></script>
	<script type="text/javascript" src="resources/memberDesign/js/join/member.join.form.js?_LM=1530147020000"></script>
	<script type="text/javascript">
	$(function() {
		$('#frmInJoin').validate().settings.messages = {
			'userId' : {
				'required' : '아이디를 입력해 주시기 바랍니다.',	
				'userId' : '6~12자의 영문 소문자와 숫자를 사용해주세요.',
				'whitespace' : '공백문자는 입력할 수 없습니다.',
				'userIdOverlap' : '현재 사용중인 아이디입니다.'
			},
			'userPass' : {
				'required' : '비밀번호를 입력해주십시오.',
				'combination' : '8자 이상의 대·소문자, 숫자, 특수문자의 조합을 사용하세요.',
				'sequence' : '연속된 숫자나 문자를 4자 이상 사용할 수 없습니다.',
				'same' : '동일한 문자를 연속으로 4자 이상 사용할 수 없습니다.',
				'equalToId' : '비밀번호는 ID와 동일하게 사용할 수 없습니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'userPassConfirm' : {
				'required' : '비밀번호를 한번 더 입력해주십시오.',	
				'whitespace' : '공백문자는 입력할 수 없습니다.',
				'equalToPass' : '비밀번호와 동일하게 입력하세요.'
			},
			'userName' : {
				'required' : '이름을 입력해 주시기 바랍니다.',	
				'userName' : '한글 1~16자, 영문 대·소문자 2~30자 가능합니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'email' : {
				'required' : '이메일을 입력해 주시기 바랍니다.',	
				'userEmail' : '이메일 형식이 잘못되었습니다',
				'userEmailOverlap' : '현재 사용중인 이메일입니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'birthYear' : {
				'required' : '생년월일을 입력해 주세요',
				'checkDate' : '생년월일을 입력해 주세요',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'birthMonth' : {
				'required' : '생년월일을 입력해 주세요',
				'checkDate' : '생년월일을 입력해 주세요',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'birthDate' : {
				'required' : '생년월일을 입력해 주세요',
				'checkDate' : '생년월일을 입력해 주세요',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			}
		};
	});
	</script>
	<script type="text/javascript">
		//EST
		(function() {
			var at = document.createElement('script');
			at.type = 'text/javascript';
			at.async = true;
			at.src = '//estat.zum.com/scripts/at.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(at, s);
		})();
		var ESTatTracker = ESTatTracker || [];
		ESTatTracker.push(['@PageView']);   
	
		//GA
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-51949688-1', 'zum.com');
		ga('send', 'pageview');
	</script>
</body>
</html>