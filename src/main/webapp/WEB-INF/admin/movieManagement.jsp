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
	if(e.value == "m_date"){
		location.href='/mInfo_mdateSort'
	}
	else if(e.value == "m_title"){
		location.href='/mInfo_mtitleSort'
	}
	else{
		location.href='/mInfo_midxSort'
	}
}
</script>

<section>
	<table>
		<tr>
			<td width="15%"><h1>영화목록</h1></td>
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
						<option value="m_date">개봉일</option>
						<option value="m_title">영화명</option>
						<option value="m_idx">영화코드</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	
	<form id="frm" method="GET" action="/deleteMovie">
	<!-- content 테이블 -->
	<table>
		<tr style="text-align: center; font-weight: bold;">
			<td>영화코드</td><!-- m_idx-->
			<td>영화명</td><!-- m_title -->
			<td>개봉일</td><!-- m_date-->
			<td>영화 삭제</td>
		</tr>
		<c:forEach items="${moviesInfo}" var="info">
		<tr> 
			<td>${info.m_idx}</td>
			<td>${info.m_title}</td>
			<td>${info.m_date}</td>
			<td>
				<input type="submit" name="m_title" id="m_title" value="${info.m_title }">
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</section>

</body>
</html>