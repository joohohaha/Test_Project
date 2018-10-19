<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lN3APOAVWfk96iNDnU6F&submodules=geocoder"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<script type="text/javascript" src="resources/mapCluster/src/MarkerClustering.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
	
    <title>Agency - Start Bootstrap Theme</title>
    
    <jsp:include page="include/mainLink.jsp"/>
    
    <!-- member link -->
	<link href="resources/memberDesign/css/member.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/loginform.css" rel="stylesheet" type="text/css" >
	<link href="resources/memberDesign/css/find_id.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/find_newPass.css" rel="stylesheet" type="text/css">
	<link href="resources/memberDesign/css/find_pass.css" rel="stylesheet" type="text/css">
  </head>

  <body id="page-top">
  	<c:set var="path" value="<%=request.getContextPath() %>"/>
	<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
    <!-- 여백 -->
    <jsp:include page="loginForm.jsp" />
    <jsp:include page="findPage/find_newPass.jsp" />
    <jsp:include page="findPage/find_id.jsp" />
    <jsp:include page="findPage/find_pass.jsp" />
	<jsp:include page="include/header.jsp"/>
	
    
	<!-- 메인 배경과 버튼 사이의 공간 -->
	<div class="container top-section">
	
		<!-- 지도 입니다. 지도 스크립트 검색하면 됨 Ctrl+F -->
		
		<div id="map"></div>
						
		<!-- 지도 입니다. 지도 스크립트 검색하면 됨 Ctrl+F -->
		
		<!-- 오른쪽친구 -->
		<div id="board_hotClip" class="carousel slide aaaa" data-ride="carousel">
			<ul class="list-group" id='ps_posts'>
				  <li class="list-group-item disabled">여행후기 게시판 인기글</li>
			</ul>
			<ul class="list-group" id='f_posts'>
				  <li class="list-group-item disabled">자유 게시판 인기글</li>
			</ul>
		</div>
		
	</div> <!-- top-section END -->
	
    <!-- Portfolio Grid -->
    <!-- 핵심 부분 -->
    <section class="bg-light" id="portfolio">
      <div class="container">
        <div class="navbar-expand-lg bg-dark navbar-dark">
        	<img alt="" src="">
		 	<a style="margin:12px" data-toggle="modal" href="#" class="btn btn-primary btn-lg active" role="button" type="submit">인기 지역 보기</a>
			<a style="margin:12px" onclick="localData('gyeongsang')" class="btn btn-outline-info btn-lg active" role="button">경상도</a>
			<a style="margin:12px" onclick="localData('seoul')" class="btn btn-outline-info btn-lg active" role="button">서울</a>
			<a style="margin:12px" onclick="localData('gyeonggi')" class="btn btn-outline-info btn-lg active" role="button">경기도</a>
			<a style="margin:12px" onclick="localData('gangwon')" class="btn btn-outline-info btn-lg active" role="button">강원도</a>
			<a style="margin:12px" onclick="localData('chungcheong')" class="btn btn-outline-info btn-lg active" role="button">충청도</a>
			<a style="margin:12px" onclick="localData('jeonla')" class="btn btn-outline-info btn-lg active" role="button">전라도</a>
			<a style="margin:12px" onclick="localData('jeju')" class="btn btn-outline-info btn-lg active" role="button">제주도</a>
	    </div><br>
	    
	<!-- ------------------------------------------------------------------------------------------------------------------------ -->
	
        <!-- 인기 지역 -->
        <div class="row" id="hotlocal"></div>
      </div>
    </section>

   <!-- ------------------------------------------------------------------------------------------------------------------------ -->
    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
      
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Our Amazing Colleague</h2>
            <h3 class="section-subheading text-muted">KoreaTourism Create by...</h3>
          </div>
        </div>
        
        <div class="row">
          <!-- 동욱형님 -->
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/img/team/who.jpg" alt="">
              <h4>LDW</h4>
              <p class="text-muted">----</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          
           <!-- 태훈 -->
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/img/team/leader.png" alt="">
              <h4>TH</h4>
              <p class="text-muted">503 Leader</p>
              <ul class="list-inline social-buttons">
              	<li class="list-inline-item">
                  <a href="https://blog.naver.com/dpsdlskzb1" target="_blank">
                  	<i class="fab fa-blogger"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="https://www.instagram.com/long_longtae/?hl=ko" target="_blank">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          
           <!-- 세진형님 -->
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/img/team/who.jpg" alt="">
              <h4>JSJ</h4>
              <p class="text-muted">----</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="https://blog.naver.com/skel123" target="_blank">
                  	<i class="fab fa-blogger"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="https://www.facebook.com/people/%EC%A0%95%EC%84%B8%EC%A7%84/100009988682219" target="_blank">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="https://www.instagram.com/rxmo.sj/?hl=ko" target="_blank">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          
           <!-- 나 -->
           <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/img/team/me.jpg" alt="">
              <h4>HS</h4>
              <p class="text-muted">Park Driver</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="https://blog.naver.com/melomelo11" target="_blank">
                  	<i class="fab fa-blogger"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="https://www.instagram.com/1.one_saem/?hl=ko" target="_blank">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <p class="large text-muted"></p>
          </div>
        </div>
      </div>
    </section>

    <!-- Clients -->
    <section class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6">
            <a href="http://www.mcst.go.kr/main.jsp" target="_blank">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l1.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="http://kto.visitkorea.or.kr/kor.kto" target="_blank">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l2.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l3.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="http://bto.or.kr/renewal/main/main.php" target="_blank">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l4.png" alt="" width="150" height="200">
            </a>
          </div>
        </div>
      </div>
    </section>	
	
	 <!-- footer -->
	 
    <!-- Portfolio Modals -->
    <!-- ============================================================= -->
    <jsp:include page="localInfo.jsp"/>
	<!-- ============================================================= -->
	
		<script>//지도 스크립트
			//---------- 페이지 시작부터 불러오기로 맵을 만든다. markers는 marker를 넣기위한 배열틀이다.
		    var map = new naver.maps.Map("map", {
		        zoom: 2,
		        center: new naver.maps.LatLng(36.490692,128.0897413),
		        zoomControl: true,
		        zoomControlOptions: {
		            position: naver.maps.Position.TOP_LEFT,
		            style: naver.maps.ZoomControlStyle.SMALL
		        }
		    }),markers = [];
			
		    //-----------------------클러스터 마킹이미지 적용시키는 변수 작성 -----------
			var htmlMarker1 = {
			        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-1.png);background-size:contain;"></div>',
			        size: N.Size(40, 40),
			        anchor: N.Point(20, 20)
			    },
			    htmlMarker2 = {
			        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-2.png);background-size:contain;"></div>',
			        size: N.Size(40, 40),
			        anchor: N.Point(20, 20)
			    },
			    htmlMarker3 = {
			        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-3.png);background-size:contain;"></div>',
			        size: N.Size(40, 40),
			        anchor: N.Point(20, 20)
			    },
			    htmlMarker4 = {
			        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-4.png);background-size:contain;"></div>',
			        size: N.Size(40, 40),
			        anchor: N.Point(20, 20)
			    },
			    htmlMarker5 = {
			        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-5.png);background-size:contain;"></div>',
			        size: N.Size(40, 40),
			        anchor: N.Point(20, 20)
			    };
			//------------------------v3방식 마커 클러스터 방식--------
			document.getElementById("map").onload = onLoad();
			//------------------------클러스터 기법 foreach사용
			function onLoad() {
			    <c:forEach var="item" items="${selectAll}" varStatus="val">
			    <c:set var="i" value="${val.index}"/>
			        var marker${i} = new naver.maps.Marker({
			            position: new naver.maps.LatLng(${item.location_x}, ${item.location_y}),
			            icon: {
			                url: '${path}/resources/img/marker.png',
			                origin: new naver.maps.Point(0, 0),
			                anchor: new naver.maps.Point(11, 35)
			            }
			        });
		  			// 마크 클릭시 인포윈도우 오픈
					var infowindow${i} = new naver.maps.InfoWindow({
						content: '${item.tour_name}'
					});
		  			
					markers.push(marker${i});
					
					naver.maps.Event.addListener(marker${i}, "click", function(e) {
						if (infowindow${i}.getMap()) {
						  infowindow${i}.close();
						} else {
						  infowindow${i}.open(map, marker${i});
						  window.setTimeout(function () { infowindow${i}.close(); }, 2000);//2초뒤 정보 사라짐
						}
					});
			    </c:forEach>
		  		
			    var markerClustering = new MarkerClustering({
			        minClusterSize: 2,
			        maxZoom: 8,
			        map: map,
			        markers: markers,
			        disableClickZoom: false,
			        gridSize: 120,
			        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
			        indexGenerator: [10, 100, 200, 500, 1000],
			        stylingFunction: function(clusterMarker, count) {
			        	$(clusterMarker.getElement()).find('div:first-child').text(count); //$() :: jQuery 문법
			        }
			    });
			}// endof onLoad();
		</script><!-- 지도 스크립트 end -->
	
		<script> // Modal, moving, innerHTML(addDiv), map
			//메인 준비되면 인기지역 불러오기
			$(document).ready(function() {
		 		localData('hotlocal');
		 		fetch("psboard_hotPost",{method : 'POST'}).then(res => res.json()).then(data => data.forEach((item) => {postsArea(item,'#ps_posts')}));
		 		fetch("fboard_hotPost",{method : 'POST'}).then(res => res.json()).then(data => data.forEach(item => postsArea(item,'#f_posts')));
			});
		
			// 필요한 정보 불러오기
         	function localData(local) {
				// 지역 초기화
				$('#localData').empty();
				// page 만드는 ajax
				fetch('seg_Data', {method : 'POST', body : local}).then(res => res.json()).then(function(data){
					data.forEach(item => tourSimpleArea(item, local));
					if(local != 'hotlocal'){
	   					$('#local_name').text(local);
	       				$('#myModal').modal();	
					};
		   		});
			}
			
         	// 도 단위 관광지 페이지
         	function tourSimpleArea(item, local){
	      		// 첫번째 모달 페이지
	         	var newDiv = document.createElement('div');//내부 경로
	      		var enTour_name = encodeURI(item.tour_name);//git 경로
	      		var src = 'resources/img/tour/'+item.tour_name;
	      		var git = 'https://github.com/joohohaha/image/blob/master/'+enTour_name;
	      		newDiv.className = 'col-md-4 col-sm-6 portfolio-item';
	      		newDiv.innerHTML = "<a class=\"portfolio-link\" onclick=\"tourDetailData('"+ item.tour_name + "')\">"+
	     			"<img class='img-fluid' src='"+ src +".jpg?raw=true' style='width:400px;height:300px;'></a>"+
	     			"<div class='portfolio-caption'>"+
	     				"<h4>"+item.tour_name+"</h4>"+
	     				"<p class='text-muted'>"+item.div_seg_area+"</p>"+
	     			"</div>";
	     		if(local != 'hotlocal')$('#localData').append(newDiv);else $('#hotlocal').append(newDiv);
	      	}
         	
         	function postsArea(item,posts){
         		var newli = document.createElement('li');
         		newli.className = 'list-group-item';
         		if(posts == '#ps_posts'){
         			newli.innerHTML = "<a href='ps_view?b_num="+item.b_num+"&m_userid=${myID}'>"+item.b_title+"</a>";
         		} else {
         			newli.innerHTML = "<a href='f_view?f_id="+item.f_id+"&m_userid=${myID}'>"+item.f_title+"</a>";
         		}
         		$(posts).append(newli);
         	}
         	
         	// 특정 관광지 정보 가져오기
         	function tourDetailData(tour_name) {
         		// 관광지 초기화
				$('#tour_Data').empty();
				// 관광지 정보 가져오기
				fetch("tour_data",{method : 'POST', body : tour_name}).then(res => res.text()).then(function(data){
					tourDetailArea(data);
       				tourReply(tour_name);
       				$('#seg_Data').modal();
       			});
         	}
        	
         	// 특정 관광지 페이지
         	function tourDetailArea(tour_data) {
				var data = JSON.parse(tour_data);
         		var replybtn = '', addr = '';
	   			// 세션 유효성 검사
	   			var myID = '${myID}';
	   			if(myID == ''){
	   				replybtn = "<input type='button' class='btn btn-primary' onclick='no_login()' value='submit'>";
	   			} else {
	   				replybtn = "<input type=\"button\" class=\"btn btn-primary\" onclick=\"sendReply('"+data.tour_name+"')\" value=\"submit\">";
	   			}
				// 유효성 검사
     			if(data.addr_street == '')addr = data.addr_street;else addr = data.addr_location;
				// 두번째 모달 페이지(관광지 소개 페이지)
	      		var tourData = document.createElement('div');
	      		tourData.className = "col-lg-8 mx-auto";
	      		tourData.innerHTML = "" + 
					"<div class='modal-body'>"+
						"<h2 class='text-uppercase'>"+data.tour_name+"</h2>"+
						"<p class='item-intro text-muted'>" + addr +"</p>"+
							"<div id='map_local' style='width: 500px; height: 500px; margin:0 auto;'></div>"+
						"<p>"+data.tour_info+"</p>"+
						"<ul class='list-inline'>"+
							"<li>등록 일자 : "+data.st_date+"</li>"+
							"<li>관리기관 전화번호: "+data.tour_com_tel+"</li>"+
							"<li>관리기관명: "+data.tour_com_name+"</li>"+
							"<li>수용인원 수: "+data.ca_peo+" 명</li>"+
							"<li>주차가능 수: "+data.ca_car+" 대</li>"+
						"</ul>"+
						"<a class='btn btn-success' data-toggle='modal' href='#seg_Data' type='submit'>"+
							"<i class='fa fa-times'></i>Close Project"+
						"</a>"+
						"<div class='card my-4'>"+
							"<h5 class='card-header'>Leave a Comment:</h5>"+
							"<div class='card-body'>"+
								"<div class='form-group'>"+
									"<textarea class='form-control' id='replyData' rows='3'></textarea>"+
								"</div>" + replybtn +
							"</div>"+
						"</div>"+
						"<div id='reply'></div>"+
					"</div>";
				//페이지 생성
		      	document.getElementById('tour_Data').prepend(tourData);
	      		
	      		// 맵 선언
				var map_local = new naver.maps.Map('map_local', {
				    	center: new naver.maps.LatLng(data.location_x, data.location_y),
				    	mapTypeId: naver.maps.MapTypeId.HYBRID,
				        zoom: 8
				});
				// 마커 선언
		    	var marker_ch = new naver.maps.Marker({
		            position: new naver.maps.LatLng(data.location_x, data.location_y),
			    	map: map_local
		        });
			}
         	
         	function no_login(){
				alert('로그인 후 사용 가능합니다.');
				var cont = $('#replyData'); 
				cont.val('');
				cont.focus();
			}
         	
         	// 특정 관광지의 덧글 삭제
         	function delReply(r_num, tour_name){
         		var data = { "r_num" : r_num, "tour_name" : tour_name };
         		refreshReply('delete_reply', JSON.stringify(data), tour_name);
			}
         	
         	// 특정 관광지의 덧글 삽입
			function sendReply(tour_name){
         		var cont = $('#replyData');
         		var data = {
         			"tour_name" : tour_name,
         			"m_userid" : '${myID}',
         			"r_content" : cont.val()
         		};
         		cont.val('');
         		refreshReply('send_reply', JSON.stringify(data), tour_name);
			}
         	
         	// 특정 관광지의 덧글 삽입,삭제 -> 덧글호출 함수 실행
         	function refreshReply(url, data, tour_name){
         		fetch(url, {method : 'POST', body : data}).then(res => res.text()).then(function(data){
       				if(data == 'success')tourReply(tour_name);
       			});
         	}
         	
         	// 특정 관광지의 덧글 호출
         	function tourReply(tour_name) {
         		// 덧글 초기화
         		$('#reply').empty();
	         	// 덧글 정보 가져오기
	         	fetch("tour_reply",{method : 'POST', body : tour_name}).then(res => res.text()).then(function(data){
	         		var result = JSON.parse(data);
       				result.forEach(item => replyArea(item));
       			});
			}
         	
         	// 특정 관광지의 덧글
			function replyArea(data) {  //append
			    var replyDiv = document.createElement("div");
				var img_tag = '';
				if(data.m_userid == '${myID}'){ // 본인 글 일 때 지울 수 있게 만들기
					img_tag = "<a onclick=\"delReply(" + data.r_num + ",'" + data.tour_name + "')\"><img class=\"d-flex mr-3 rounded-circle\" src=\"resources/img/clear.png\"></a>";	
				} else {						// 남의 글 일 때
					img_tag = "<img class='d-flex mr-3 rounded-circle' src='resources/img/reply.png'>";
				}
				
				replyDiv.className = 'media mb-4';
				replyDiv.innerHTML = "<div class='media mb-4'>"+img_tag+"<div class='media-body'><h5 class='mt-0'>" + data.m_userid + "</h5>" + data.r_content + "</div></div>";
			    
			    document.getElementById('reply').prepend(replyDiv); //appendChild(newDIv); 
		  	}
		</script>
	</body>
</html>
