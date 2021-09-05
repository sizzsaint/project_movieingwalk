<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="./../../css/index.css" rel ="stylesheet" type="text/css">
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
	if(e.value == "u_date"){
		location.href='/mInfo_udateSort'
	}
	else if(e.value == "u_name"){
		location.href='/mInfo_unameSort'
	}
	else{
		location.href='/mInfo_uidxSort'
	}
}
</script>

<section>
	<table>
		<tr>
			<td width="15%"><h1>회원목록</h1></td>
			<td width="69%">
			<!-- 검색창 -->
 				<div class="search">
    				<input type="text" placeholder="아이디를 검색하세요.">
    				<a href="#"><i class="fas fa-search fa-2x"></i></a>
				</div>
			</td>
			<td width="15%">
				<div style="text-align: center">
					<h3>정렬 방식</h3>
					<select name="sort" id="sort" onchange="sortChange(this)">
						<option selected>--정렬방식--</option>
						<option value="u_date">등록날짜</option>
						<option value="u_name">회원명</option>
						<option value="u_id">아이디</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	
	<form id="frm" method="GET" action="/deleteMember"  >
	<!-- content 테이블 -->
	<table>
		<tr style="text-align: center; font-weight: bold;">
			<td>아이디</td><!-- u_id-->
			<td>이름</td><!-- u_name-->
			<td>성별</td><!-- u_sex-->
			<td>생년월일</td><!-- u_age -->
			<td>이메일</td><!-- u_email-->
			<td>연락처</td><!-- u_phone -->
			<td>가입일</td><!-- u_date -->
			<td>관리자 유무</td><!-- u_admin-->
			<td>회원 삭제</td>
		</tr>
		<c:forEach items="${membersInfo}" var="info" varStatus="status">
		<tr> 
			<td>${info.u_id}</td><!-- u_id-->
			<td>${info.u_name}</td><!-- u_name-->
			<td>${info.u_sex}</td><!-- u_sex-->
			<td>${info.u_age}</td><!-- u_age -->
			<td>${info.u_email}</td><!-- u_email-->
			<td>${info.u_phone}</td><!-- u_phone -->
			<td>${info.u_date}</td><!-- u_date -->
			<td>${info.u_admin}</td><!-- u_admin-->
			<td>
	 		
			<input type="submit" name="u_id" id="u_id" value="${info.u_id}"/>
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</section>

</body>
</html>