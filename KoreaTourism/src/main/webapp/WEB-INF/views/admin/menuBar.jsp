<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Grey navigation panel -->
<c:set var="path" value="<%= request.getContextPath()%>"/>
<ul id="nav-mobile" class="sidenav sidenav-fixed" style="transform: translateX(0px);">
	<li class="logo">
	<a id="logo-container" href="${path}/admin" class="brand-logo">
	<object id="front-page-logo" type="image/svg+xml" data="resources/img/travel.svg">KoreanTourism Management Page</object>
	</a>
	</li>
	<li class="version">
		<a href="#" data-target="version-dropdown" class="dropdown-trigger">
			<font style="vertical-align: inherit;">
				<font style="vertical-align: inherit;">1.0.0</font>
			</font>
			<svg class="caret" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
			<path d="M7 10l5 5 5-5z"></path>
			<path d="M0 0h24v24H0z" fill="none"></path>
			</svg>
		</a>
		<ul id="version-dropdown" class="dropdown-content" tabindex="0">
			<li tabindex="0">
				<a>
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">1.0.0</font>
					</font>
				</a>
			</li>
		</ul>
	</li>
	<li class="search">
		<div class="search-wrapper">
			<input id="search" placeholder="Search">
				<i class="material-icons">search</i>
			<div class="search-results"></div>
		</div>
	</li>
	<li class="no-padding">
		<ul class="collapsible collapsible-accordion">
			<li class="bold">
				<a class="collapsible-header waves-effect waves-teal" tabindex="0" href="${path}/adminPSM">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">후기게시판 관리</font>
					</font>
				</a>
			</li>
			<li class="bold">
				<a class="collapsible-header waves-effect waves-teal" tabindex="0" href="${path}/adminFM">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">자유게시판 관리</font>
					</font>
				</a>
			</li>
			<li class="bold">
				<a class="collapsible-header waves-effect waves-teal" tabindex="0" href="${path}/adminMM">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">회원 관리</font>
					</font>
				</a>
			</li>
			<li class="bold">
				<a class="collapsible-header waves-effect waves-teal" tabindex="0" href="${path}/adminTM">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">관광지 관리</font>
					</font>
				</a>
			</li>
		</ul>
	</li>
</ul>