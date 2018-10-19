<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="portfolio-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container">
				<div class="row">
					<div class="mx-auto">
						<div class="modal-body">
							<!-- Project Details Go Here -->
							<h2 class="text-uppercase" id="local_name">localInfo</h2>
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
								<div class="row" id="localData"></div>
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
<div class="portfolio-hover">
	<div class="portfolio-hover-content"></div>
	<div class="portfolio-modal modal fade" id="seg_Data" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row" id="tour_Data"></div>
				</div>
			</div>
		</div>
	</div>
</div>