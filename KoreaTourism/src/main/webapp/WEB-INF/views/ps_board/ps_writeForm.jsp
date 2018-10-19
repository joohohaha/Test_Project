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
	<link rel="stylesheet" href="resources/ps_design/css/bootstrap.css">
	<link rel="stylesheet" href="resources/ps_design/css/custom.css">
	<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
	<link rel="stylesheet" href="resources/footer/custom.css">
	<link rel="shortcut icon" href="#">
	
	<!-- Google jQuery file -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/ps_design/js/bootstrap.js"></script>
	
	<!-- smart editor -->
	<script type="text/javascript" src="resources/ps_design/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
	<script type="text/javascript" src="resources/ps_design/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	<jsp:include page="../include/boardHeader.jsp"/>
	<title>게시글 상세보기</title>
</head>
<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
<c:if test="${empty myID}">
	<script>
		alert('로그인 하세요.');
		location.href='ps_board';
	</script>
</c:if>
<body>
	<section>
		<div id="board-list" class="container">
			<!-- 부트스트랩 이용한 그리드 시스템 -->
			<div class="row">
				<!-- 12칸 분할 -->
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<form action="ps_insert" name="w_form">
						<input type="hidden" name="m_userid" value="${SessionNaver}${SessionUser}">
						<fieldset class="form-group">
							<legend class="border-bottom mb-4">글을 씁시댜</legend>
							<div class="form-group">
								<label class="form-control-label">글 제목</label>
								<input class="form-control form-control-lg" type="text" name="b_title" required autofocus>
							</div>
							<div class="form-group">
								<label class="form-control-label">글 내용</label>
								<textarea class="form-control form-control-lg" rows="12"
									cols="80" id="textAreaContent" name="b_content"
									style="width: 100%"></textarea>
							</div>
							<div class="form-group">
								<button class="btn btn-outline-info" type="button"
									onclick="submitContents(this)" style="float: right">Write</button>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!-- row(12분할) END -->
		</div>
		<!-- container END -->
	</section>

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
	    	  console.log(e);
	      }
	  }
	   
	  // textArea에 이미지 첨부
	  function pasteHTML(filepath){
	      var sHTML = '<img src="<%=request.getContextPath()%>/resources/ps_design/editor/upload/'
					+ filepath + '">';
			oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
		}
	</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>