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
	
	<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
	<link rel="shortcut icon" href="#">
	
	<!-- Google jQuery file -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/f_design/js/bootstrap.js"></script>
	
	<jsp:include page="../include/boardHeader.jsp"/>
	<title>게시글 수정하기</title>
</head>

<body>
	<section>
		<div id="board-list" class="container">
			<!-- 부트스트랩 이용한 그리드 시스템 -->
			<div class="row">
				<!-- 12칸 분할 -->
				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<form action="f_update">
						<table border="1">
							<fieldset class="form-group">
								<legend class="border-bottom mb-4">게시글 상세보기</legend>
								<div class="form-group">
									<label class="form-control-label">게시글 번호</label>
									<input class="form-control form-control-lg" type="text" value="${fboard.f_id}" name="f_id" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label">닉네임</label>
									<input class="form-control form-control-lg" type="text" value="${fboard.m_userid}" name="bname" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label">게시글 제목</label>
									<input class="form-control form-control-lg" type="text" value="${fboard.f_title}" name="f_title" required autofocus>
								</div>

								<div class="form-group">
									<label class="form-control-label"></label>
									<textarea id="textAreaContent" name="f_content" rows="10" cols="80" style="width: 100%">${fboard.f_content}</textarea>
								</div>
								<div class="form-group">
									<label class="form-control-label"></label>작성일자
									<input class="form-control form-control-lg" type="text"
										value="${fboard.f_date}" name="f_date" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label"></label>조회수<input
										class="form-control form-control-lg" type="text"
										value="${fboard.f_hit}" name="f_hit" readonly>
								</div>
							</fieldset>
						</table>
						<div class="form-group">
							<button class="btn btn-outline-primary" type="submit"
								style="float: right">수정하기</button>
						</div>
					</form>

				</div>
			</div>
			<!-- row(12분할) END -->
		</div>
		<!-- container END -->
	</section>

</body>
</html>