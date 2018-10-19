<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<div class="nav-wrapper">
		<a href="#" class="brand-logo">Logo</a>
		<ul id="nav-mobile" class="right hide-on-med-and-down">
			<li><a href="index">홈페이지 이동</a></li>
			<c:if test="${!empty admin}">
				<li><a href="admin/logout">logout</a></li>
			</c:if>
		</ul>
	</div>
</nav>