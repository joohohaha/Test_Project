<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<!-- GNB -->
	<div class="gnb_wrap" id="gnb_wrap"></div>
	<input type="hidden" id="loginUrl" value="" /> <input type="hidden"
		id="headerLoginTargetUrl" value="index.jsp" />
	<h1></h1>
	<div class="header_menu">
		<ul class="clear_float">
			<li class="${new_pass}"><a href="new_pass?m_userid=${SessionUser}">비밀번호 변경</a></li>
			<li class="${user_info}"><a href="user_info?m_userid=${SessionUser}">회원정보 변경</a></li>
			<li class="${login_info}"><a href="login_info?m_userid=${SessionUser}">로그인 기록</a></li>
			<li class="${withdrawal}"><a href="withdrawal?m_userid=${SessionUser}">회원 탈퇴</a></li>
		</ul>
	</div>
</div>

<script>
$(function(){	
	$(document).ready(function(){
		<c:if test="${empty SessionUser}">
			alert('로그인을 안햇자너!?');
			location.href='index';
		</c:if>
	});
});
</script>
