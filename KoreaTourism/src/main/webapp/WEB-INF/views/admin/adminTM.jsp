<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="container">
				<form action="adminTM/tour_insert">
				<section class="bg-light" id="board11" style="border: 1px">
				<h2>새 관광지 등록</h2>
						<table class="table table-striped" border="1">
							<tr>
								<td>관광지명</td>
								<td><input class="form-control form-control-lg" type="text" name="tour_name" required autofocus></td>
								<td>관광지구분</td>
								<td><input class="form-control form-control-lg" type="text" name="tour_div" required></td>
							</tr>
							<tr>
								<td>소재지도로명주소</td>
								<td><input class="form-control form-control-lg" type="text" name="addr_street" required></td>
								<td>소재지지번주소</td>
								<td><input class="form-control form-control-lg" type="text" name="addr_location" required></td>
							</tr>
							<tr>
								<td>위도</td>
								<td><input class="form-control form-control-lg" type="text" name="location_x" required></td>
								<td>경도</td>
								<td><input class="form-control form-control-lg" type="text" name="location_y" required></td>
							</tr>
							<tr>
								<td>면적</td>
								<td><input class="form-control form-control-lg" type="text" name="location_area" required></td>
								<td>지정일자</td>
								<td><input class="form-control form-control-lg" type="text" name="st_date" required></td>
							</tr>
							<tr>
								<td>공공편익시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_store_info" required></td>
								<td>숙박시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_acco_info" required></td>
							</tr>
							<tr>
								<td>운동및오락시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_play_info" required></td>
								<td>휴양및문화시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_cul_info" required></td>
							</tr>
							<tr>
								<td>접객시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_peo_info" required></td>
								<td>지원시설정보</td>
								<td><input class="form-control form-control-lg" type="text" name="pb_sp_info" required></td>
							</tr>
							<tr>
								<td>수용인원수</td>
								<td><input class="form-control form-control-lg" type="text" name="ca_peo" required></td>
								<td>주차가능수</td>
								<td><input class="form-control form-control-lg" type="text" name="ca_car" required></td>
							</tr>
							<tr>
								<td>관광지소개</td>
								<td colspan="3"><textarea name="tour_info" rows="100" style="height: 110px"></textarea></td>
							</tr>
							<tr>
								<td>관리기관전화번호</td>
								<td><input class="form-control form-control-lg" type="text" name="tour_com_tel" required></td>
								<td>관리기관명</td>
								<td><input class="form-control form-control-lg" type="text" name="tour_com_name" required></td>
							</tr>
							<tr>
								<td>데이터기준일자</td>
								<td><input class="form-control form-control-lg" type="text" name="rec_update" required></td>
								<td>지역 구분</td>
								<td><input class="form-control form-control-lg" type="text" name="div_seg_area" required></td>
							</tr>
							<tr>
								<td>지역 이름</td>
								<td><input class="form-control form-control-lg" type="text" name="div_seg_name" required></td>
								<td>인기 지역</td>
								<td><input class="form-control form-control-lg" type="text" name="div_area_count" required></td>
							</tr>
						</table>
						<input type="submit" class="btn btn-outline-info" value="등록">
					<!-- container END -->
				</section>
				</form>
			</div>
			<!-- 게시판 -->
			<section class="bg-light" id="board11" style="border: 1px">
			<h2>현재 관광지 목록</h2>
					<c:if test="${SpageNum ne 0}">
						<a class="btn btn-outline-info" href="${path}/adminTM?SpageNum=${SpageNum-10}">이전</a>
					</c:if>
					<c:if test="${next1}">
						<a class="btn btn-outline-primary" href="${path}/adminTM?SpageNum=${SpageNum+10}">다음</a>
					</c:if>
					<table class="table table-striped" border="2">
						<tr>
							<td>관광지명</td>
							<!-- <td>관광지구분</td> -->
							<!-- <td>소재지도로명주소</td> -->
							<td>소재지주소</td>
							<td>위도, 경도</td>
							<td>면적</td>
							<td>공공편익시설정보</td>
							<td>숙박시설정보</td>
							<td>운동및오락시설정보</td>
							<td>휴양및문화시설정보</td>
							<td>접객시설정보</td>
							<td>지원시설정보</td>
							<td>지정일자</td>
							<td>수용인원, 주차수</td>
							<!-- <td>관광지소개</td> -->
							<td>관리기관전화번호</td>
							<td>관리기관명</td>
							<td>데이터기준일자</td>
							<td>지역</td>
							<!-- <td>인기 지역</td> -->
						</tr>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.tour_name}</td>
								<%-- <td>${item.tour_div}</td> --%>
								<%-- <td></td> --%>
								<td>loc : ${item.addr_location}<br>
									str : ${item.addr_street}</td>
								<td>x : ${item.location_x}<br>
									y : ${item.location_y}</td>
								<td>${item.location_area}</td>
								<td>${item.pb_store_info}</td>
								<td>${item.pb_acco_info}</td>
								<td>${item.pb_play_info}</td>
								<td>${item.pb_cul_info}</td>
								<td>${item.pb_peo_info}</td>
								<td>${item.pb_sp_info}</td>
								<td>${item.st_date}</td>
								<td>peo:${item.ca_peo}<br>
									car:${item.ca_car}</td>
								<%-- <td>${item.tour_info}</td> --%>
								<td>${item.tour_com_tel}</td>
								<td>${item.tour_com_name}</td>
								<td>${fn:split(item.rec_update,' ')[0]}</td>
								<td>${item.div_seg_name} ${item.div_seg_area}</td>
								<%-- <td>${item.div_area_count}</td> --%>
							</tr>
						</c:forEach>
					</table>
					
				<!-- container END -->
			</section>
			<!-- 게시판 끝-->
		</div>
    </div>
</body>
</html>