<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<!-- Compiled and minified CSS -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
		<link href="resources/admin/css/sideBar.css" rel="stylesheet" type="text/css">
	
	    <!-- Compiled and minified JavaScript -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
		
		<!-- smart editor -->
		<script type="text/javascript" src="resources/ps_design/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
		<script type="text/javascript" src="resources/ps_design/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
		
		<c:set var="path" value="<%= request.getContextPath()%>"/>
		<c:if test="${empty admin}">
			<script>
				location.href='${path}/admin/adminLogin';
			</script>
		</c:if>
	</head>
	
	<body>
	<!-- Navbar goes here -->
	<jsp:include page="header.jsp"/>
    <!-- Page Layout here -->
    <div class="row">
    	<div id="menubar">
    		<jsp:include page="menuBar.jsp"/>
    	</div>
		<div id="contents">
			<!-- 게시판 -->
			<section class="bg-light" id="board11" style="border: 1px">
			<h2 style="margin: 0">현재 게시글 목록</h2>
				<div class="container">
					<table class="table table-striped" border="1">
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>글제목</td>
							<td>글내용</td>
							<td>작성일</td>
							<td>조회수</td>
							<td>지우기</td>
						</tr>
						<c:if test="${empty list}">
							<tr><td colspan="7">게시물이 한건도 존재하지 않습니다.</td></tr>
						</c:if>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.f_id}</td>
								<td>${item.m_userid}</td>
								<td>${item.f_title}</td>
								<td>...</td>
								<td>${item.f_date}</td>
								<td>${item.f_hit}</td>
								<td><a class="btn btn-outline-primary" href="${path}/adminFM/f_delete?f_id=${item.f_id}">지우기</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${SpageNum ne 0}">
						<a class="btn btn-outline-info" href="${path}/adminFM?SpageNum=${SpageNum-7}">이전</a>
					</c:if>
					<c:if test="${next1}">
						<a class="btn btn-outline-primary" href="${path}/adminFM?SpageNum=${SpageNum+7}">다음</a>
					</c:if>
				</div>
				<!-- container END -->
			</section>
			<!-- 게시판 끝-->
		</div>
    </div>
</body>
</html>