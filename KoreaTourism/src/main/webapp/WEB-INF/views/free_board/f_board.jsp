<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap file -->
	<link rel="stylesheet" href="resources/f_design/css/bootstrap.css">
	<link rel="stylesheet" href="resources/f_design/css/custom.css">
	<link rel="shortcut icon" href="#">
	<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
	
	<!-- Google jQuery file -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/f_design/js/bootstrap.js"></script>
	
	<jsp:include page="../include/boardHeader.jsp"/>
	
	<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
	<link rel="stylesheet" href="resources/footer/custom.css">
<title>게시판이엽</title>
</head>
<body>
	<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
	<!-- 녹색 -->
	  <div class="container jumbotron">
        <h1>FREE BOARD</h1>
      </div>
	<!-- 녹색 끝 -->
	
	<!-- 게시판 -->	
	<section id="board11">
		<div class="container">
				<!-- 1번 라인 -->
				<!-- 왼쪽친구 -->
				<div class="board-s board-s-left board-s-top" >
					<table class="table table-striped" border="1">
						<tr>
							<td>번호</td>
							<td>이름</td>
							<td>제목</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
						<c:set var="maxCount" value="${maxNum}"/>
						<c:if test="${pageNum != 0}">
							<fmt:parseNumber var="thisPage" integerOnly="true" type="number" value="${pageNum/7}" />
							<c:set var="maxCount" value="${maxNum - (7 * thisPage)}"/>
						</c:if>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${maxCount}</td>
								<td>${item.m_userid}</td>
								<td><a href="f_view?f_id=${item.f_id}&m_userid=${myID}">${item.f_title}</a></td>
								<td>${item.f_date}</td>
								<td>${item.f_hit}</td>
							</tr>
							<c:set var="maxCount" value="${maxCount-1}"/>
						</c:forEach>
					</table>
					<c:set var="i" value="${0+pageNum}"/>
					<c:if test="${prev}">
						<a class="btn btn-outline-info" href="fboard?pageNum=${i-7}">이전</a> 
					</c:if>
					<c:if test="${next}">
						<a class="btn btn-outline-primary" href="fboard?pageNum=${i+7}">다음</a>
					</c:if>
				</div>
				<!-- 오른쪽친구 -->
				<div class="board-s board-s-top">
					<form action="f_insert">
						<table border="1">
							<fieldset class="form-group">
								<legend class="border-bottom mb-4">글을 씁시댜</legend>
								<div class="form-group">
									<label class="form-control-label">닉네임</label>
									<input class="form-control form-control-lg" type="text" name="m_userid" value="${SessionNaver}${SessionUser}" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label">글 제목</label> 
									<input class="form-control form-control-lg" type="text" name="f_title" required autofocus>
								</div>

								<div class="form-group">
									<label class="form-control-label">글 내용</label>
									<textarea id="textAreaContent" name="f_content" rows="10" cols="80" style="width: 100%"></textarea>
								</div>
							</fieldset>
						</table>
						<div class="form-group">
							<c:choose>
								<c:when test="${empty SessionNaver and empty SessionUser}">
									<a class="btn btn-outline-danger" style="float:right;" href="#" onclick="alert('로그인 하셈 ㅎㅎ');">글쓰기</a>
								</c:when>
								<c:otherwise>
									<button class="btn btn-outline-success" type="submit" style="float: right">글쓰기</button>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
				
				<!-- 2번 라인 -->
				<!-- 왼쪽친구 -->
				<div id="left_fd" class="carousel slide aaaa board-s board-s-left " data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#left_fd" data-slide-to="0" class="active"></li>
						<li data-target="#left_fd" data-slide-to="1"></li>
						<li data-target="#left_fd" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="resources/design/img/a1.png" alt="First slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a2.png" alt="Second slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a3.png" alt="Third slide" width="320px" height="280px">
						</div>
					</div>
					<a class="carousel-control-prev" href="#left_fd" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="carousel-control-next" href="#left_fd" role="button" data-slide="next"> 
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<!-- 오른쪽친구 -->
				<div id="right_fd" class="board-s carousel slide aaaa" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#right_fd" data-slide-to="0" class="active"></li>
						<li data-target="#right_fd" data-slide-to="1"></li>
						<li data-target="#right_fd" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="resources/design/img/a1.png"
								alt="First slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a2.png"
								alt="Second slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a3.png"
								alt="Third slide" width="320px" height="280px">
						</div>
					</div>
					<a class="carousel-control-prev" href="#right_fd" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#right_fd" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
		</div><!-- container END -->
	</section>
	<!-- 게시판 끝-->	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>