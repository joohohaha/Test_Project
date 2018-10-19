<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<script src="https://www.google.com/recaptcha/api.js"></script>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
  <%
    String clientId = "xHnGDEiESs7O3i28j1Wl";
    String redirectURI = URLEncoder.encode("http://192.168.0.58:8000/tour/naver_login", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
 %>
<div class="portfolio-modal modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content" style="background: transparent; border: 0;">
			<div id="wrap">
				<div id="header">
					<div class="close-modal" data-dismiss="modal">
						<div class="lr"><div class="rl"></div></div>
					</div>
				</div>
				<div id="container">
					<div class="login_page">
						<h2>로그인 하기</h2>
						<div class="login_box">
							<form id="frm_in_login" name="frm_in_login" method="post" action="user_login">
								<fieldset>
									<dl>
										<dt class="blind">아이디</dt>
										<dd>
											<span class="text_box d_input_area"> <!-- on : 입력창 활성화 , warning : 입력 사항에 문제 있음 -->
												<label for="id">아이디 입력</label>
												<input type="text" id="id" name="m_userid" maxlength="30" value="">
												<button type="button" class="btn_clear d_clear" style="display: none" tabindex="-1">입력창 비우기</button>
											</span>
											<div class="text_alert" style="display: none;">
												<p>오류 메세지</p>
											</div>
										</dd>
										<dt class="blind">비밀번호</dt>
										<dd>
											<span class="text_box d_input_area"> 
												<label for="password">비밀번호 입력</label>
												<input type="password" name="m_password" id="password" maxlength="30">
												<button type="button" class="btn_clear d_clear" style="display: none" tabindex="-1">입력창 비우기</button>
											</span>
										</dd>
									</dl>
									<div class="check_keep_login">
										<input type="checkbox" id="login_check" name="rmm">
										<label for="login_check">로그인 상태 유지</label>
									</div>
									<div class="check_ip_security">
										<input type="checkbox" id="btn_ip">
										<label for="btn_ip" class="checked" id="btn_ip_on"><!-- checked : IP 보안 ON 상태 -->
											IP보안 <strong>ON</strong> 
										</label>
									</div>
									<div id="loginDiv" class="btn_login">
										<button type="button" onclick="user_login()">로그인</button>
  										<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
									</div>
								</fieldset>
							</form>
							<input type="hidden" id="zumOnly" value="false">
						</div>

						<div class="login_menu">
							<ul>
								<li><a onclick="find_id()" href="#">아이디 찾기</a></li>
								<li><a onclick="find_pass()" href="#">비밀번호 찾기</a></li>
								<li>
									<a class="nav-link" href="joinpage" style="-webkit-appearance: initial; padding: 0;" role="button" type="submit">회원가입</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function find_id(){
		$('#loginModal').modal('hide');
		$('#find_userid').modal();	
	}
	function find_pass(){
		$('#loginModal').modal('hide');
		// $('#find_newPass').modal();
		$('#find_userPass').modal();
	}
</script>

<script type="text/javascript">
	(function(login, $){
		login.general = {
			$id : $("#id"),
			$password : $("#password"),
			$enc_id : $("#enc_id"),
			$enc_password : $("#enc_password"),
	        $btn_ip : $("#btn_ip"),
			$btn_ip_on : $("#btn_ip_on"),
			$btn_find_pass : $("#btn_find_pass"),
			$targetUrl : $("#targetUrl"),
			$generalSubmitUrl : $("#generalSubmitUrl"),
			$rmm_check : $("#rmm_check"),
			$rmm : $("#rmm"),
			$ipCheck_result : $("#ipCheck_result"),
			$frm_in_login : $("#frm_in_login"),
			$fbLoginUrl : $("#fbLoginUrl"),
			$fb_targetUrl : $("#fb_targetUrl"),
			$frm_sub_login : $("#frm_sub_login"),
	        $tLoginUrl : $("#tLoginUrl"),
	        $t_targetUrl : $("#t_targetUrl"),
	        $kLoginUrl : $("#kLoginUrl"),
	        $k_targetUrl : $("#k_targetUrl"),
			getkey_ajax_flag : false,
			$captcha_box : $('#d_captcha_box'),
			$loginHold : $('#loginHold'),
			$secret : $('#secret'),
	        $inputArea : $('.d_input_area input'),
	        $clearBtn : $('.text_box').find('.btn_clear'),
	        $zumOnly : $("#zumOnly"),
	
			init : function() {
				var _ = login.general;
				
				_.$frm_in_login.submit(_.submit);
	            _.$inputArea.focus(function() {
	                $(this).parent().addClass('on');
	            });
	            _.$inputArea.blur(function() {
	                if ($(this).val() === '') {
	                    $(this).parent().removeClass('on');
	                }
	            });
	            _.$inputArea.keyup(function() {
	                var $thisBtnClear = $(this).parent().find('.btn_clear');
	                if($(this).val() === '') {
	                    $thisBtnClear.hide();
	                } else {
	                    $thisBtnClear.show();
	                }
	            });
	            _.$clearBtn.click(function() {
	                $(this).hide().parent().find('input').val("").focus();
	            });
	            _.$btn_ip.on('change', function(){
	                var thisLabel = $(this).parent().find('label');
	                if ($(this)[0].checked) {
	                    thisLabel.addClass('checked').find('strong').html("ON");
	                } else {
	                    thisLabel.removeClass('checked').find('strong').html("OFF");
	                }
	            });
				_.$id.val("");
				_.$password.val("");
				_.$id.focus();
				_.$btn_ip.prop('checked', true);
			},
			
			validate : function() {
				var _ = login.general;
				var id = $.trim(_.$id.val());
				var pass = $.trim(_.$password.val());
				
				if(id === "") {
					alert(message.empty.id);
					_.$id.focus();
					return false;
				}
				
				if(pass === "") {
					alert(message.empty.password);
					_.$password.focus();
					return false;
				}
				return true;
			},
	
			rmm : {
				check : function() {
					var _ = login.general;
					if( _.$rmm_check.prop('checked') ) {
						$.cookie("rmm", "1", {expires:14, domain:".zum.com", path:"/"});
					}
					else {
						$.cookie("rmm", "0", {expires:14, domain:".zum.com", path:"/"});
					}
				}
				
			},
			
			submit : function() {
				var _ = login.general;
				var	$captchaBox = $('#d_captcha_box');
				
				if($captchaBox.length > 0){
					var recaptcha = grecaptcha.getResponse();
					if(recaptcha.length === 0){
						alert('다시 체크해 주세요.');
						return false;
					}
					
					_.$secret.val(recaptcha);
				}
				
				if( !(_.validate()) ) {
					return false;
				}
				if (_.$btn_ip_on.hasClass("checked")) {
					_.$ipCheck_result.val("true");
				}
				else {
					_.$ipCheck_result.val("false");
				}
	
				_.rmm.check();
	
				if (!_.getkey_ajax_flag) {
					_.getkey_ajax_flag = true;
					getKey(function(data) {
						if (data !== null && data !== undefined) {
							var targetUrl = _.$targetUrl.val();
							var generalSubmitUrl = _.$generalSubmitUrl.val();
							if (_.$zumOnly.val() === "true")
								generalSubmitUrl += "?zumOnly=true";
							else
								generalSubmitUrl += "?zumOnly=false";
							if (targetUrl !== null && targetUrl !== "") {
								targetUrl = encodeURIComponent(targetUrl);
								generalSubmitUrl += "&targetUrl=" + targetUrl;
							}
	
							var $plain_set = [ _.$id, _.$password ];
							var $enc_set = [ _.$enc_id, _.$enc_password ];
							var rsa = new RSAKey();
							rsa.setPublic(data.modulus, data.exponent);
							for ( var i = 0; i < $plain_set.length; i++) {
								$enc_set[i].val(rsa.encrypt($
										.trim($plain_set[i].val())));
							}
							_.$frm_sub_login.prop("action", generalSubmitUrl)
									.submit();
						} else {
							alert("일시적인 장애입니다. 잠시 후 다시 시도해 주세요.");
						}
						_.getkey_ajax_flag = false;
					});
				}
				return false;
			}
		};
		login.general.init();
	})(window["login"] = window["login"] || {}, jQuery);
	
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

	function user_login() { // 서버전송 함수
		var result = {
			"m_userid" : $('#id').val(),
			"m_password" : $('#password').val(),
		};
		$('#id').val('');
		$('#password').val('');
		fetch('user_login', {method : 'POST', body : JSON.stringify(result)}).then(res => res.text()).then(function(data) {
			if (data == 'success')location.href = 'index';else if (data == 'fail')alert('입력한 정보와 일치하는 정보가 없습니다.\n다시한번 확인해 주세요.');else if(data == 'withdrawal'){
				alert('이미 탈퇴한 회원입니다.');
			}
		});
	}
	
</script>