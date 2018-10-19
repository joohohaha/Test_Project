<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta content="charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap file -->
	<link rel="stylesheet" href="resources/f_design/css/bootstrap.css">
	<link rel="stylesheet" href="resources/f_design/css/custom.css">
	<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
	<link rel="stylesheet" href="resources/footer/custom.css">
	
	<!-- Google jQuery file -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/f_design/js/bootstrap.js"></script>
	
	<jsp:include page="../include/boardHeader.jsp"/>
	<title>게시글 상세보기</title>
</head>

<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
	<body>
		<section>
			<div id="fboard-list" class="container">
				<!-- 부트스트랩 이용한 그리드 시스템 -->
				<div class="row">
					<div class="container">
						<strong class="tit_category">자유 게시글 상세보기</strong>
						<div class="tit_area ">
							<h3 class="tit_h3" id="f_title">${fboard.f_title}</h3>
						</div>
						<div class="media mb-4" style="border-bottom: 1px solid #e6e6e6;">
							<a href="fboard" class="se_thumbnail">
								<span class="img">
									<img src="resources/img/travel.png" width="35" height="35" alt="프로필">
								</span>
								<!-- <span class="sim ico_monthlyblog1"></span> -->
							</a>
							<div class="media-body" style="margin-bottom: 5px;">
								<strong class="ell">${fboard.m_userid}</strong><br>
								<small>${fboard.f_date}</small>
								<div class="media-body" style="float: right;">
									<c:if test="${fboard.m_userid eq myID}">
										<a class="txt" href="f_updateForm?f_id=${fboard.f_id}">수정 | </a>
										<a class="txt" href="f_delete?f_id=${fboard.f_id}">삭제 | </a>
									</c:if> 
									<a class="txt" href="fboard">목록보기</a>
								</div>
							</div>
						</div>${fboard.f_content}<!-- 내용 -->		
					</div>
				</div>
			</div>
		</section>
		
		<jsp:include page="../include/footer.jsp"/>
	</body>
</html>

