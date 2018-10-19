<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="item" items="${mainlist}" varStatus="view">
	<c:set var="i" value="${view.count}"/>
	<div class="portfolio-hover">
		<div class="portfolio-hover-content"></div>

		<!-- Modal 경상도 세부 1 -->
		<div class="portfolio-modal modal fade" id="hotlocal${i}" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="container">
						<div class="row">
							<div class="col-lg-8 mx-auto">
								<div class="modal-body">
									<!-- Project Details Go Here -->
									<h2 class="text-uppercase">${item.tour_name}</h2>
									<p class="item-intro text-muted">Lorem ipsum dolor sitamet consectetur.</p>
									<div id="map_hot${i}"></div>
									<p>${item.tour_info}</p>
									<ul class="list-inline">
										<li>Date: ${item.st_date}</li>
										<li>Client: Explore</li>
										<li>Category: Graphic Design</li>
									</ul>
									<button class="btn btn-primary" data-dismiss="modal" type="button">
										<i class="fa fa-times"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script>
		var map_hot${i} = new naver.maps.Map("map_hot${i}", {
		    	center: new naver.maps.LatLng(${item.location_x},${item.location_y}),
		    	size: new naver.maps.Size(500, 500),
		    	mapTypeId: naver.maps.MapTypeId.HYBRID,
		        zoom: 8
		    }),	
	       	marker_hot${i} = new naver.maps.Marker({
	            position: new naver.maps.LatLng(${item.location_x},${item.location_y}),
		    	map: map_hot${i}
	        }),
	        info_hot${i} = new naver.maps.InfoWindow({
			content: '<div>${item.tour_name}</div>'
			});
        info_hot${i}.open(map_hot${i}, marker_hot${i}); 
	</script>
</c:forEach>