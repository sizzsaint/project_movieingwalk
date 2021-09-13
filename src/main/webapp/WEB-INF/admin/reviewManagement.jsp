<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
﻿<!-- css -->
<link href="./../../css/adSection.css" rel="stylesheet" type="text/css">

<script src="https://kit.fontawesome.com/8eb5905426.js"></script>

<style>
table{
	padding:0;
	margin:0;
}
</style>

</head>
<body>
<!-- adHeader고정 -->
<jsp:include page="./adHeader.jsp"/>
<!-- adAside(좌측)고정 -->
<jsp:include page="./adAside.jsp"/>

<script type="text/javascript">
function sortChange(e){
	if(e.value == "r_star"){
		location.href='/rInfo_rstarSort'
	}
	else if(e.value == "r_date"){
		location.href='/rInfo_rdateSort'
	}
	else if(e.value == "r_likes"){
		location.href='/rInfo_rlikesSort'
	}
	else if(e.value == "r_hits"){
		location.href='/rInfo_rhitsSort'
	}
	else{
		location.href='/rInfo_rcommentsSort'
	}
}
</script>

<section class="adSection">
	<table>
		<tr>
			<td width="15%"><h1>리뷰목록</h1></td>
			<td width="69%">
			<!-- 검색창 -->
 				<div class="search">
    				<input type="text" placeholder="검색하세요.">
    				<a href="#"><i class="fas fa-search fa-lg"></i></a>
				</div>
			</td>
			<td width="15%">
				<div style="text-align: center">
					<h3>정렬 방식</h3>
					<select name="sort" id="sort" onchange="sortChange(this)">
						<option selected>--정렬방식--</option>
						<option value="r_star">리뷰별 수</option>
						<option value="r_date">등록날짜</option>
						<option value="r_likes">좋아요 수</option>
						<option value="r_hits">조회수</option>
						<option value="r_comments">댓글 수</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	
	<form id="frm" method="GET" action="/deleteReview">
	<!-- content 테이블 -->
	<table>
		<tr style="text-align: center; font-weight: bold;">
			<td>리뷰번호</td><!-- r_idx-->
			<td>회원아이디</td><!-- u_id -->
			<td>리뷰별 수</td><!-- r_star-->
			<td>등록일</td><!-- r_date-->
			<td>좋아요 수</td><!-- r_likes-->
			<td>조회 수</td><!-- r_hits-->
			<td>댓글 수</td><!-- r_comments-->
			<td>리뷰 삭제</td>
		</tr>
		<c:forEach items="${reviewsInfo}" var="info">
		<tr> 
			<td>${info.r_idx}</td>
			<td>${info.u_id}</td>
			<td>${info.r_star}</td>
			<td>${info.r_date}</td>
			<td>${info.r_likes}</td>
			<td>${info.r_hits}</td>
			<td>${info.r_comments}</td>
			<td>
				<input type="submit" name="r_idx" id="r_idx" value="${info.r_idx }">
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</section>

</body>
</html>