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
			<section>
		<div id="board-list" class="container">
			<!-- 부트스트랩 이용한 그리드 시스템 -->
			<div class="row">
				<!-- 12칸 분할 -->
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<form action="adminPSM/notice_insert">
						<input type="hidden" name="m_userid" value="admin">
						<table border="1">
							<fieldset class="form-group">
								<legend class="border-bottom mb-4">공지사항 글 등록하기</legend>
								<div class="form-group">
									<label class="form-control-label">공지글 제목</label>
									<input class="form-control form-control-lg" type="text" name="b_title" required autofocus>
								</div>
								<div class="form-group">
									<label class="form-control-label">공지 내용</label>
									<textarea id="textAreaContent" name="b_content" rows="10" cols="80" style="width: 100%"></textarea>
								</div>
							</fieldset>
						</table>
						<div class="form-group">
							<button class="btn btn-outline-success" onclick="submitContents(this)" style="float: right">공지 등록</button>
						</div>
					</form>
				</div>
			</div>
			<!-- row(12분할) END -->
		</div>
		<!-- container END -->
		<!-- Naver Smart Editor 2 -->
	<script>
	  var oEditors = [];
	  nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "textAreaContent",
	      sSkinURI: "<%=request.getContextPath()%>/resources/ps_design/editor/SmartEditor2Skin.html",
	      fCreator: "createSEditor2"
	  });
	   
	  //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	  function submitContents(elClickedObj) {
	      // 에디터의 내용이 textarea에 적용된다.
	      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	      // 에디터의 내용에 대한 값 검증은 이곳에서
	      // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	      try {
	          elClickedObj.form.submit();
	      } catch(e) {
	      
	      }
	  }
	   
	  // textArea에 이미지 첨부
	  function pasteHTML(filepath){
	      var sHTML = '<img src="<%=request.getContextPath()%>/resources/ps_design/editor/upload/' + filepath + '">';
			oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
		}
	</script>
	<section class="bg-light" id="board11" style="border: 1px">
			<h2>공지 글 목록</h2><br>
				<div class="container">
					<table class="table table-striped" border="1">
						<tr>
							<td>번호</td>
							<td>글제목</td>
							<td>작성일</td>
							<td>수정일</td>
							<td>조회수</td>
						</tr>
						<c:if test="${empty notice}">
							<tr><td colspan="5">등록된 공지사항이 한건도 존재하지 않습니다.</td></tr>
						</c:if>
						<c:forEach var="item" items="${notice}">
							<tr>
								<td class="thidden-xs">
									<input type="checkbox" name="chk_wr_id[]" value="30" id="chk_wr_id_0">
									<strong>공지</strong>
								</td>
								<td class="subject">
									<a href="ps_view?b_num=${item.b_num}">${item.b_title}(${item.b_replycount})</a>
								</td>
								<td class="hidden-xs">${item.b_writedate}</td>
								<td class="hidden-xs">${item.b_updatedate}</td>
								<td class="hidden-xs">${item.b_readcount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- container END -->
			</section>
	</section>
			<!-- 게시판 -->
			<section class="bg-light" id="board11" style="border: 1px">
			<h2>현재 게시글 목록</h2>
				<div class="container">
					<table class="table table-striped" border="1">
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>글제목</td>
							<td>글내용</td>
							<td>작성일</td>
							<td>수정일</td>
							<td>조회수</td>
							<td>지우기</td>
						</tr>
						<c:if test="${empty list}">
							<tr><td colspan="8">등록된 게시글이 한건도 존재하지 않습니다.</td></tr>
						</c:if>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.b_num}</td>
								<td>${item.m_userid}</td>
								<td>${item.b_title}</td>
								<td>...</td>
								<td>${item.b_writedate}</td>
								<td>${item.b_updatedate}</td>
								<td>${item.b_readcount}</td>
								<td><a class="btn btn-outline-primary" href="adminPSM/ps_delete?b_num=${item.b_num}">지우기</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${SpageNum ne 0}">
						<a class="btn btn-outline-info" href="adminPSM?SpageNum=${SpageNum-7}">이전</a>
					</c:if>
					<c:if test="${next1}">
						<a class="btn btn-outline-primary" href="adminPSM?SpageNum=${SpageNum+7}">다음</a>
					</c:if>
				</div>
				<!-- container END -->
			</section>
			<!-- 게시판 끝-->
			
			<section class="bg-light" id="board11" style="border: 1px">
			<h2>삭제된 게시글 목록</h2><br>
			
				<div class="container">
					<table class="table table-striped" border="1">
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>글제목</td>
							<td>글내용</td>
							<td>작성일</td>
							<td>수정일</td>
							<td>조회수</td>
							<td>살리기</td>
						</tr>
						<c:if test="${empty delete}">
							<tr><td colspan="8">삭제된 게시글이 한건도 존재하지 않습니다.</td></tr>
						</c:if>
						<c:forEach var="item" items="${delete}">
							<tr>
								<td>${item.b_num}</td>
								<td>${item.m_userid}</td>
								<td>${item.b_title}</td>
								<td>...</td>
								<td>${item.b_writedate}</td>
								<td>${item.b_updatedate}</td>
								<td>${item.b_readcount}</td>
								<td><a class="btn btn-outline-primary" href="adminPSM/ps_save?b_num=${item.b_num}">살리기</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${DpageNum ne 0}">
						<a class="btn btn-outline-info" href="adminPSM?DpageNum=${DpageNum-7}">이전</a>
					</c:if>
					<c:if test="${next0}">
						<a class="btn btn-outline-primary" href="adminPSM?DpageNum=${DpageNum+7}">다음</a>
					</c:if>
				</div>
				<!-- container END -->
			</section>
			<!-- 게시판 끝-->
			<section></section>
		</div>
    </div>
</body>
</html>