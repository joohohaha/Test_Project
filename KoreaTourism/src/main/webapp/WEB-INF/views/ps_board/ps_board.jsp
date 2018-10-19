<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap file -->
<link rel="stylesheet" href="resources/ps_design/css/bootstrap.css">
<link rel="stylesheet" href="resources/ps_design/css/custom.css">
<link rel="shortcut icon" href="#">
<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->

<!-- Google jQuery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/ps_design/js/bootstrap.js"></script>

<jsp:include page="../include/boardHeader.jsp" />
<link rel="stylesheet" href="resources/ps_design/css/common.css">
<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
<link rel="stylesheet" href="resources/footer/custom.css">
<title>POSTSCRIPT BOARD</title>
</head>
<body>
<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
	<!-- 녹색 -->
	<div class="container jumbotron">
		<h1>POSTSCRIPT BOARD</h1>
	</div>
	<!-- 녹색 끝 -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">실시간 인기글 5</h1><br>
			<div class="list-group" id="hotPost"></div>
		</div>
	</div>

	<!-- ----------------------------------------------------------------------------- -->

	<!-- 게시판 -->
	<div id="ps_board" class="area_cont inr-c">
		<form name="ps_board" method="get">
			<header class="tbl_header">
				<div class="lft box_c">
					<div class="col sel">
						<input type="hidden" name="action" value="do_search">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="search_op" id="sfl" class="select1">
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_title||b_content">제목+내용</option>
							<option value="m_userid">글쓴이</option>
						</select>
					</div>
					<div class="col inp_search">
						<label for="stx" class="sound_only">검색어</label>
						<input name="search_cont" value="" required id="stx" class="inp_txt search">
						<input type="submit" id="search_img" value="검색" class="btn">
					</div>
				</div>
			</header>
			<input type="submit" value="검색" class="btn_submit" hidden="">
		</form>
			<div class="inner">
				<div class="tbl_basic ty2">
					<table class="list" summary="공지사항 리스트입니다.">
						<colgroup>
							<col class="num">
							<col class="name">
							<col class="day">
							<col class="name">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hidden-xs">등록일</th>
								<th scope="col" class="hidden-xs">조회</th>
							</tr>
						</thead>
						<tbody><!-- 공지 기능을 만들면 여기에 추가 -->
							<c:forEach var="item" items="${notice}">
								<tr>
									<td class="thidden-xs">
										<strong>공지</strong>
									</td>
									<td class="subject">
										<a href="ps_view?b_num=${item.b_num}">${item.b_title}(${item.b_replycount})</a>
									</td>
									<td><span class="sv_member">최고관리자</span></td>
									<td class="hidden-xs">${fn:split(item.b_writedate,' ')[0]}</td>
									<td class="hidden-xs">${item.b_readcount}</td>
								</tr>
							</c:forEach>
							<c:set var="maxCount" value="${maxNum}"/><%-- rownum 지정 --%>
							<fmt:parseNumber var="thisPage" integerOnly="true" type="number" value="${pageNum/7}" />
							<c:if test="${pageNum != 0}"><%-- 첫페이지가 아닐 때 --%>
								<c:set var="maxCount" value="${maxCount - pageNum}"/>
							</c:if>
							<c:forEach var="ps_board" items="${list}">
								<tr>
									<td class="thidden-xs">
										${maxCount}
									</td>
									<td class="subject">
										<a href="ps_view?b_num=${ps_board.b_num}&m_userid=${myID}">${ps_board.b_title}(${ps_board.b_replycount})</a>
									</td>
									<td><span class="sv_member">${ps_board.m_userid}</span></td>
									<td class="hidden-xs">${fn:split(ps_board.b_writedate,' ')[0]}</td>
									<td class="hidden-xs">${ps_board.b_readcount}</td>
								</tr>
							<c:set var="maxCount" value="${maxCount-1}"/>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="tbl_footer">
					<div class="ta-r">
						<c:if test="${!empty myID}">
							<a href="ps_writeForm" class="btn-pack blue2 rv n">글쓰기</a>
						</c:if>
						<c:if test="${empty myID}">
							<a href="#" onclick="alert('로그인을 하시요.');" class="btn-pack blue2 rv n">글쓰기</a>
						</c:if>
					</div>
				</div>
			</div>

		<!-- 페이징 -->
		<nav class="pg_wrap">
			<fmt:parseNumber var="maxPage" integerOnly="true" type="number" value="${maxNum / 7}" />
			<c:if test="${pageNum ne 0}"><%-- 첫페이지 아니면 보임 --%>
				<a href="ps_board?pageNum=0" class="pg_page">맨앞</a>
			</c:if>
			
			<c:set var="begin" value="0"/><c:set var="end" value="6"/><%-- 페이징 시작 고정값 설정 --%>
			
			<c:if test="${thisPage >= 4 }"><%-- 페이징 중간 가변값 --%>
				<c:set var="begin" value="${thisPage-3}"/>
				<c:set var="end" value="${thisPage+3}"/>
			</c:if>
			
			<c:if test="${end > maxPage}"><%-- 페이징 끝 고정값 설정 --%>
				<c:if test="${maxPage > 5}"><%-- 최소값을 늘리는 조건--%>
					<c:set var="begin" value="${maxPage-5}"/>
				</c:if>
				<c:set var="end" value="${maxPage}"/>
			</c:if>
			<c:forEach begin="${begin}" end="${end}" varStatus="i">
				<c:set var="i" value="${i.index}"/>
				<c:choose>
					<c:when test="${thisPage eq i}">
						<a href="ps_board?pageNum=${i*7}" class="pg_current" >${i+1}</a>	
					</c:when>
					<c:otherwise>
						<a href="ps_board?pageNum=${i*7}" class="pg_page">${i+1}</a>	
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${maxPage > 0 and maxPage ne thisPage}"> <%-- 마지막 페이지가 1 이상이고, 현재 페이지가 마지막 페이지가 아닐때 보임 --%>
				<a href="ps_board?pageNum=${maxPage * 7}" class="pg_page">맨끝</a>
			</c:if>
		</nav>
		<!-- 게시판 목록 끝 -->
	</div>
	<script>
		function hotPost() {
			fetch('psboard_hotPost', {method : 'POST'}).then(res => res.json()).then(function(data){
				$('#hotPost').empty();
				data.forEach(function(item){
					var button = document.createElement('button');
					button.type = 'button';
					button.className = 'list-group-item list-group-item-action';
					button.style = 'background-color : white; text-align : center';
					button.setAttribute('onclick', 'location.href=\'ps_view?b_num=' + item.b_num + '&m_userid=${myID}\'');
					button.innerHTML = item.b_title + " 조회수 : " + item.b_readcount;
					document.getElementById('hotPost').append(button);
				});
			});
		}
		$(document).ready(function() {
			hotPost()
			setInterval("hotPost()", 5000); // 매 5000ms(5초)가 지날 때마다 hotPost() 함수를 실행합니다.
		});
	</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>