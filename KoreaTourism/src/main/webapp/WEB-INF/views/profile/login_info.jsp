<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 기록 - 한국 관광</title>
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
			<h2>로그인 기록
				<span><em>l</em> 회원님이 후기 게시판에 올린 글을 확인 하실 수 있습니다.</span>
			</h2>
		</div>
		<div class="contents">
			<table class="tlb_log">
				<caption><span class="blind">로그인 기록</span></caption>
				<colgroup>
					<col style="width:200px">
					<col style="width:200px">
					<col style="width:180px">
					<col>
					<col style="width:200px">
				</colgroup>
				<thead>
				<tr>
					<th scope="col">일시</th>
					<th scope="col">IP</th>
					<th scope="col">상태</th>
					<th scope="col">결과</th>
					<th scope="col">서비스</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="logData" items="${userLog}">
					<tr>	
						<td>${logData.log_date}</td>
						<td>${logData.log_ip}</td>
						<td>${logData.log_state}</td>
						<td class="suc">
							<span class="success">성공</span>
						</td>
						<td>KoreanTourism.com</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- UI Object -->
			<div class="paginate">
				<c:if test="${prev}">
					<a href="login_info?m_userid=${SessionUser}&pageNum=${pageNum-10}" style="border: 0">이전</a>
				</c:if>
				<c:if test="${next}">
					<a href="login_info?m_userid=${SessionUser}&pageNum=${pageNum+10}" style="border: 0">다음</a>
				</c:if>
			</div>
			<!-- //UI Object -->
			<p class="guide">로그인 실패 결과는 사용하시는 아이디와 비슷한 아이디를 사용하는 타인의 입력 오류에 의해 생긴 것일 수도 있습니다.</p>
		</div>
	</div>
</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
