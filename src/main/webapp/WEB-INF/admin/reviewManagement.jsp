<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="./../../css/adSection.css" rel ="stylesheet" type="text/css">
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
	if(e.value == "r_idx"){
		location.href='/rInfo_ridxSort'
	}
	else{
		location.href='/rInfo_rdateSort'
	}
}
</script>

<section>
	<table>
		<tr>
			<td width="15%"><h1>리뷰목록</h1></td>
			<td width="69%">
			<!-- 검색창 -->
 				<div class="search">
    				<input type="text" placeholder="검색하세요.">
    				<a href="#"><i class="fas fa-search fa-2x"></i></a>
				</div>
			</td>
			<td width="15%">
				<div style="text-align: center">
					<h3>정렬 방식</h3>
					<select name="sort" id="sort" onchange="sortChange(this)">
						<option selected>--정렬방식--</option>
						<option value="r_idx">리뷰번호</option>
						<option value="r_date">등록날짜</option>
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
			<td>영화명</td><!-- m_title -->
			<td>개봉일</td><!-- m_date-->
			<td>회원아이디</td><!-- u_idx-->
			<td>등록날짜</td><!-- r_date-->
			<td>등록내용</td><!-- r_comments-->
			<td></td>
		</tr>
		<c:forEach items="${reviewsInfo}" var="info">
		<tr> 
			<td>${info.r_idx}</td>
			<td>${info.m_title}</td>
			<td>${info.m_date}</td>
			<td>${info.u_idx}</td>
			<td>${info.r_date}</td>
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