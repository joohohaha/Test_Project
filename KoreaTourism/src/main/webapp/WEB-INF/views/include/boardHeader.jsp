<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<!-- 헤드 -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index">한국 관광 공사</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a href="fboard" class="nav-link">자유 게시판</a>
            </li>
            <li class="nav-item">
              <a href="ps_board" class="nav-link">여행후기 게시판</a>
            </li>
       		<c:choose>
       			<c:when test="${empty SessionNaver and empty SessionUser}">
		            <li class="nav-item">
		              <a class="nav-link" data-toggle="modal" href="#loginModal">로그인</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="joinpage">회원가입</a>
		            </li>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set var="myID" value="${SessionNaver}${SessionUser}"/><!-- 이제 myID쓰면 세션임.. -->
		    		<li class="nav-item">
		              <a class="nav-link" href="logout" >로그아웃</a>
		            </li>
		            <c:if test="${empty SessionNaver}"><!-- 네이버 아이디로 로그인하지 않았을때 표시 -->
			            <li class="nav-item">
			              <a class="nav-link" href="user_info?m_userid=${myID}">회원관리</a>
			            </li>
		            </c:if>
		    	</c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>
    </nav>
    <br>
	<!-- 헤드 끝 -->
	<!-- 모달 css -->
   	<link href="resources/design/css/agency.min.css" rel="stylesheet">
	<!-- member link -->
	<link href="resources/memberDesign/css/find_newPass.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/find_pass.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/find_id.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/loginform.css" rel="stylesheet" type="text/css">
	
    <jsp:include page="../findPage/find_newPass.jsp" />
    <jsp:include page="../findPage/find_pass.jsp" />
    <jsp:include page="../findPage/find_id.jsp" />
    <jsp:include page="../loginForm.jsp"/>